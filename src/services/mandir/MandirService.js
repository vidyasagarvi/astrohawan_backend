import connection from '../../db/Connection.js';
import { v4 as uuidv4 } from 'uuid';

class MandirService {
    async addMandir(mandirData) {
        const id = uuidv4();
        const { images, translations, benefits } = mandirData;

        try {
            await connection.promise().beginTransaction();

            // Insert mandir
            await connection.promise().query('INSERT INTO mandir (id, images) VALUES (?, ?)', [id, JSON.stringify(images)]);

            // Insert translations
            const translationPromises = translations.map(translation => {
                return connection.promise().query(
                    `INSERT INTO mandir_translations (id, mandir_id, language_code, name, place, description)
                     VALUES (UUID(), ?, ?, ?, ?, ?)`,
                    [id, translation.language_code, translation.name, translation.place, translation.description]
                );
            });

            // Insert benefits and their translations
            const benefitPromises = benefits.map(async (benefit) => {
                // Insert into mandir_benefits
                const benefitId = uuidv4(); // Generate a new UUID for the benefit
                await connection.promise().query(
                    'INSERT INTO mandir_benefits (id, mandir_id) VALUES (?, ?)',
                    [benefitId, id]
                );

                // Insert benefit translations
                const benefitTranslationPromises = benefit.translations.map(translation => {
                    return connection.promise().query(
                        `INSERT INTO mandir_benefits_translations (id, benefit_id, language_code, benefit_description)
                         VALUES (UUID(), ?, ?, ?)`,
                        [benefitId, translation.language_code, translation.description]
                    );
                });

                return Promise.all(benefitTranslationPromises);
            });

            // Execute all queries
            await Promise.all([...translationPromises, ...benefitPromises]);

            // Commit transaction
            await connection.promise().commit();

            return true; // or whatever success response you need
        } catch (error) {
            // Rollback on error
            await connection.promise().rollback();
            throw error;
        }
    }


    async getAllMandirs(languageCode) {
        return new Promise((resolve, reject) => {
            const query = `
                SELECT 
                    m.id as mandir_id, 
                    m.images, 
                    mt.language_code, 
                    mt.name, 
                    mt.place, 
                    mt.description,
                    mb.id as benefit_id,
                    mbt.language_code as benefit_language_code,
                    mbt.benefit_description
                FROM mandir m
                JOIN mandir_translations mt ON m.id = mt.mandir_id
                LEFT JOIN mandir_benefits mb ON m.id = mb.mandir_id
                LEFT JOIN mandir_benefits_translations mbt ON mb.id = mbt.benefit_id AND mbt.language_code = ?
                WHERE mt.language_code = ?
            `;

            connection.query(query, [languageCode, languageCode], (err, results) => {
                if (err) {
                    return reject(err);
                }

                // Structure the results
                const mandirs = {};
                results.forEach(row => {
                    if (!mandirs[row.mandir_id]) {
                        mandirs[row.mandir_id] = {
                            id: row.mandir_id,
                            images: JSON.parse(row.images),
                            translations: {
                                language_code: row.language_code,
                                name: row.name,
                                place: row.place,
                                description: row.description,
                            },
                            benefits: []
                        };
                    }
                    
                    if (row.benefit_id) {
                        mandirs[row.mandir_id].benefits.push({
                            id: row.benefit_id,
                            language_code: row.benefit_language_code,
                            description: row.benefit_description,
                        });
                    }
                });

                resolve(Object.values(mandirs));
            });
        });
    }



    async getMandirById(mandirId, languageCode, defaultLanguage = 'en') {
        return new Promise((resolve, reject) => {
            const query = `
                SELECT 
                    m.id as mandir_id, 
                    m.images, 
                    mt.language_code, 
                    mt.name, 
                    mt.place, 
                    mt.description,
                    mb.id as benefit_id,
                    mbt.language_code as benefit_language_code,
                    mbt.benefit_description
                FROM mandir m
                JOIN mandir_translations mt ON m.id = mt.mandir_id AND mt.language_code = ?
                LEFT JOIN mandir_benefits mb ON m.id = mb.mandir_id
                LEFT JOIN mandir_benefits_translations mbt ON mb.id = mbt.benefit_id AND mbt.language_code = ?
                WHERE m.id = ?
            `;

            connection.query(query, [languageCode, languageCode, mandirId], (err, results) => {
                if (err) {
                    return reject(err);
                }

                if (results.length === 0) {
                    // If no results found for the specified language, try with the default language
                    connection.query(query, [defaultLanguage, defaultLanguage, mandirId], (err, defaultResults) => {
                        if (err) {
                            return reject(err);
                        }

                        if (defaultResults.length === 0) {
                            return resolve(null); // No mandir found
                        }

                        // Structure the results with the default language
                        resolve(this._structureMandirResults(defaultResults));
                    });
                } else {
                    // Structure the results
                    resolve(this._structureMandirResults(results));
                }
            });
        });
    }

    _structureMandirResults(results) {
        const mandir = {
            id: results[0].mandir_id,
            images: JSON.parse(results[0].images),
            translations: {
                language_code: results[0].language_code,
                name: results[0].name,
                place: results[0].place,
                description: results[0].description,
            },
            benefits: []
        };

        results.forEach(row => {
            if (row.benefit_id) {
                mandir.benefits.push({
                    id: row.benefit_id,
                    language_code: row.benefit_language_code,
                    description: row.benefit_description,
                });
            }
        });

        return mandir;
    }


}

export default new MandirService();
