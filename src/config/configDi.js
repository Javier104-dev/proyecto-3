const {
  factory,
  object,
  use,
  default: DIContainer,
} = require('rsdi');
const configureSequelize = require('./configDb');
const CategoriaModel = require('../trailerflix/model/categoriaModel');
const TrailerflixController = require('../trailerflix/controller/trailerflixController');
const TrailerflixRepository = require('../trailerflix/repository/trailerflixRepository');
const TrailerflixService = require('../trailerflix/service/trailerflixService');
const VistaCatalogoModel = require('../trailerflix/model/vistaCatalogoModel');

const configureCategoriaModel = (container) => CategoriaModel.setup(container.get('Sequelize'));
const configureVistaModel = (container) => VistaCatalogoModel.setup(container.get('Sequelize'));

const addSequelize = (container) => {
  container.add({
    Sequelize: factory(configureSequelize),
  });
};

const addtrailerflixModule = (container) => {
  container.add({
    TrailerflixController: object(TrailerflixController).construct(use('TrailerflixService')),
    TrailerflixService: object(TrailerflixService).construct(use('TrailerflixRepository')),
    TrailerflixRepository: object(TrailerflixRepository).construct(
      use('VistaCatalogoModel'),
      use('CategoriaModel'),
    ),
    CategoriaModel: factory(configureCategoriaModel),
    VistaCatalogoModel: factory(configureVistaModel),
  });
};

const configureDI = () => {
  const container = new DIContainer();
  addSequelize(container);
  addtrailerflixModule(container);
  return container;
};

module.exports = configureDI;
