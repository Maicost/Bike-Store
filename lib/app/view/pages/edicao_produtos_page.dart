import 'package:flutter/material.dart';
import 'package:gerenciar_produtos2/app/controller/edicao_produtos_controller.dart';
import 'package:gerenciar_produtos2/app/models/edicao_produtos_model.dart';

import '../edicao_produtos_widget.dart';


class EdicaoProdutosPage extends State<EdicaoProdutosWidget> {
  late EdicaoProdutosModel _edicaoProdutosModel = EdicaoProdutosModel();
  final EdicaoProdutosController _edicaoProdutosController = EdicaoProdutosController();

  @override
  Widget build(BuildContext context) {

    _edicaoProdutosModel = _edicaoProdutosController.IniciarComponentes(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Edição Produtos'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.00),
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.only(top: 20.00),
                child: TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  initialValue: _edicaoProdutosModel.nome,
                  onChanged: (text) {
                    _edicaoProdutosModel.nome = text;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff6C63FF)),
                      ),
                      labelText: "Nome Produto"),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(top: 20.00),
                child: TextFormField(
                  autofocus: false,
                  keyboardType: TextInputType.text,
                  initialValue: _edicaoProdutosModel.urlImagem,
                  onChanged: (text) {
                    _edicaoProdutosModel.urlImagem = text;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff6C63FF)),
                      ),
                      labelText: "URL Imagem"),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(top: 20.00),
                child: TextFormField(
                  autofocus: false,
                  keyboardType: TextInputType.text,
                  initialValue: _edicaoProdutosModel.descricao,
                  onChanged: (text) {
                    _edicaoProdutosModel.descricao = text;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff6C63FF)),
                      ),
                      labelText: "Descrição"),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: ElevatedButton(
                          child: Text(
                            "Voltar",
                            textScaleFactor: 1.1,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff3ec06a),
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                        ),
                      )),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: ElevatedButton(
                        child: Text(
                          "Concluir",
                          textScaleFactor: 1.1,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        onPressed: () async {

                          _edicaoProdutosController.edicaoProdutosModel = _edicaoProdutosModel;
                          _edicaoProdutosController.salvarMudancas(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff3ec06a),
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
