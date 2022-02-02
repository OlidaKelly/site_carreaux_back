import dbConnect from "../config/db-config.js";

// READ ALL
const getAll = () => {
    return new Promise((resolve, reject) => {
        dbConnect.query("SELECT * FROM product", (err, results) => {
            if (err) reject(err);
            else resolve(results);
        });
    });
};

// READ ONE
const getOneById = (id) => {
    return new Promise((resolve, reject) => {
        dbConnect.query("SELECT * FROM product WHERE id = ?", id, (err, result) => {
            if (err) reject(err);
            else resolve(result[0]);
        });
    });
};

// DELETE
const deleteById = (id) => {
    return new Promise((resolve, reject) => {
        dbConnect.query("DELETE FROM product WHERE id = ?", id, (err, result) => {
            if (err) reject(err);
            else resolve(result.affectedRows);
        });
    });
};

// CREATE
const createNew = (product) => {
    const { name, reference, color, size, tickness, destination, description, image, id_category } = product;
    return new Promise((resolve, reject) => {
        dbConnect.query(
            "INSERT INTO product (name, reference, color, size, tickness, destination, description, image, id_category) VALUES (?,?,?,?,?,?,?,?,?)",
            [name, reference, color, size, tickness, destination, description, image, id_category],
            (err, result) => {
                if (err) reject(err);
                else resolve(result.insertId);
            }
        );
    });
};

// UPDATE
const updateProduct = (product) => {
    const { name, reference, color, size, tickness, destination, description, image, id_category, id } = product;
    return new Promise((resolve, reject) => {
        dbConnect.query(
            "UPDATE product SET name = ?, reference = ?, color = ?, size = ?, tickness = ?, destination = ?, description = ?, image = ?, id_category = ? WHERE id = ?",
            [name, reference, color, size, tickness, destination, description, image, id_category, id],
            (err, result) => {
                if (err) reject(err);
                else {
                    resolve(result);
                }
            }
        );
    });
};


export default { getAll, getOneById, deleteById, createNew, updateProduct };
