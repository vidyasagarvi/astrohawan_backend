import express from 'express';
import cors from 'cors';
import bodyParser from 'body-parser';
import productRoutes from './routes/PujastoreRoutes.js';
import bhandaraRoutes from './routes/BhandaraRoutes.js'
import categoryRoutes from './routes/categoryRoutes.js';


const app = express();


app.use(cors());
app.use(bodyParser.json());

// Use the product routes
app.use('/api/pujastore', productRoutes);
app.use('/api/bhandara', bhandaraRoutes);
app.use('/api/categories', categoryRoutes);

//send images middle ware
app.use(express.static('/'));
app.use('/pujastore', express.static('storeimages/pujastore'));

// Start the server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});

export default app;
