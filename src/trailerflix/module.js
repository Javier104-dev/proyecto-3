const TrailerflixController = require('./controller/trailerflixController');
const TrailerflixService = require('./service/trailerflixService');
const TrailerflixRepository = require('./repository/trailerflixRepository');
const CategoriaModel = require('./model/categoriaModel');
const VistaCatalogoModel = require('./model/vistaCatalogoModel');

module.exports = {
  TrailerflixController,
  TrailerflixService,
  TrailerflixRepository,
  CategoriaModel,
  VistaCatalogoModel,
};
