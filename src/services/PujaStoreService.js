import { v4 as uuidv4 } from 'uuid';
import connection from '../db/Connection.js';
import PujaStoreProduct from '../models/PujaStoreProduct.js';
import PujaStoreProductSingle from '../models/PujaStoreProductSingle.js';
import Category from '../models/Category.js';


class PujaStoreService {
  addpujaStoreProduct(productData) {

    const productId = uuidv4();

    const product = new PujaStoreProduct(productId, productData.images, productData.price,  productData.discount, productData.categoryId, productData.translations);

    const productQuery = 'INSERT INTO pujastore (id, images, price,discount,category_id) VALUES (?, ?, ?, ?, ?)';
    const translationQuery = 'INSERT INTO pujastore_translations (pujastore_id, language_code, title, description) VALUES (?, ?, ?, ?)';

    return new Promise((resolve, reject) => {
      connection.beginTransaction((err) => {
        if (err) return reject(err);

        connection.query(
          productQuery,
          [product.id, JSON.stringify(product.images), product.price,product.discount,product.categoryId],
          (err) => {
            if (err) {
              return connection.rollback(() => reject(err));
            }

            const translationPromises = product.translations.map((translation) => {
              return new Promise((resolve, reject) => {
                connection.query(
                  translationQuery,
                  [product.id, translation.language_code, translation.title, translation.description],
                  (err) => {
                    if (err) return reject(err);
                    resolve();
                  }
                );
              });
            });

            Promise.all(translationPromises)
              .then(() => {
                connection.commit((err) => {
                  if (err) {
                    return connection.rollback(() => reject(err));
                  }
                  resolve(product);
                });
              })
              .catch((err) => {
                connection.rollback(() => reject(err));
              });
          }
        );
      });
    });
  }

  getAllpujaStoreProduct(languageCode) {

    const query = `
      SELECT c.id AS category_id, ct.name AS category_name, p.id, pt.title, pt.description, p.images, p.price, p.discount
      FROM pujastore p
      JOIN pujastore_translations pt ON p.id = pt.pujastore_id
      JOIN categories c ON p.category_id = c.id
      JOIN category_translations ct ON c.id = ct.category_id
      WHERE pt.language_code = ? AND ct.language_code = ?
      ORDER BY c.id, p.id
    `;

    return new Promise((resolve, reject) => {
      connection.query(query, [languageCode, languageCode], (err, results) => {
        if (err) return reject(err);

        // Group products by category
        const categories = {};
        results.forEach(row => {
          if (!categories[row.category_id]) {
            categories[row.category_id] = new Category(row.category_id, [{
              language_code: languageCode,
              name: row.category_name
            }], []);
          }
          const product = new PujaStoreProduct(row.id, JSON.parse(row.images), row.price, row.discount, [{
            language_code: languageCode,
            title: row.title,
            description: row.description
          }]);
          categories[row.category_id].products.push(product);
        });

        // Convert categories object to an array
        const groupedProducts = Object.values(categories);

        resolve(groupedProducts);
      });
    });
  }




  getAllpujaStoreProducts(languageCode, page = 1, limit = 10, categoryId = null, searchQuery = null) {
    const offset = (page - 1) * limit;
    let baseQuery = `
      FROM pujastore p
      JOIN pujastore_translations pt ON p.id = pt.pujastore_id
      JOIN categories c ON p.category_id = c.id
      JOIN category_translations ct ON c.id = ct.category_id
      WHERE pt.language_code = ? AND ct.language_code = ?
    `;

    const params = [languageCode, languageCode];

    if (categoryId) {
        baseQuery += ' AND c.id = ?';
        params.push(categoryId);
    }

    if (searchQuery) {
        baseQuery += ' AND pt.title LIKE ?';
        params.push(`%${searchQuery}%`);
    }

    const query = `
      SELECT c.id AS category_id, ct.name AS category_name, p.id, pt.title, pt.description, p.images, p.price, p.discount,p.status
      ${baseQuery}
      ORDER BY c.id, p.id
      LIMIT ? OFFSET ?
    `;
    params.push(limit, offset);

    const countQuery = `SELECT COUNT(*) AS total ${baseQuery}`;

    return new Promise((resolve, reject) => {
        connection.query(countQuery, params.slice(0, -2), (countErr, countResults) => {
            if (countErr) {
                console.error('Count query error:', countErr);
                return reject(countErr);
            }

            const total = countResults[0].total;

            connection.query(query, params, (err, results) => {
                if (err) {
                    console.error('Main query error:', err);
                    return reject(err);
                }

                // Group products by category
                const categories = {};
                results.forEach(row => {
                    if (!categories[row.category_id]) {
                        categories[row.category_id] = new Category(row.category_id, [{
                            language_code: languageCode,
                            name: row.category_name
                        }]);
                    }
                    const product = new PujaStoreProductSingle(
                        row.id,
                        JSON.parse(row.images),
                        row.price,
                        row.discount,
                        row.status,
                        [{
                            language_code: languageCode,
                            title: row.title,
                            description: row.description
                        }]
                    );
                    categories[row.category_id].addProduct(product);
                });

                // Convert categories object to an array
                const groupedProducts = Object.values(categories);

                resolve({ total, page, limit, groupedProducts });
            });
        });
    });
}



  getpujaStoreProductById(id, languageCode) {
    const query = `
      SELECT p.id, pt.title, pt.description, p.images, p.price, p.discount, p.status, c.id as category_id, ct.name as category_name
      FROM pujastore p
      JOIN pujastore_translations pt ON p.id = pt.pujastore_id
      JOIN categories c ON p.category_id = c.id
      JOIN category_translations ct ON c.id = ct.category_id AND ct.language_code = pt.language_code
      WHERE p.id = ? AND pt.language_code = ?
    `;

    return new Promise((resolve, reject) => {
      connection.query(query, [id, languageCode], (err, results) => {
        if (err) return reject(err);
        if (results.length === 0) return resolve(null);
        const row = results[0];
        const product = new PujaStoreProductSingle(
          row.id,
          JSON.parse(row.images),
          row.price,
          row.discount,
          row.status,
          [{
            language_code: languageCode,
            title: row.title,
            description: row.description
          }],
          {
            id: row.category_id,
            name: row.category_name
          }
        );
        resolve(product);
      });
    });
  }

  
  deletepujaStoreProduct(id) {
    const deleteTranslationsQuery = 'DELETE FROM pujastore_translations WHERE pujastore_id = ?';
    const deleteProductQuery = 'DELETE FROM pujastore WHERE id = ?';

    return new Promise((resolve, reject) => {
      connection.beginTransaction((err) => {
        if (err) return reject(err);

        connection.query(deleteTranslationsQuery, [id], (err, results) => {
          if (err) {
            return connection.rollback(() => reject(err));
          }

          connection.query(deleteProductQuery, [id], (err, results) => {
            if (err) {
              return connection.rollback(() => reject(err));
            }

            connection.commit((err) => {
              if (err) {
                return connection.rollback(() => reject(err));
              }
              resolve(results.affectedRows > 0);
            });
          });
        });
      });
    });
  }
}

export default new PujaStoreService();
