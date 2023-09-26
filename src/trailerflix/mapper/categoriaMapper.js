const Categoria = require('../entity/Categoria');

const fromModelToEntity = ({
  id,
  tipoCategoria,
}) => new Categoria(
  id,
  tipoCategoria,
);

module.exports = fromModelToEntity;
