import 'package:flutter/material.dart';
import 'package:trabalho_ddm/models/Item.dart';

class Total extends StatelessWidget {
  final List<Item> items;
  Total({@required this.items});

  double calcularTotalItems() {
    double total = 0;

    items.forEach((item) => total += item.calcularValor());

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Total'),
      ),
      body: ListView(
        children: items
            .map((item) => Container(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  height: 50,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '${item.nome} ',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'x${item.quantidade} (Valor Un.: R\$ ${item.valorUnitario.toStringAsFixed(2)})',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Text(
                          '${item.calcularValor().toStringAsFixed(2)}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ))
            .toList(),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16),
          height: 60.0,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Text(
                calcularTotalItems().toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
