class TrailerflixController {

  constructor(trailerflixService) {
    this.trailerflixService = trailerflixService;
  }

  async getCategorias(req, res, next) {
    try {
      const categories = await this.trailerflixService.getCategorias();
      res.status(200).json(categories);

    } catch (error) {
      res.status(500);
      next(error);
    }
  }

  async getCatalogo(req, res, next) {
    try {
      const catalog = await this.trailerflixService.getCatalogo();
      res.status(200).json(catalog);

    } catch (error) {
      res.status(500);
      next(error);
    }
  }

  async getCatalogoId(req, res, next) {
    const { id } = req.params;
    try {
      const content = await this.trailerflixService.getCatalogoId(Number(id));
      res.status(200).json(content);

    } catch (error) {
      res.status(500);
      next(error);
    }
  }

  async getCatalogoNombre(req, res, next) {
    const { nombre } = req.params;
    try {
      const content = await this.trailerflixService.getCatalogoNombre(nombre);
      res.status(200).json(content);

    } catch (error) {
      res.status(500);
      next(error);
    }
  }

  async getCatalogoGenero(req, res, next) {
    const { genero } = req.params;
    try {
      const content = await this.trailerflixService.getCatalogoGenero(genero);
      res.status(200).json(content);

    } catch (error) {
      res.status(500);
      next(error);
    }
  }

  async getCatalogoCategoria(req, res, next) {
    const { categoria } = req.params;
    try {
      const content = await this.trailerflixService.getCatalogoCategoria(categoria);
      res.status(200).json(content);

    } catch (error) {
      res.status(500);
      next(error);
    }
  }
}

module.exports = TrailerflixController;
