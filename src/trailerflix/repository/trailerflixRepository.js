const { Op } = require('sequelize');

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
    return categories;
  }

  async getCatalogo() {
    const catalogo = await this.vistaCatalogoModel.findAll();
    return catalogo;
  }

  async getContenidoId(id) {
    const contenido = await this.vistaCatalogoModel.findByPk(id);

    if (!contenido) throw new Error(`No se encontraron registros con el id: ${id}`);

    return contenido;
  }

  async getContenidoNombre(nombre) {
    const contenido = await this.vistaCatalogoModel.findAll({
      where: { titulo: { [Op.like]: `%${nombre}%` } },
    });

    if (contenido.length === 0) throw new Error(`No se encontraron series o peliculas con el nombre: ${nombre}`);

    return contenido;
  }

  async getContenidoGenero(genero) {
    const contenido = await this.vistaCatalogoModel.findAll({
      where: { genero: { [Op.like]: `%${genero}%` } },
    });

    if (contenido.length === 0) throw new Error(`No se encontraron series o peliculas de genero: ${genero}`);

    return contenido;
  }

  async getContenidoCategoria(categoria) {
    const contenido = await this.vistaCatalogoModel.findAll({
      where: { categoria: `${categoria}` },
    });

    if (contenido.length === 0) throw new Error(`No se encontraron resultados con categoria: ${categoria}`);

    return contenido;
  }

}

module.exports = TrailerflixRepository;
