const VistaCatalogo = require('../entity/VistaCatalogo');

const fromModelToEntity = ({
  id,
  titulo,
  resumen,
  temporadas,
  trailer,
  poster,
  categoria,
  reparto,
  genero,
}) => new VistaCatalogo(
  id,
  titulo,
  resumen,
  temporadas,
  trailer,
  poster,
  categoria,
  reparto,
  genero,
);

module.exports = fromModelToEntity;
