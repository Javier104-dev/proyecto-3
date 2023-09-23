const express = require('express');

const routes = express.Router();

const configureRoutes = (container) => {
  const controller = container.get('TrailerflixController');
  routes.get('/categorias', controller.getCategorias.bind(controller));
  routes.get('/catalogo', controller.getCatalogo.bind(controller));
  routes.get('/catalogo/:id', controller.getContenidoId.bind(controller));
  routes.get('/catalogo/nombre/:nombre', controller.getContenidoNombre.bind(controller));
  routes.get('/catalogo/genero/:genero', controller.getContenidoGenero.bind(controller));
  routes.get('/catalogo/categoria/:categoria', controller.getContenidoCategoria.bind(controller));
  return routes;
};

module.exports = configureRoutes;
