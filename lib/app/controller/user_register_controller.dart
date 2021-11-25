import 'package:flutter/material.dart';
import 'package:gerenciar_produtos2/app/database/dao/usuario_dao.dart';
import 'package:gerenciar_produtos2/app/view/login_widget.dart';
import 'package:gerenciar_produtos2/app/models/modelo_usuario.dart';
import 'package:gerenciar_produtos2/app/models/user_register_model.dart';

class UserRegisterController extends ChangeNotifier {
  late UserRegisterModel _userRegisterModel;
  UsuarioDao _usuarioDao = UsuarioDao();

  void cadastrar(BuildContext context) async {
    if (_userRegisterModel.senha == _userRegisterModel.confSenha) {
     if(await _usuarioDao.SaveUsuario(ModeloUsuario(0,
              _userRegisterModel.nome,
              _userRegisterModel.email,
              _userRegisterModel.senha)) == 1) {

       Navigator.of(context).pushAndRemoveUntil(
           MaterialPageRoute(builder: (context) => LoginWidget()),
               (Route<dynamic> route) => false);
     }else{

       ScaffoldMessenger.of(context).showSnackBar(_ContaExistente());
     }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(_NotificarSenhaDiferentes());
    }
  }

  void setUserRegisterModel(userRegisterModel) {
    _userRegisterModel = userRegisterModel;
  }

  SnackBar _NotificarSenhaDiferentes() {
    return SnackBar(
      content: Text("Senhas Diferentes"),
    );
  }

  SnackBar _ContaExistente() {
    return SnackBar(
      content: Text("Conta Existente"),
    );
  }
}
