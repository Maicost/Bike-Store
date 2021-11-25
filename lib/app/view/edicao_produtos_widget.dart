import 'package:flutter/material.dart';
import 'package:gerenciar_produtos2/app/view/pages/edicao_produtos_page.dart';

import '../database/dao/produto_dao.dart';
import '../models/modelo_produto.dart';


class EdicaoProdutosWidget extends StatefulWidget {
  const EdicaoProdutosWidget({Key? key}) : super(key: key);

  @override
  EdicaoProdutosPage createState() => EdicaoProdutosPage();
}
