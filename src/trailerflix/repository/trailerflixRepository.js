const { Op } = require('sequelize');
const vistaCatalogoModelToEntity = require('../mapper/vistaCatalogoMapper');
const categoriaModelToEntitity = require('../mapper/categoriaMapper');

class TrailerflixRepository {

  constructor(
    vistaCatalogoModel,
    categoriaModel,
  ) {
    this.vistaCatalogoModel = vistaCatalogoModel;
    this.categoriaModel = categoriaModel;
  }

  async getCategorias() {
    const categories = await this.categoriaModel.findAll({
      order: [['id', 'ASC']],
    });

    return categories.map(categoriaModelToEntitity);
  }

  async getCatalogo() {
    const catalog = await this.vistaCatalogoModel.findAll();

    return catalog.map(vistaCatalogoModelToEntity);
  }

  async getCatalogoId(id) {
    const content = await this.vistaCatalogoModel.findByPk(id);

    if (!content) throw new Error(`No se encontraron registros con el id: ${id}`);

    return vistaCatalogoModelToEntity(content);
  }

  async getCatalogoNombre(nombre) {
    const content = await this.vistaCatalogoModel.findAll({
      where: { titulo: { [Op.like]: `%${nombre}%` } },
    });

    if (!content.length) throw new Error(`No se encontraron series o peliculas con nombre: ${nombre}`);

    return content.map(vistaCatalogoModelToEntity);
  }

  async getCatalogoGenero(genero) {
    const content = await this.vistaCatalogoModel.findAll({
      where: { genero: { [Op.like]: `%${genero}%` } },
    });

    if (!content.length) throw new Error(`No se encontraron series o peliculas de genero: ${genero}`);

    return content.map(vistaCatalogoModelToEntity);
  }

  async getCatalogoCategoria(categoria) {
    const content = await this.vistaCatalogoModel.findAll({
      where: { categoria: `${categoria}` },
    });

    if (!content.length) throw new Error(`No se encontraron registros con categoria: ${categoria}`);

    return content.map(vistaCatalogoModelToEntity);
  }
}

module.exports = TrailerflixRepository;
