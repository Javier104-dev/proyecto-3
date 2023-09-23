const express = require('express');
const { HOST, PORT } = require('./config/config');
const configureDI = require('./config/configDi');
const configureRoutes = require('./trailerflix/routes/trailerflixRoutes');

const server = express();

server.use(express.json());
server.use(express.urlencoded({ extended: true }));

const container = configureDI();

server.use(configureRoutes(container));

server.use('*', (req, res) => {
  res.status(404).json({ msg: 'Pagina no encontrada' });
});

server.listen(PORT, HOST, () => {
  // eslint-disable-next-line no-console
  console.log(`http://${HOST}:${PORT}`);
});
