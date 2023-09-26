class VideoContent {

  constructor(
    id,
    titulo,
    resumen,
    temporadas,
    trailer,
    poster,
    categoria,
    reparto,
    genero,
  ) {
    this.ABSOLUTE_PATH = 'https://www.trailerflix.net/update';
    this.id = id;
    this.titulo = titulo;
    this.resumen = resumen;
    this.temporadas = temporadas;
    this.trailer = trailer;
    this.poster = `${this.ABSOLUTE_PATH}${poster}`;
    this.categoria = categoria;
    this.reparto = reparto;
    this.genero = genero;
  }
}

module.exports = VideoContent;
