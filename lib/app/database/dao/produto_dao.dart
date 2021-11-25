import 'package:gerenciar_produtos2/app/models/modelo_produto.dart';
import 'package:sqflite/sqflite.dart';

import '../app_database.dart';

class ProdutoDao{

  static const String sqlTable = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY AUTOINCREMENT,'
      '$_nome TEXT, '
      '$_urlimagem TEXT, '
      '$_descricao TEXT)';


  static const String _tableName = 'produtos';
  static const String _id = 'id';
  static const String _nome = 'nome';
  static const String _urlimagem = 'urlimagem';
  static const String _descricao = 'descricao';

  Future<int> SaveProduto(ModeloProduto modeloProduto) async {
    final Database db = await getDatabase();

    final Map<String, dynamic> produtoMap = Map();
    produtoMap[_nome] = modeloProduto.nome;
    produtoMap[_urlimagem] = modeloProduto.urlImagem;
    produtoMap[_descricao] = modeloProduto.descricao;

    return db.insert(_tableName, produtoMap);
  }

  Future<List<ModeloProduto>> FindAllProdutos() async {
    final Database db = await getDatabase();

    final List<ModeloProduto> produtos = [];
    final List<Map<String, dynamic>> maps = await db.query(_tableName);

    for (Map<String, dynamic> map in maps) {
      final ModeloProduto modeloProduto = ModeloProduto(
          map[_id], map[_nome], map[_urlimagem], map[_descricao]);
      produtos.add(modeloProduto);
    }
    return produtos;
  }

  void UpdateProduto(final ModeloProduto modeloProduto) async {
    final Database db = await getDatabase();

    await db.update(
        _tableName,
        {
          _nome: modeloProduto.nome,
          _descricao: modeloProduto.descricao,
          _urlimagem: modeloProduto.urlImagem
        },
        where: '$_id = ?',
        whereArgs: [modeloProduto.id]);
  }

  void DeleteProduto(final ModeloProduto modeloProduto) async {
    final Database db = await getDatabase();
    await db.delete(_tableName, where: '$_id = ?', whereArgs: [modeloProduto.id]);
  }



}