class EdicaoProdutosModel {
  late String _nome = '', _descricao = '', _urlImagem = '';
  late int _id = -1;


  String get nome => _nome;

  String get descricao => _descricao;

  String get urlImagem => _urlImagem;

  int get id => _id;

  set nome(String value) {
    _nome = value;
  }

  set descricao(String value) {
    _descricao = value;
  }

  set urlImagem(String value) {
    _urlImagem = value;
  }

  set id(int value) {
    _id = value;
  }

  @override
  String toString() {
    return 'EdicaoProdutosModel{_nome: $_nome, _descricao: $_descricao, _urlImagem: $_urlImagem, _id: $_id}';
  }
}