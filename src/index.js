import express from 'express';
import cors from 'cors';
import bodyParser from 'body-parser';
import productRoutes from './routes/PujastoreRoutes.js';
import categoryRoutes from './routes/categoryRoutes.js';
import userRoutes from './routes/userRoutes.js';
import adminRoutes from './routes/admin/adminRoutes.js'
import mandirRoutes from './routes/mandir/MandirRoutes.js'
import helpsNeedyRoutes from './routes/helpsNeedy/HelpsRoutes.js'
import faqRoutes from './routes/faq/FAQRoutes.js'
import ourServiceRoutes from './routes/ourService/ourServicesRoutes.js'
import QueriesRoutes from './routes/Queries.js'
import SettingRoutes from './routes/SettingRoutes.js'
import PaymentRoutes from './routes/payment/Payment.js'

const app = express();

app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));


// Use the product routes
app.use('/api/pujastore', productRoutes);
app.use('/api/categories', categoryRoutes);
app.use('/api/users', userRoutes);
app.use('/api/admin', adminRoutes);
app.use('/api/mandir', mandirRoutes);
app.use('/api/helpsneedy', helpsNeedyRoutes);
app.use('/api/faqs', faqRoutes);
app.use('/api/services', ourServiceRoutes);
app.use('/api/contactus',  QueriesRoutes);
app.use('/api/settings',  SettingRoutes);
app.use('/api/payment',  PaymentRoutes);

//send images middle ware
app.use(express.static('/'));
app.use('/pujastore', express.static('storeimages/pujastore'));
app.use('/mandir', express.static('storeimages/mandir'));
app.use('/mandirproduct', express.static('storeimages/mandirproduct'));
app.use('/ourservices', express.static('storeimages/ourservices'));
app.use('/helpsneedy', express.static('storeimages/helpsneedy'));
app.use('/helpsproduct', express.static('storeimages/helpsproduct'));
app.use('/servicesproduct', express.static('storeimages/servicesproduct'));


// Start the server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});

export default app;
