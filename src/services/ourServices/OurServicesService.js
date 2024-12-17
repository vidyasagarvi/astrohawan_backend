import connection from '../../db/Connection.js';
import { v4 as uuidv4 } from 'uuid';

class OurServicesService {
    async addServices(servicesData) {
        const id = uuidv4();
        const { images, translations, benefits } = servicesData;

        try {
            await connection.promise().beginTransaction();

            // Insert mandir
            await connection.promise().query('INSERT INTO our_services (id, images) VALUES (?, ?)', [id, JSON.stringify(images)]);

            // Insert translations
            const translationPromises = translations.map(translation => {
                return connection.promise().query(
                    `INSERT INTO service_translations (id, 	service_id, language_code, title, description)
                     VALUES (UUID(), ?, ?, ?, ?)`,
                    [id, translation.language_code, translation.title, translation.description]
                );
            });

            // Insert benefits and their translations
            const benefitPromises = benefits.map(async (benefit) => {
                // Insert into service_benefits
                const benefitId = uuidv4(); // Generate a new UUID for the benefit
                await connection.promise().query(
                    'INSERT INTO service_benefits (id, service_id) VALUES (?, ?)',
                    [benefitId, id]
                );

                // Insert benefit translations
                const benefitTranslationPromises = benefit.translations.map(translation => {
                    return connection.promise().query(
                        `INSERT INTO service_benefits_translations (id, benefit_id, language_code, benefit_description)
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


    async getAllService(languageCode) {
        return new Promise((resolve, reject) => {
            const query = `
                SELECT 
                    s.id as service_id, 
                    s.images, 
                    st.language_code, 
                    st.title, 
                    st.description,
                    sb.id as benefit_id,
                    sbt.language_code as benefit_language_code,
                    sbt.benefit_description
                FROM our_services s
                JOIN service_translations st ON s.id = st.service_id
                LEFT JOIN service_benefits sb ON s.id = sb.service_id
                LEFT JOIN service_benefits_translations sbt ON sb.id = sbt.benefit_id AND sbt.language_code = ?
                WHERE st.language_code = ?
            `;


            connection.query(query, [languageCode, languageCode], (err, results) => {
                if (err) {
                    return reject(err);
                }

                // Structure the results
                const services = {};
                results.forEach(row => {
                    if (!services[row.service_id]) {
                        services[row.service_id] = {
                            id: row.service_id,
                            images: JSON.parse(row.images),
                            translations: {
                                language_code: row.language_code,
                                title: row.title,
                                description: row.description,
                            },
                            benefits: []
                        };
                    }
                    
                    if (row.benefit_id) {
                        services[row.service_id].benefits.push({
                            id: row.benefit_id,
                            language_code: row.benefit_language_code,
                            description: row.benefit_description,
                        });
                    }
                });

                resolve(Object.values(services));
            });
        });
    }



    async getServicesById(serviceId, languageCode, defaultLanguage = 'en') {
        return new Promise((resolve, reject) => {
            const query = `
                SELECT 
                    s.id as service_id, 
                    s.images, 
                    st.language_code, 
                    st.title, 
                    st.description,
                    sb.id as benefit_id,
                    sbt.language_code as benefit_language_code,
                    sbt.benefit_description
                FROM our_services s
                JOIN service_translations st ON s.id = st.service_id AND st.language_code = ?
                LEFT JOIN service_benefits sb ON s.id = sb.service_id
                LEFT JOIN service_benefits_translations sbt ON sb.id = sbt.benefit_id AND sbt.language_code = ?
                WHERE s.id = ?
            `;

            connection.query(query, [languageCode, languageCode, serviceId], (err, results) => {
                if (err) {
                    return reject(err);
                }

                if (results.length === 0) {
                    // If no results found for the specified language, try with the default language
                    connection.query(query, [defaultLanguage, defaultLanguage, serviceId], (err, defaultResults) => {
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
        const services = {
            id: results[0].service_id,
            images: JSON.parse(results[0].images),
            translations: {
                language_code: results[0].language_code,
                title: results[0].title,
                description: results[0].description,
            },
            benefits: []
        };

        results.forEach(row => {
            if (row.benefit_id) {
                services.benefits.push({
                    id: row.benefit_id,
                    language_code: row.benefit_language_code,
                    description: row.benefit_description,
                });
            }
        });

        return services;
    }


}

export default new OurServicesService();
