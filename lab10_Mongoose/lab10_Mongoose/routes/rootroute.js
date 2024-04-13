const express = require('express');
const rootRoutes = express.Router();
const sachRoutes = require('./sachroutes');

rootRoutes.get('/', (req,res) => {
    res.render('homepage');
})
rootRoutes.use('/sach', sachRoutes);

module.exports = rootRoutes;
