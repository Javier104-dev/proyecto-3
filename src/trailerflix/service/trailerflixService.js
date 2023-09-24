class TrailerflixService {

  constructor(trailerflixRepository) {
    this.trailerflixRepository = trailerflixRepository;
  }

  async getCategorias() {
    return this.trailerflixRepository.getCategorias();
  }

  async getCatalogo() {
    return this.trailerflixRepository.getCatalogo();
  }

  async getCatalogoId(id) {
    if (!Number(id)) throw new Error('El id debe ser un numero valido');

    return this.trailerflixRepository.getCatalogoId(id);
  }

  async getCatalogoNombre(nombre) {
    if (!nombre) throw new Error('El nombre no esta definido');

    return this.trailerflixRepository.getCatalogoNombre(nombre);
  }

  async getCatalogoGenero(genero) {
    if (!genero) throw new Error('El genero no esta definido');

    return this.trailerflixRepository.getCatalogoGenero(genero);
  }

  async getCatalogoCategoria(categoria) {
    if (!categoria) throw new Error('La categoria no esta definida');

    return this.trailerflixRepository.getCatalogoCategoria(categoria);
  }
}

module.exports = TrailerflixService;
