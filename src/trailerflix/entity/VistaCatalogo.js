class VistaCatalogo {

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
    this.id = id;
    this.titulo = titulo;
    this.resumen = resumen;
    this.temporadas = temporadas;
    this.trailer = trailer;
    this.poster = poster;
    this.categoria = categoria;
    this.reparto = reparto;
    this.genero = genero;
  }

  concatUrl(url) {
    this.poster = `${url}${this.poster}`;
    return this;
  }
}

module.exports = VistaCatalogo;
