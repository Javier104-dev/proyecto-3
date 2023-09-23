const { Model, DataTypes } = require('sequelize');

class GeneroModel extends Model {

  static setup(sequelizeInstance) {
    GeneroModel.init(
      {
        id: {
          type: DataTypes.INTEGER,
          primaryKey: true,
          autoIncrement: true,
          allowNull: false,
          unique: true,
        },
        tipoGenero: {
          type: DataTypes.STRING,
          allowNull: false,
          unique: true,
        },
      },
      {
        sequelize: sequelizeInstance,
        tableName: 'Genero',
        modelName: 'genero',
        underscored: true,
        timestamps: false,
      },
    );

    return GeneroModel;
  }
}

module.exports = GeneroModel;
