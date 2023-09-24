const { concatUrl } = require('../../config/config');

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
      res.status(200).json(catalogo.map(concatUrl));

    } catch (error) {
      res.status(500).json({ msg: error.message });
    }
  }

  async getCatalogoId(req, res) {
    const { id } = req.params;
    try {
      const contenido = await this.trailerflixService.getCatalogoId(Number(id));
      res.status(200).json(concatUrl(contenido));

    } catch (error) {
      res.status(500).json({ msg: error.message });
    }
  }

  async getCatalogoNombre(req, res) {
    const { nombre } = req.params;
    try {
      const contenido = await this.trailerflixService.getCatalogoNombre(nombre);
      res.status(200).json(contenido.map(concatUrl));

    } catch (error) {
      res.status(500).json({ msg: error.message });
    }
  }

  async getCatalogoGenero(req, res) {
    const { genero } = req.params;
    try {
      const contenido = await this.trailerflixService.getCatalogoGenero(genero);
      res.status(200).json(contenido.map(concatUrl));

    } catch (error) {
      res.status(500).json({ msg: error.message });
    }
  }

  async getCatalogoCategoria(req, res) {
    const { categoria } = req.params;
    try {
      const contenido = await this.trailerflixService.getCatalogoCategoria(categoria);
      res.status(200).json(contenido.map(concatUrl));

    } catch (error) {
      res.status(500).json({ msg: error.message });
    }
  }
}

module.exports = TrailerflixController;
