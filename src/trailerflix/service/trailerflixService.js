class TrailerflixService {

  constructor(trailerflixRepository) {
    this.trailerflixRepository = trailerflixRepository;
    this.IMAGE_PATH = 'https://www.trailerflix.net/update';
  }

  async getCategorias() {
    return this.trailerflixRepository.getCategorias();
  }

  async getCatalogo() {
    const content = await this.trailerflixRepository.getCatalogo();
    content.map((e) => e.concatUrl(this.IMAGE_PATH));

    return content;
  }

  async getCatalogoId(id) {
    if (!Number(id)) throw new Error('El id debe ser un numero valido');

    const content = await this.trailerflixRepository.getCatalogoId(id);
    content.concatUrl(this.IMAGE_PATH);

    return content;
  }

  async getCatalogoNombre(nombre) {
    if (!nombre) throw new Error('El nombre no esta definido');

    const content = await this.trailerflixRepository.getCatalogoNombre(nombre);
    content.map((e) => e.concatUrl(this.IMAGE_PATH));

    return content;
  }

  async getCatalogoGenero(genero) {
    if (!Number.isNaN(Number(genero))) throw new Error('El genero no puede ser de tipo numero');

    const content = await this.trailerflixRepository.getCatalogoGenero(genero);
    content.map((e) => e.concatUrl(this.IMAGE_PATH));

    return content;
  }

  async getCatalogoCategoria(categoria) {
    if (!Number.isNaN(Number(categoria))) throw new Error('La categoria no puede ser de tipo numero');

    const content = await this.trailerflixRepository.getCatalogoCategoria(categoria);
    content.map((e) => e.concatUrl(this.IMAGE_PATH));

    return content;
  }
}

module.exports = TrailerflixService;
