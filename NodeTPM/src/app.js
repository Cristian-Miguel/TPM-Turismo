const express = require('express');
const app = express();
const morgan = require('morgan');
const cors = require('cors');

app.use(morgan('dev'));
app.use(cors());
app.use(require('./routes/favoritos'));
app.use(require('./routes/servicios'));

//Rutas que hacen uso de post
app.use(express.urlencoded({ extended: true }));    //Middleware para formato x-www-form-urlencoded
app.use(require('./routes/logIn'));
app.use(require('./routes/empresa'));
app.use(require('./routes/reservas'));

module.exports = app;