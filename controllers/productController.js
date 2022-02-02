import express from "express";
import Product from "../models/productModel.js";
import Joi from "joi";

const router = express.Router();

const schemaProduct = Joi.object({
  id: Joi.number().integer(),
  name: Joi.string().min(3).max(255).required(),
  reference: Joi.string().min(3).max(255).required(),
  color: Joi.string().min(3).max(40).required(),
  size: Joi.string().min(3).max(40).required(),
  tickness: Joi.string().min(3).max(40).required(),
  destination: Joi.string().min(3).max(100).required(),
  description: Joi.required(),
  image: Joi.string().min(3).max(255).required(),
  id_category: Joi.number().integer().required()
});

// Dans ce controller, toutes les routes commencent par /products

router
  .get("/", async (req, res) => {
    try {
      const products = await Product.getAll();
      res.json(products);
    } catch (error) {
      res.status(500).json({ message: error.message });
    }
  })

  .get("/:id", async (req, res) => {
    const id = req.params.id;
    try {
      const product = await Product.getOneById(id);
      product ? res.json(product): res.status(404).json({ message: "Le produit n'a pas été trouvé" });
    } catch (error) {
      res.status(500).json({ message: error.message });
    }
  })

  .delete("/:id", async (req, res) => {
    const id = req.params.id;
    try {
      const result = await Product.deleteById(id);
      
        result ? 
          res.json({message : `Le produit id: ${id} a bien été supprimé !`}).status(204)
          : 
          res.json({ message: 'Une erreur est survenue lors de la suppression' }).status(404);
    } catch (error) {
      res.status(500).json({ message: error.message });
    }
  })

  .post("/", async (req, res) => {
    const product = {  
      name: req.body.name,
      reference: req.body.reference,
      color: req.body.color,
      size: req.body.size,
      tickness: req.body.tickness,
      destination: req.body.destination,
      description: req.body.description,
      image: req.body.image,
      id_category: req.body.id_category,
    };

    try {
      const { error, value } = await schemaProduct.validate(product);
      const productCreate = await Product.createNew(value);
      if (productCreate) {
        const newProduct = await Product.getOneById(productCreate);
        res.json(newProduct);
      } else res.json({ message: error.message }).status(422);
    } catch (err) {
      res.json({ message: err.message }).status(500);
    }
  })
  
  .put("/:id", async (req, res) => {
    const product = {
      id: req.params.id,
      name: req.body.name,
      reference: req.body.reference,
      color: req.body.color,
      size: req.body.size,
      tickness: req.body.tickness,
      destination: req.body.destination,
      description: req.body.description,
      image: req.body.image,
      id_category: req.body.id_category,
    };

    try {
        const {error, value} = await schemaProduct.validate(product)
        const productUpdate = await Product.updateProduct(value);
        if (productUpdate) res.status(204);
        else res.status(422).json({ message: error.message });
    } catch (err) {
        res.status(500).json({ message: err.message });
    }
});

export default router;
