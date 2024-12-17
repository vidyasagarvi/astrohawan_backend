import connection from '../db/Connection.js';
import Category from '../models/Category.js';
import { v4 as uuidv4 } from 'uuid';

class CategoryService {
    addCategory(categoryData) {
        const categoryId = uuidv4();
        const category = new Category(categoryId, categoryData.translations);


        return new Promise((resolve, reject) => {
            connection.beginTransaction(err => {
                if (err) {
                    console.error('Transaction start error:', err);
                    return reject(err);
                }

                connection.query(
                    'INSERT INTO categories (id) VALUES (?)',
                    [categoryId],
                    err => {
                        if (err) {
                            console.error('Error inserting into categories:', err);
                            return connection.rollback(() => reject(err));
                        }

                        const translationPromises = category.translations.map(translation => {
                            return new Promise((resolve, reject) => {
                                connection.query(
                                    'INSERT INTO category_translations (category_id, language_code, name, description) VALUES (?, ?, ?, ?)',
                                    [categoryId, translation.language_code, translation.name, translation.description],
                                    err => {
                                        if (err) {
                                            console.error('Error inserting into category_translations:', err);
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
                                        console.error('Commit error:', err);
                                        return connection.rollback(() => reject(err));
                                    }
                                    resolve(category);
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


    getAllCategories(languageCode) {
        const query = `
            SELECT c.id, ct.language_code, ct.name, ct.description
            FROM categories c
            JOIN category_translations ct ON c.id = ct.category_id
            WHERE ct.language_code = ?
        `;

        return new Promise((resolve, reject) => {
            connection.query(query, [languageCode], (err, results) => {
                if (err) return reject(err);

                const categoriesMap = new Map();

                results.forEach(row => {
                    if (!categoriesMap.has(row.id)) {
                        categoriesMap.set(row.id, new Category(row.id));
                    }
                    const category = categoriesMap.get(row.id);
                    category.addTranslation(row.language_code, row.name, row.description);
                });

                const categories = Array.from(categoriesMap.values());
                resolve(categories);
            });
        });
    }


}

export default new CategoryService();
