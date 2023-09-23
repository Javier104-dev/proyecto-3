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

  async getContenidoId(id) {
    if (!Number(id)) throw new Error('El id debe ser un numero valido');

    return this.trailerflixRepository.getContenidoId(id);
  }

  async getContenidoNombre(nombre) {
    if (!nombre) throw new Error('El nombre no esta definido');

    return this.trailerflixRepository.getContenidoNombre(nombre);
  }

  async getContenidoGenero(genero) {
    if (!genero) throw new Error('El genero no esta definido');

    return this.trailerflixRepository.getContenidoGenero(genero);
  }

  async getContenidoCategoria(categoria) {
    if (!categoria) throw new Error('La categoria no esta definido');

    return this.trailerflixRepository.getContenidoCategoria(categoria);
  }

}

module.exports = TrailerflixService;
