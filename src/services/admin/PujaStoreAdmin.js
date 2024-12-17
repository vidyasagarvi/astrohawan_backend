import connection from '../../db/Connection.js';
import PujaStoreProduct from '../../models/PujaStoreProductSingle.js';



class PujaStoreAdmin {
  
    getPujaStoreProductByIdWithAllTranslations(id) {
        const query = `
            SELECT p.id, p.images, p.price, p.discount, p.category_id,p.status, pt.language_code, pt.title, pt.description, 
                   c.id AS category_id, ct.language_code AS category_language, ct.name AS category_name
            FROM pujastore p
            JOIN pujastore_translations pt ON p.id = pt.pujastore_id
            JOIN categories c ON p.category_id = c.id
            JOIN category_translations ct ON c.id = ct.category_id
            WHERE p.id = ?
        `;

        return new Promise((resolve, reject) => {
            connection.query(query, [id], (err, results) => {
                if (err) return reject(err);
                if (results.length === 0) return resolve(null);

                const productTranslations = [];
                const categoryTranslations = new Map();

                results.forEach(row => {
                    // Process product translations
                    if (!productTranslations.some(translation => translation.language_code === row.language_code)) {
                        productTranslations.push({
                            language_code: row.language_code,
                            title: row.title,
                            description: row.description
                        });
                    }

                    // Process category translations
                    const categoryKey = row.category_language;
                    if (!categoryTranslations.has(categoryKey)) {
                        categoryTranslations.set(categoryKey, {
                            language_code: row.category_language,
                            name: row.category_name
                        });
                    }
                });

                const product = new PujaStoreProduct(
                    results[0].id,
                    JSON.parse(results[0].images),
                    results[0].price,
                    results[0].discount,
                    results[0].status,
                    productTranslations,
                    {
                        id: results[0].category_id,
                        translations: Array.from(categoryTranslations.values())
                    }
                );

                resolve(product);
            });
        });
    }


    updatePujaStoreProduct(id, productData) {
        const {price, discount, translations, categoryId ,status } = productData;

    
        return new Promise((resolve, reject) => {
            connection.beginTransaction(err => {
                if (err) return reject(err);

                // Update product details
                connection.query(
                    'UPDATE pujastore SET price = ?, discount = ?, category_id = ? , status = ? WHERE id = ?',
                    [price, discount, categoryId.id, status ,  id],
                    (err) => {
                        if (err) {
                            return connection.rollback(() => reject(err));
                        }

                        connection.query(
                            `DELETE FROM pujastore_translations WHERE pujastore_id = ?`,
                            [id],
                            (err) => {
                                if (err) {
                                    return reject(err);
                                }
                                resolve();
                            }
                        );


                        // Update translations
                        const translationPromises = translations.map(translation => {
                            return new Promise((resolve, reject) => {

                                connection.query(
                                    `INSERT INTO pujastore_translations (pujastore_id, language_code, title, description)
                                     VALUES (?, ?, ?, ?)`,
                                    [id, translation.language_code, translation.title, translation.description, translation.title, translation.description],
                                    (err) => {
                                        if (err) {
                                            return reject(err);
                                        }
                                        resolve();
                                    }
                                );
                            });
                        });

                        Promise.all(translationPromises)
                            .then(() => {
                                connection.commit(err => {
                                    if (err) {
                                        return connection.rollback(() => reject(err));
                                    }
                                    resolve();
                                });
                            })
                            .catch(err => {
                                connection.rollback(() => reject(err));
                            });
                    }
                );
            });
        });
  
    }

}

export default new PujaStoreAdmin();
