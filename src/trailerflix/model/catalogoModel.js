const { DataTypes, Model } = require('sequelize');

class CatalogoModel extends Model {

  static setup(sequelizeInstance) {
    CatalogoModel.init(
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
        categoriaId: {
          type: DataTypes.INTEGER,
          allowNull: false,
        },
      },
      {
        sequelize: sequelizeInstance,
        tableName: 'Catalogo',
        modelName: 'catalogo',
        underscored: true,
        timestamps: false,
      },
    );

    return CatalogoModel;
  }
}

module.exports = CatalogoModel;
