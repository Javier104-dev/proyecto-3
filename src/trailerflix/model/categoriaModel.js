const { Model, DataTypes } = require('sequelize');

class CategoriaModel extends Model {

  static setup(sequelizeInstance) {
    CategoriaModel.init(
      {
        id: {
          type: DataTypes.INTEGER,
          primaryKey: true,
          autoIncrement: true,
          allowNull: false,
          unique: true,
        },
        tipoCategoria: {
          type: DataTypes.STRING,
          allowNull: false,
          unique: true,
        },
      },
      {
        sequelize: sequelizeInstance,
        modelName: 'Categoria',
        tableName: 'categoria',
        underscored: true,
        timestamps: false,
      },
    );

    return CategoriaModel;
  }
}

module.exports = CategoriaModel;
