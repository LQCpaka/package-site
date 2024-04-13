const express = require('express');
const sachRoutes = express.Router();
const sachController = require('../controllers/sachcontroller')
sachRoutes.get('/list', sachController.sachList);
sachRoutes.get('/them',sachController.sachThemGet );
sachRoutes.post('/them', sachController.sachThemPost);
sachRoutes.get('/sua/:id', sachController.sachSuaGet);
sachRoutes.post('/sua',sachController.sachSuaPost)
sachRoutes.get('/xoa/:id', sachController.sachXoa);

module.exports = sachRoutes;