class ModeloUsuario{
  int id;
  String nome, email, senha;

  ModeloUsuario(this.id, this.nome, this.email,this.senha);

  @override
  String toString() {
    return 'ModeloUsuario{id: $id, nome: $nome, email: $email,senha: $senha}';
  }
}