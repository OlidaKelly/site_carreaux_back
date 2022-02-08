import cors from 'cors';
import express from 'express';

import { setupRoutes } from './routes/routing.js';

const app = express();
const port = 5000;

// Configuration du serveur
app.use(cors('*'));
app.use(express.json()); 
app.use(express.urlencoded({extended: true}));

setupRoutes(app);

app.listen(port, () => console.log(`✅ Server is running on port ${port}`));