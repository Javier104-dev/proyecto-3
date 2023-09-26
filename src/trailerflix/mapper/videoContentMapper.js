const VideoContent = require('../entity/VideoContent');

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
}) => new VideoContent(
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
