import aboutController from '../controllers/aboutController.js';
// import categoryController from '../controllers/categoryController.js';
// import tileController from '../controllers/tileController.js';
// import socialController from '../controllers/socialController.js';


export const setupRoutes = (app) => {
    app.use('/about', aboutController);
    // app.use('/category', categoryController);
    // app.use('/tile', tileController);
    // app.use('/social', socialController);
}