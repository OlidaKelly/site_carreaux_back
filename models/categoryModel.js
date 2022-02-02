import dbConnect from "../config/db-config.js";


// READ ALL
const getAll = () => {
    return new Promise((resolve, reject) => {
        dbConnect.query("SELECT * FROM category", (err, results) => {
            if (err) reject(err);
            else resolve(results);
        });
    });
};

// READ ONE
const getOneById = (id) => {
    return new Promise((resolve, reject) => {
        dbConnect.query("SELECT * FROM category WHERE id = ?", id, (err, result) => {
            if (err) reject(err);
            else resolve(result[0]);
        });
    });
};

// DELETE
const deleteById = (id) => {
    return new Promise((resolve, reject) => {
        dbConnect.query("DELETE FROM category WHERE id = ?", id, (err, result) => {
            if (err) reject(err);
            else resolve(result.affectedRows);
        });
    });
};

// CREATE
const createNew = (category) => {
    const { name, description, image } = category;
    return new Promise((resolve, reject) => {
        dbConnect.query(
            "INSERT INTO category (name, description, image) VALUES (?,?,?)",
            [name, description, image],
            (err, result) => {
                if (err) reject(err);
                else resolve(result.insertId);
            }
        );
    });
};

// UPDATE
const updateCategory = (category) => {
    const { name, description, image, id } = category;
    return new Promise((resolve, reject) => {
        dbConnect.query(
            "UPDATE category SET name = ?, description = ?, image = ? WHERE id = ?",
            [name, description, image, id],
            (err, result) => {
                if (err) reject(err);
                else {
                    resolve(result);
                }
            }
        );
    });
};


export default { getAll, getOneById, deleteById, createNew, updateCategory };
