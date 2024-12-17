// src/services/mandir/MandirProductService.js
import connection from '../../db/Connection.js';
import { v4 as uuidv4 } from 'uuid';

class HelpsProductService {
    addHelpsNeedyProduct(productData) {

        const id = uuidv4();
        const { images, price, translations } = productData;

        return new Promise((resolve, reject) => {
            connection.beginTransaction(err => {
                if (err) return reject(err);

                connection.query('INSERT INTO helps_products (id, images, price) VALUES (?, ?, ?)', [id, JSON.stringify(images),price] , (err, result) => {
                    if (err) {
                        return connection.rollback(() => reject(err));
                    }

                    const translationPromises = translations.map(translation => {
                        return new Promise((resolve, reject) => {
                            connection.query(
                                `INSERT INTO helps_products_translations (id, helps_id, language_code, title, description)
                                 VALUES (UUID(), ?, ?, ?, ?)`,
                                [id, translation.language_code, translation.title, translation.description],
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
                });
            });
        });
    }


    async getHelpsNeedyProducts(languageCode) {
        return new Promise((resolve, reject) => {
            const query = `
                SELECT h.id, h.images, h.price, ht.language_code, ht.title, ht.description
                FROM helps_products h
                JOIN helps_products_translations ht ON h.id = ht.helps_id
                WHERE ht.language_code = ?
            `;
            connection.query(query, [languageCode], (err, results) => {
                if (err) {
                    return reject(err);
                }
                resolve(results);
            });
        });
    }


}

export default new HelpsProductService();
