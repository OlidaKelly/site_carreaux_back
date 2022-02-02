import express from "express";
import Category from "../models/categoryModel.js";
import Joi from "joi";

const router = express.Router();

const schemaCategory = Joi.object({
  id: Joi.number().integer(),
  name: Joi.string().min(3).max(255).required(),
  description: Joi.required(),
  image: Joi.string().min(3).max(255).required(),
});

// Dans ce controller, toutes les routes commencent par /categories

router
  .get("/", async (req, res) => {
    try {
      const category = await Category.getAll();
      res.json(category);
    } catch (error) {
      res.status(500).json({ message: error.message });
    }
  })

  .get("/:id", async (req, res) => {
    const id = req.params.id;
    try {
      const category = await Category.getOneById(id);
      category ? res.json(category): res.status(404).json({ message: "La categorie n'a pas été trouvé" });
    } catch (error) {
      res.status(500).json({ message: error.message });
    }
  })

  .delete("/:id", async (req, res) => {
    const id = req.params.id;
    try {
      const result = await Category.deleteById(id);
      
        result ? 
          res.json({message : `La categorie id: ${id} a bien été supprimé !`}).status(204)
          : 
          res.json({ message: 'Une erreur est survenue lors de la suppression' }).status(404);
    } catch (error) {
      res.status(500).json({ message: error.message });
    }
  })

  .post("/", async (req, res) => {
    const category = {
      name: req.body.name,
      description: req.body.description,
      image: req.body.image
    };

    try {
      const { error, value } = await schemaCategory.validate(category);
      const categoryCreate = await Category.createNew(value);
      if (categoryCreate) {
        const newCategory = await Category.getOneById(categoryCreate);
        res.json(newCategory);
      } else res.json({ message: error.message }).status(422);
    } catch (err) {
      res.json({ message: err.message }).status(500);
    }
  })
  
  .put("/:id", async (req, res) => {
    const category = {
      id: req.params.id,
      name: req.body.name,
      description: req.body.description,
      image: req.body.image
    };

    try {
        const {error, value} = await schemaCategory.validate(category)
        const categoryUpdate = await Category.updateCategory(value);
        if (categoryUpdate) res.status(204);
        else res.status(422).json({ message: error.message });
    } catch (err) {
        res.status(500).json({ message: err.message });
    }
});

export default router;
