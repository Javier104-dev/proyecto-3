class TrailerflixController {

  constructor(trailerflixService) {
    this.trailerflixService = trailerflixService;
  }

  async getCategorias(req, res) {
    try {
      const categories = await this.trailerflixService.getCategorias();
      res.status(200).json(categories);

    } catch (error) {
      res.status(500).json({ msg: error.message });
    }
  }

  async getCatalogo(req, res) {
    try {
      const catalogo = await this.trailerflixService.getCatalogo();
      res.status(200).json(catalogo);

    } catch (error) {
      res.status(500).json({ msg: error.message });
    }
  }

  async getContenidoId(req, res) {
    const { id } = req.params;

    try {
      const contenido = await this.trailerflixService.getContenidoId(Number(id));
      res.status(200).json(contenido);

    } catch (error) {
      res.status(500).json({ msg: error.message });
    }
  }

  async getContenidoNombre(req, res) {
    const { nombre } = req.params;

    try {
      const contenido = await this.trailerflixService.getContenidoNombre(nombre);
      res.status(200).json(contenido);

    } catch (error) {
      res.status(500).json({ msg: error.message });
    }
  }

  async getContenidoGenero(req, res) {
    const { genero } = req.params;

    try {
      const contenido = await this.trailerflixService.getContenidoGenero(genero);
      res.status(200).json(contenido);

    } catch (error) {
      res.status(500).json({ msg: error.message });
    }
  }

  async getContenidoCategoria(req, res) {
    const { categoria } = req.params;

    try {
      const contenido = await this.trailerflixService.getContenidoCategoria(categoria);
      res.status(200).json(contenido);

    } catch (error) {
      res.status(500).json({ msg: error.message });
    }
  }
}

module.exports = TrailerflixController;
