
const express = require('express');
const rootRoutes = require('./routes/rootroute');
const app = express();
const port = 3000;

//Config
app.set('view engine', 'ejs');
app.set('views', './views');
app.use(express.static("./public"));

// Routes
app.use('/',rootRoutes);

// Server
app.listen(port, () => {
    console.log(`Ung dung dang chay o port ${port}`);
});