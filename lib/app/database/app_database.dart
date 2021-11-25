import 'package:gerenciar_produtos2/app/models/modelo_produto.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:core';

import 'dao/produto_dao.dart';
import 'dao/usuario_dao.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'banco.db');
  return openDatabase(path, onCreate: (db, version) {

    db.execute(UsuarioDao.sqlTable);
    db.execute(ProdutoDao.sqlTable);

    _criarProdutosExemplo();

  }, version: 1
  ,onDowngrade: onDatabaseDowngradeDelete,
  );

}

void _criarProdutosExemplo(){
  ProdutoDao produtoDao = ProdutoDao();

  produtoDao.SaveProduto(ModeloProduto(0, "", "", ""));
  produtoDao.SaveProduto(ModeloProduto(0, "Produto A", "https://imgur.com/MrCIfw5.png", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse ligula velit, fringilla a lacinia ut."));
  produtoDao.SaveProduto(ModeloProduto(0, "Produto B", "https://imgur.com/5qd7ROR.png", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse ligula velit, fringilla a lacinia ut."));
  produtoDao.SaveProduto(ModeloProduto(0, "Produto C", "https://imgur.com/wFrLWxG.png", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse ligula velit, fringilla a lacinia ut."));
  produtoDao.SaveProduto(ModeloProduto(0, "Produto D", "https://imgur.com/8YD2N6g.png", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse ligula velit, fringilla a lacinia ut."));

}