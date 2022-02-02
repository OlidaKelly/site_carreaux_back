import dbConnect from '../config/db-config.js';

const getAll = () => {
    return new Promise((resolve, reject) => {
        dbConnect.query('SELECT * FROM about', (err, results) => {
            if (err) reject(err);
            else resolve(results);
        })
    })
}

const getOneById = (id) => {
    return new Promise((resolve, reject) => {
        dbConnect.query('SELECT * FROM about WHERE id = ?', id, (err, result) => {
            if (err) reject(err);
            else resolve(result[0]);
        })
    })
}

const updateAbout = (about) => {
    const { name, phone, email, description, location, id } = about;
    return new Promise((resolve, reject) => {
        dbConnect.query('UPDATE about SET name = ?, phone = ?, email = ?, description = ?, location = ? WHERE id = ?',
        [name, phone, email, description, location, id], (err, result) => {
            if (err) reject(err);
            else resolve(result);
        })
    })
}

export default { getAll, getOneById, updateAbout };