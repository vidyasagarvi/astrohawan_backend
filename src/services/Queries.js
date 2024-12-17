import connection from '../db/Connection.js';
import Queries from '../models/Queries.js';
import { v4 as uuidv4 } from 'uuid';

class QueriesService {
  async add(QueriesData) {

    const QueriesId = uuidv4();
    const Query = new Queries(QueriesId, QueriesData.name, QueriesData.email, QueriesData.mobile_no, QueriesData.message);
    return new Promise((resolve, reject) => {
      connection.query(
        'INSERT INTO queries (id, name , email,  mobile_no, message) VALUES (?, ?, ?, ?, ?)',
        [Query.id, Query.name, Query.email, Query.mobile_no, Query.message],
        (err) => {
          if (err) return reject(err);
          resolve(Query);
        }
      );
    });
  }

}

export default new QueriesService();
