const { Model, DataTypes } = require('sequelize');

class GeneroMultimedia extends Model {

  static setup(sequelizeInstance) {
    GeneroMultimedia.init(
      {
        id: {
          type: DataTypes.INTEGER,
          primaryKey: true,
          autoIncrement: true,
          allowNull: false,
          unique: true,
        },
        catalogoId: {
          type: DataTypes.INTEGER,
          allowNull: false,
        },
        generoId: {
          type: DataTypes.INTEGER,
          allowNull: false,
        },
      },
      {
        sequelize: sequelizeInstance,
        tableName: 'Genero_multimedia',
        modelName: 'genero_multimedia',
        underscored: true,
        timestamps: true,
      },
    );

    return GeneroMultimedia;
  }
}

module.exports = GeneroMultimedia;
