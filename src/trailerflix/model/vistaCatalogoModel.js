const { Model, DataTypes } = require('sequelize');

class VistaCatalogoModel extends Model {

  static setup(sequelizeInstance) {
    VistaCatalogoModel.init(
      {
        id: {
          type: DataTypes.INTEGER,
          primaryKey: true,
          autoIncrement: true,
          allowNull: false,
          unique: true,
        },
        titulo: {
          type: DataTypes.STRING,
          allowNull: false,
          unique: true,
        },
        resumen: {
          type: DataTypes.STRING,
        },
        temporadas: {
          type: DataTypes.INTEGER,
        },
        trailer: {
          type: DataTypes.STRING,
          unique: true,
        },
        poster: {
          type: DataTypes.STRING,
          unique: true,
        },
        categoria: {
          type: DataTypes.INTEGER,
          allowNull: false,
        },
        reparto: {
          type: DataTypes.STRING,
          allowNull: false,
        },
        genero: {
          type: DataTypes.STRING,
          allowNull: false,
        },
      },
      {
        sequelize: sequelizeInstance,
        modelName: 'VistaCatalogo',
        tableName: 'vistaCatalogo',
        underscored: true,
        timestamps: false,
      },
    );

    return VistaCatalogoModel;
  }
}

module.exports = VistaCatalogoModel;
