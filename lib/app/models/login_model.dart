class LoginModel{
  String _email, _senha;

  LoginModel(this._email, this._senha);

  void setEmail(text) {
    _email = text;
  }

  void setSenha(text) {
    _senha = text;
  }

  String get senha {
    return _senha;
  }
  String get email {
    return _email;
  }
}