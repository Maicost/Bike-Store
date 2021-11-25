import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gerenciar_produtos2/app/database/dao/produto_dao.dart';
import 'package:gerenciar_produtos2/app/models/edicao_produtos_model.dart';
import 'package:gerenciar_produtos2/app/models/modelo_produto.dart';

import '../view/main_page.dart';

class EdicaoProdutosController {
  late EdicaoProdutosModel _edicaoProdutosModel = EdicaoProdutosModel();

  EdicaoProdutosModel get edicaoProdutosModel => _edicaoProdutosModel;

  set edicaoProdutosModel(EdicaoProdutosModel value) {
    _edicaoProdutosModel = value;
  }

  EdicaoProdutosModel IniciarComponentes(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Map;

    if (arguments != null && arguments['modeloProduto'] != null) {
      ModeloProduto modeloProduto = arguments['modeloProduto'];

      _edicaoProdutosModel.nome = modeloProduto.nome;
      _edicaoProdutosModel.descricao = modeloProduto.descricao;
      _edicaoProdutosModel.urlImagem = modeloProduto.urlImagem;
      _edicaoProdutosModel.id = modeloProduto.id;

      return _edicaoProdutosModel;
    }
    return EdicaoProdutosModel();
  }

  void salvarMudancas(BuildContext context) {
    ProdutoDao _produtoDao = ProdutoDao();

    if (edicaoProdutosModel.id == -1) {
      if (_edicaoProdutosModel.nome.length > 0 &&
          _edicaoProdutosModel.urlImagem.length > 0 &&
          _edicaoProdutosModel.descricao.length > 0) {
        _produtoDao.SaveProduto(ModeloProduto(0, _edicaoProdutosModel.nome,
            edicaoProdutosModel.urlImagem, _edicaoProdutosModel.descricao));
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> MainPage()),(Route<dynamic> route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(_PreencherCampos());
      }
    } else {
      _produtoDao.UpdateProduto(ModeloProduto(
          edicaoProdutosModel.id,
          edicaoProdutosModel.nome,
          edicaoProdutosModel.urlImagem,
          edicaoProdutosModel.descricao));
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> MainPage()),(Route<dynamic> route) => false);
    }
  }

  SnackBar _PreencherCampos() {
    return SnackBar(
      content: Text("Campos não preenchido"),
    );
  }
}
