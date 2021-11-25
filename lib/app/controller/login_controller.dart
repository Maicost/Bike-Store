import 'package:flutter/material.dart';
import 'package:gerenciar_produtos2/app/database/dao/usuario_dao.dart';
import 'package:gerenciar_produtos2/app/view/main_page.dart';
import 'package:gerenciar_produtos2/app/models/login_model.dart';

class LoginController{
  late LoginModel _loginModel;
  bool _senhaObscura = true;

  UsuarioDao _usuarioDao = UsuarioDao();

  bool get senhaObscura => _senhaObscura;

  set senhaObscura(bool value) {
    _senhaObscura = value;
  }

  LoginModel get loginModel => _loginModel;

  set loginModel(LoginModel value) {
    _loginModel = value;
  }

  UsuarioDao get usuarioDao => _usuarioDao;

  set usuarioDao(UsuarioDao value) {
    _usuarioDao = value;
  }

  void entrar(BuildContext context) {
    if (_loginModel.senha.length > 0 && _loginModel.email.length > 0) {
      _usuarioDao.FindUsuario(_loginModel.email, _loginModel.senha)
          .then((value) {
        if (!value.isEmpty) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => MainPage()),
                  (Route<dynamic> route) => false);
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(_NotificarUsuarioNaoEncontrado());
        }
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(_PreencherCampos());
    }
  }

  SnackBar _NotificarUsuarioNaoEncontrado() {
    return SnackBar(
      content: Text("Usuario não encontrado"),
    );
  }

  SnackBar _PreencherCampos() {
    return SnackBar(
      content: Text("Campos não preenchido"),
    );
  }
}
