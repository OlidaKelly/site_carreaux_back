// import securityController from "../controllers/securityController.js";
import aboutController from '../controllers/aboutController.js';
import categoryController from '../controllers/categoryController.js';
import productController from '../controllers/productController.js';

// import socialController from '../controllers/socialController.js';
// import contactController from '../controllers/contactController.js';

export const setupRoutes = (app) => {
    // app.use("/security", securityController);
    app.use('/about', aboutController);
    app.use('/categories', categoryController);
    app.use('/products', productController);
    // app.use('/socials', socialController);
    // app.use('/contact', contactController);

};