import { v4 as uuidv4 } from 'uuid';
import connection from '../db/Connection.js';
import PujaStoreProduct from '../models/PujaStoreProduct.js';
import Category from '../models/Category.js';


class PujaStoreService {
  addpujaStoreProduct(productData) {

    const productId = uuidv4();



    const product = new PujaStoreProduct(productId, productData.images, productData.price, productData.categoryId, productData.translations);

    console.log('on the service',product);

    const productQuery = 'INSERT INTO pujastore (id, images, price,category_id) VALUES (?, ?, ?, ?)';
    const translationQuery = 'INSERT INTO pujastore_translations (pujastore_id, language_code, title, description) VALUES (?, ?, ?, ?)';

    return new Promise((resolve, reject) => {
      connection.beginTransaction((err) => {
        if (err) return reject(err);

        connection.query(
          productQuery,
          [product.id, JSON.stringify(product.images), product.price,product.categoryId],
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
    console.log(languageCode);

    const query = `
      SELECT c.id AS category_id, ct.name AS category_name, p.id, pt.title, pt.description, p.images, p.price
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
          const product = new PujaStoreProduct(row.id, JSON.parse(row.images), row.price, [{
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

  getpujaStoreProductById(id, languageCode) {
    const query = `
      SELECT p.id, pt.title, pt.description, p.images, p.price
      FROM pujastore p
      JOIN pujastore_translations pt ON p.id = pt.pujastore_id
      WHERE p.id = ? AND pt.language_code = ?
    `;

    return new Promise((resolve, reject) => {
      connection.query(query, [id, languageCode], (err, results) => {
        if (err) return reject(err);
        if (results.length === 0) return resolve(null);
        const row = results[0];
        const product = new PujaStoreProduct(row.id, JSON.parse(row.images), row.price, [{
          language_code: languageCode,
          title: row.title,
          description: row.description
        }]);
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
