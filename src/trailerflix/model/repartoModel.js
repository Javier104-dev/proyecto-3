const { Model, DataTypes } = require('sequelize');

class Reparto extends Model {

  static setup(sequelizeInstance) {
    Reparto.init(
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
        actorId: {
          type: DataTypes.INTEGER,
          allowNull: false,
        },
      },
      {
        sequelize: sequelizeInstance,
        tableName: 'Reparto',
        modelName: 'reparto',
        underscored: true,
        timestamps: false,
      },
    );
  }
}

module.exports = Reparto;
