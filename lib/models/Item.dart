class Item {
  String nome;
  double valorUnitario;
  int quantidade;

  Item({this.nome, this.valorUnitario}) {
    quantidade = 0;
  }

  double calcularValor() {
    return valorUnitario * quantidade;
  }
}
