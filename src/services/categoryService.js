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
}

export default new CategoryService();
