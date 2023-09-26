const express = require('express');

const routes = express.Router();

const configureRoutes = (container) => {
  const controller = container.get('TrailerflixController');
  const ROUTE = '/catalogo';

  routes.get('/categorias', controller.getCategorias.bind(controller));
  routes.get(`${ROUTE}`, controller.getCatalogo.bind(controller));
  routes.get(`${ROUTE}/:id`, controller.getCatalogoId.bind(controller));
  routes.get(`${ROUTE}/nombre/:nombre`, controller.getCatalogoNombre.bind(controller));
  routes.get(`${ROUTE}/genero/:genero`, controller.getCatalogoGenero.bind(controller));
  routes.get(`${ROUTE}/categoria/:categoria`, controller.getCatalogoCategoria.bind(controller));
  return routes;
};

module.exports = configureRoutes;
