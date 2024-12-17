import connection from '../../db/Connection.js';
import { v4 as uuidv4 } from 'uuid';

class HelpsService {
    async addHelpsNeedy(helpsData) {
        const id = uuidv4();
        const { images, contact_no, translations } = helpsData;

        console.log(helpsData);

        try {
            await connection.promise().beginTransaction();

            // Insert mandir
            await connection.promise().query('INSERT INTO helps_needy_person (id, images , contact_no) VALUES (?, ? , ?)', [id, JSON.stringify(images),contact_no]);

            // Insert translations
            const translationPromises = translations.map(translation => {
                return connection.promise().query(
                    `INSERT INTO helps_needy_person_translations (id, helps_needy_person_id, language_code, name, place, address, title, description)
                     VALUES (UUID(), ?, ?, ?, ?, ? , ? , ?)`,
                    [id, translation.language_code, translation.name, translation.place, translation.address, translation.title, translation.description]
                );
            });

            // Execute all queries
            await Promise.all([...translationPromises]);

            // Commit transaction
            await connection.promise().commit();

            return true; // or whatever success response you need
        } catch (error) {
            // Rollback on error
            await connection.promise().rollback();
            throw error;
        }
    }


    async getAllHelpsNeedy(languageCode) {
        return new Promise((resolve, reject) => {
            const query = `
                SELECT 
                    h.id as helps_needy_person_id, 
                    h.images, 
                    h.contact_no, 
                    ht.language_code, 
                    ht.name, 
                    ht.place, 
                    ht.address, 
                    ht.title, 
                    ht.description
                FROM helps_needy_person h
                JOIN helps_needy_person_translations ht ON h.id = ht.helps_needy_person_id
                WHERE ht.language_code = ?
            `;

            connection.query(query, [languageCode, languageCode], (err, results) => {
                if (err) {
                    return reject(err);
                }

                // Structure the results
                const helps = {};
                results.forEach(row => {
                    if (!helps[row.helps_needy_person_id]) {
                        helps[row.helps_needy_person_id] = {
                            id: row.helps_needy_person_id,
                            images: JSON.parse(row.images),
                            contact_no: row.contact_no,
                            translations: {
                                language_code: row.language_code,
                                name: row.name,
                                place: row.place,
                                address: row.address,
                                title: row.title,
                                description: row.description,
                            }
                        };
                    }
              
                });

                resolve(Object.values(helps));
            });
        });
    }



    async getHelpsNeedyById(helpsId, languageCode, defaultLanguage = 'en') {
        return new Promise((resolve, reject) => {
            const query = `
                  SELECT 
                    h.id as helps_needy_person_id, 
                    h.images, 
                    h.contact_no, 
                    ht.language_code, 
                    ht.name, 
                    ht.place, 
                    ht.address,
                    ht.title,  
                    ht.description
                FROM helps_needy_person h
                JOIN helps_needy_person_translations ht ON h.id = ht.helps_needy_person_id AND ht.language_code = ?
                WHERE h.id = ?
            `;

            connection.query(query, [languageCode, helpsId], (err, results) => {
                if (err) {
                    return reject(err);
                }

                if (results.length === 0) {
                    // If no results found for the specified language, try with the default language
                    connection.query(query, [defaultLanguage, helpsId], (err, defaultResults) => {
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
        const helps = {
            id: results[0].helps_needy_person_id,
            contact_no: results[0].contact_no,
            images: JSON.parse(results[0].images),
            translations: {
                language_code: results[0].language_code,
                name: results[0].name,
                place: results[0].place,
                address: results[0].address,
                title: results[0].title,
                description: results[0].description,
            }
        };

        return helps;
    }


}

export default new HelpsService();
