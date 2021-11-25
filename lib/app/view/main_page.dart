import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../database/dao/produto_dao.dart';
import 'login_widget.dart';
import '../models/modelo_produto.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProdutoDao _produtoDao = ProdutoDao();
    return Scaffold(
      appBar: AppBar(
        title: Text("Catálogo de Produtos"),
        actions: <Widget>[
          IconButton(
            tooltip: "Sair",
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> LoginWidget()),(Route<dynamic> route) => false);
            },
          )
        ],
      ),
      body: FutureBuilder(
          future: Future.delayed(Duration(milliseconds: 500))
              .then((value) => _produtoDao.FindAllProdutos()),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text("Não Há Produtos"),
                    ),
                  ],
                );
              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [CircularProgressIndicator(), Text("Carregando")],
                  ),
                );
              case ConnectionState.active:
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text("Não Há Produtos"),
                    ),
                  ],
                );
              case ConnectionState.done:
                if (snapshot.data != null &&
                    snapshot.data.toString().length > 5) {
                  List<ModeloProduto> modeloProdutos =
                      (snapshot.data as List<ModeloProduto>);

                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final ModeloProduto modeloProduto = modeloProdutos[index];
                      return _ProdutoItem(modeloProduto);
                    },
                    itemCount: modeloProdutos.length,
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text("Não Há Produtos"),
                      ),
                    ],
                  );
                }
            }
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: "Adicionar Item",
        onPressed: () {
          Navigator.pushNamed(context, "/edicaoProdutos", arguments: {});
        },
      ),
    );
  }
}

class _ProdutoItem extends StatelessWidget {
  final ModeloProduto modeloProduto;
  final ProdutoDao _produtoDao = ProdutoDao();

  _ProdutoItem(this.modeloProduto);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, left: 20, top: 8),
      child: Card(
        elevation: 5,
        color: Color.fromARGB(255, 62, 192, 106),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffffffff),
                          ),
                          // color: Color(0xffffffff),
                          child: Image.network(modeloProduto.urlImagem),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    modeloProduto.nome,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 20,

                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    modeloProduto.descricao,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      overflow: TextOverflow.clip,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                ElevatedButton(
                                    child: const Text(
                                      'Alterar',
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 62, 192, 106),
                                      ),
                                      strutStyle: StrutStyle(),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xffffffff),
                                      onPrimary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                    ),
                                    onPressed: () {
                                      //capturar id produto

                                      Navigator.pushNamed(
                                          context, "/edicaoProdutos",
                                          arguments: {
                                            "modeloProduto": modeloProduto
                                          });
                                    }),
                                const SizedBox(width: 8),
                                ElevatedButton(
                                  child: const Text(
                                    'Excluir',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 62, 192, 106),
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xffffffff),
                                    onPrimary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                  ),
                                  onPressed: () async {
                                    _produtoDao.DeleteProduto(modeloProduto);
                                    Navigator.pushReplacementNamed(
                                        context, "/mainPage");
                                  },
                                ),
                                const SizedBox(width: 8),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
