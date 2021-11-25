class UserRegisterModel{
  late String _nome, _email, _senha, _confSenha;

  void setNome(text) {
    _nome = text;
  }

  void setEmail(text) {
    _email = text;
  }

  void setSenha(text) {
    _senha = text;
  }

  void setConfSenha(text) {
    _confSenha = text;
  }

  String get nome {
    return _nome;
  }
  String get email {
    return _email;
  }
  String get senha {
    return _senha;
  }
  String get confSenha {
    return _confSenha;
  }

}