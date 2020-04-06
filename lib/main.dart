import 'package:flutter/material.dart';
import 'package:trabalho_ddm/models/Item.dart';
import 'package:trabalho_ddm/total.dart';

//Flutter => SDK que utiliza dart.

//Dart => Linguagem desenvolvida pela Google muita parecida com  JavaScript (Mais tipado que JS)
//
//A idéia é um só código tanto pra web quanto prá mobile (Andorid e IOS). Utiliza o conceito de wigets (inspirado no React).
//
//Widget => Todos os componentes no flutter são widgets (Buttonns, Containers) e esses widgets são utilizados para determinar como dever ser a visualização.
//
//Esistem dois tipos de widgets:
//
//StatefullWidget =>  Um widget mutável. ou seja  widget poderá mudar dinamicamente, a partir de uma interação do usuário.
//
//StatelessWidget =>  Um widget não mutável. Ele não mudará (ex. Container).

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Carrinho(title: 'Carrinho de compras'),
    );
  }
}

class Carrinho extends StatefulWidget {
  final List<Item> items = [
    Item(nome: 'Achocolatado - 400g', valorUnitario: 5.6),
    Item(nome: 'Açúcar - 1kg', valorUnitario: 3),
    Item(nome: 'Arroz - 1kg', valorUnitario: 2.75),
    Item(nome: 'Café - 500g', valorUnitario: 12),
    Item(nome: 'Creme de Leite - 200g', valorUnitario: 2.4),
    Item(nome: 'Feijão - 1kg', valorUnitario: 5.7),
    Item(nome: 'Leite - 1L', valorUnitario: 2.6),
    Item(nome: 'Macarrão - 500g', valorUnitario: 3.3),
    Item(nome: 'Óleo de soja - 900ml', valorUnitario: 2.8),
    Item(nome: 'Ovo - 12un', valorUnitario: 5.9),
    Item(nome: 'Pipoca - 500g', valorUnitario: 2.8),
    Item(nome: 'Polentina - 500g', valorUnitario: 1.7),
    Item(nome: 'Sabão em pó - 1kg', valorUnitario: 8),
    Item(nome: 'Sal - 1Kg', valorUnitario: 1.8),
    Item(nome: 'Trigo - 1Kg', valorUnitario: 2.8),
  ];

  Carrinho({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CarrinhoState createState() => _CarrinhoState();
}

class _CarrinhoState extends State<Carrinho> {
  List<Item> itemsAdicionados = List<Item>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: Icon(Icons.local_grocery_store),
      ),
      body: ListView(
        children: widget.items
            .map((item) => Column(children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(8),
                    height: 70,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '${item.nome}',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                'Valor Un.: R\$ ${item.valorUnitario.toStringAsFixed(2)}',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            if (item.quantidade > 0) {
                              setState(() {
                                item.quantidade--;
                              });
                            }
                            if (item.quantidade == 0) {
                              itemsAdicionados.remove(item);
                            }
                          },
                          iconSize: 28,
                          icon: Icon(
                            Icons.remove,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        Container(
                          width: 50,
                          child: Text(
                            '${item.quantidade}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          iconSize: 28,
                          icon: Icon(
                            Icons.add,
                            color: Theme.of(context).primaryColor,
                          ),
                          onPressed: () {
                            if (!itemsAdicionados.any((itemAdicionado) =>
                                itemAdicionado.nome == item.nome)) {
                              itemsAdicionados.add(item);
                            }
                            setState(() {
                              item.quantidade++;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  Divider(
                    height: 4,
                    color: Colors.grey[700],
                  ),
                ]))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Total(
                items: itemsAdicionados,
              ),
            ),
          );
        },
        tooltip: 'Total',
        child: Icon(Icons.attach_money),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 60.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
