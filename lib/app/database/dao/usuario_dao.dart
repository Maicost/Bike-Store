import 'package:gerenciar_produtos2/app/models/modelo_usuario.dart';
import 'package:sqflite/sqflite.dart';

import '../app_database.dart';

class UsuarioDao {

  static const String sqlTable = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY AUTOINCREMENT,'
      '$_nome TEXT, '
      '$_email TEXT UNIQUE, '
      '$_senha TEXT)';

  static const String _tableName = 'usuarios';
  static const String _id = 'id';
  static const String _nome = 'nome';
  static const String _email = 'email';
  static const String _senha = 'senha';

  Future<int> SaveUsuario(ModeloUsuario modeloUsuario) async {
    if(await VerificaUsuario(modeloUsuario.email)  == false) {
      final Database db = await getDatabase();

      final Map<String, dynamic> usuarioMap = Map();
      usuarioMap['$_nome'] = modeloUsuario.nome;
      usuarioMap['$_email'] = modeloUsuario.email;
      usuarioMap['$_senha'] = modeloUsuario.senha;
      await db.insert('$_tableName', usuarioMap);

      return 1;
    }
    return 0;
  }

  Future<List<ModeloUsuario>> FindUsuario(String email, String senha) async {
    final Database db = await getDatabase();

    final List<ModeloUsuario> usuarios = [];
    final List<Map<String, dynamic>> maps =
        await db.rawQuery('SELECT * FROM $_tableName '
            'WHERE "$senha" == '
            '(SELECT $_senha FROM $_tableName '
            'WHERE "$email" == '
            '$_email)');

    for (Map<String, dynamic> map in maps) {
      ModeloUsuario modeloUsuario =
          ModeloUsuario(map[_id], map[_nome], map[_email],map[_senha]);

      usuarios.add(modeloUsuario);
    }
    return usuarios;
  }

  Future<bool> VerificaUsuario(String email) async {
    final Database db = await getDatabase();

    final List<Map<String, dynamic>> map = (await db.rawQuery('SELECT $_email FROM $_tableName WHERE "$email" == $_email'));

    if(!map.isEmpty){
      return true;
    }else{
      return false;
    }
  }

  Future<List<ModeloUsuario>> FindAllUsuarios() async {
    final Database db = await getDatabase();

    final List<ModeloUsuario> usuarios = [];
    final List<Map<String, dynamic>> maps = await db.query(_tableName);

    for (Map<String, dynamic> map in maps) {
      final ModeloUsuario modeloUsuario =
          ModeloUsuario(map[_id], map[_nome], map[_email],map[_senha]);
      usuarios.add(modeloUsuario);
    }
    return usuarios;
  }
}
