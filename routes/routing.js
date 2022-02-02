import aboutController from '../controllers/aboutController.js';
import categoryController from '../controllers/categoryController.js';

export const setupRoutes = (app) => {
    app.use('/about', aboutController);
    app.use('/categories', categoryController);

};