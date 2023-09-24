require('dotenv').config();

const concatUrl = ({ dataValues }) => ({ ...dataValues, poster: `https://www.trailerflix.net/update${dataValues.poster}` });

module.exports = {
  HOST: process.env.SERVER_HOST,
  PORT: process.env.SERVER_PORT,
  DB_NAME: process.env.DATABASE_NAME,
  DB_USER: process.env.DATABASE_USER,
  DB_PASSWORD: process.env.DATABASE_PASSWORD,
  DB_HOST: process.env.DATABASE_HOST,
  DB_DIALECT: process.env.DATABASE_DIALECT,
  concatUrl,
};
