// src/services/mandir/MandirProductService.js
import connection from '../../db/Connection.js';
import { v4 as uuidv4 } from 'uuid';

class MandirProductService {
    addMandirProduct(productData) {

        const id = uuidv4();
        const { images, price, translations } = productData;

        return new Promise((resolve, reject) => {
            connection.beginTransaction(err => {
                if (err) return reject(err);

                connection.query('INSERT INTO mandir_products (id, images, price) VALUES (?, ?, ?)', [id, JSON.stringify(images),price] , (err, result) => {
                    if (err) {
                        return connection.rollback(() => reject(err));
                    }

                    const translationPromises = translations.map(translation => {
                        return new Promise((resolve, reject) => {
                            connection.query(
                                `INSERT INTO mandir_products_translations (id, product_id, language_code, title, description)
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


    async getAllMandirProducts(languageCode) {
        return new Promise((resolve, reject) => {
            const query = `
                SELECT m.id, m.images, m.price, mt.language_code, mt.title, mt.description
                FROM mandir_products m
                JOIN mandir_products_translations mt ON m.id = mt.product_id
                WHERE mt.language_code = ?
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

export default new MandirProductService();
