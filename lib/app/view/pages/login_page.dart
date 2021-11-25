import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gerenciar_produtos2/app/controller/login_controller.dart';
import 'package:gerenciar_produtos2/app/models/login_model.dart';

import '../login_widget.dart';

class LoginPage extends State<LoginWidget> {
  bool _senhaObscura = true;

  final LoginModel _loginModel = LoginModel('', '');
  final LoginController _loginController = LoginController();

  void _TogglePass() {
    setState(() {
      _senhaObscura = !_senhaObscura;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bike Store"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.00),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(bottom: 50),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("Logo.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Container(
                  child: TextFormField(
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (text) {
                      _loginModel.setEmail(text);
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff6C63FF)),
                        ),
                        labelText: "E-mail"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: TextFormField(
                    autofocus: true,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _senhaObscura,
                    maxLength: 16,
                    onChanged: (text) {
                      _loginModel.setSenha(text);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff3ec06a)),
                      ),
                      labelText: 'Senha',
                      suffixIcon: IconButton(
                        onPressed: _TogglePass,
                        icon: _senhaObscura
                            ? Icon(
                          Icons.visibility_off,
                          color: Color(0xff3ec06a),
                        )
                            : Icon(
                          Icons.visibility,
                          //     color: Color(0xff6C63FF)),
                        ),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  child: Text(
                    "Logar",
                    textScaleFactor: 1.1,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  onPressed: () {
                    _loginController.loginModel = _loginModel;
                    _loginController.entrar(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff3ec06a),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ),
                ElevatedButton(
                  child: Text(
                    "Registrar",
                    textScaleFactor: 1.1,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  onPressed: () async {
                    Navigator.pushNamed(context, "/userRegister");
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff3ec06a),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
