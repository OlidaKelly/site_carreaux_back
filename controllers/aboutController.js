import express from "express";
import About from "../models/aboutModel.js";
import Joi from "joi";

const router = express.Router();

const schemaAbout = Joi.object({
  id: Joi.number().integer(),
  name: Joi.string().min(3).max(255).required(),
  phone: Joi.string().min(3).max(20).required(),
  email: Joi.string().email().required(),
  description: Joi.required(),
  location: Joi.string().min(3).max(255).required(),
});

// Dans ce controller, toutes les routes commencent par /about

router.get("/", async (req, res) => {
  try {
    const about = await About.getAll();
    res.json(about);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});

router.get("/:id", async (req, res) => {
  const id = req.params.id;
  try {
    const about = await About.getOneById(id);
    about ? res.json(about) : res.status(404).json({ message: "page à propos n'a pas été trouvé" });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});

router.put("/:id", async (req, res) => {
  const about = {
    // id: req.body.id,
    name: req.body.name,
    phone: req.body.phone,
    email: req.body.email,
    description: req.body.description,
    location: req.body.location,
  };
  try {
    const { error, value } = await schemaAbout.validate(about);
    const aboutUpdate = await About.updateAbout(value);
    if (aboutUpdate) res.status(204);
    else res.status(422).json({ message: error.message });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

export default router;
