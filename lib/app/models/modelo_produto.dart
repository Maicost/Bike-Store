class ModeloProduto{
  ModeloProduto(this.id, this.nome, this.urlImagem, this.descricao);

  int id;
  String nome, urlImagem, descricao;

  @override
  String toString() {
    return 'ModeloProduto{id: $id, nome: $nome, urlImagem: $urlImagem, descricao: $descricao}';
  }
}