const { Model, DataTypes } = require('sequelize');

class ActorModel extends Model {

  static setup(sequelizeInstance) {
    ActorModel.init(
      {
        id: {
          type: DataTypes.INTEGER,
          primaryKey: true,
          autoIncrement: true,
          allowNull: false,
          unique: true,
        },
        nombre: {
          type: DataTypes.STRING,
          allowNull: false,
        },
        apellido: {
          type: DataTypes.STRING,
          allowNull: false,
        },
      },
      {
        sequelize: sequelizeInstance,
        tableName: 'Actor',
        modelName: 'actor',
        underscored: true,
        timestamps: false,
      },
    );

    return ActorModel;
  }
}

module.exports = ActorModel;
