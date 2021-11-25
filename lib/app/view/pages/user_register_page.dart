import 'package:flutter/material.dart';
import 'package:gerenciar_produtos2/app/controller/user_register_controller.dart';
import 'package:gerenciar_produtos2/app/models/user_register_model.dart';
import 'package:gerenciar_produtos2/app/view/pages/user_register_widget.dart';

class UserRegisterPage extends State<UserRegisterWidget> {

  final UserRegisterController _userRegisterController = UserRegisterController();
  final UserRegisterModel _userRegisterModel = UserRegisterModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro de Usuário"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16.00),
              child: TextFormField(
                autofocus: true,
                keyboardType: TextInputType.text,
                onChanged: (text) {
                  _userRegisterModel.setNome(text);
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff6C63FF)),
                    ),
                    labelText: "Nome Completo"),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.00),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (text) {
                  _userRegisterModel.setEmail(text);
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff6C63FF)),
                    ),
                    labelText: "E-mail"),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.00),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (text) {
                  _userRegisterModel.setSenha(text);
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff6C63FF)),
                    ),
                    labelText: "Senha"),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.00),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (text) {
                  _userRegisterModel.setConfSenha(text);
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff6C63FF)),
                    ),
                    labelText: "Confirmar Senha"),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
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
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
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
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        onPressed: () {
                          _userRegisterController.setUserRegisterModel(_userRegisterModel);
                          _userRegisterController.cadastrar(context);
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