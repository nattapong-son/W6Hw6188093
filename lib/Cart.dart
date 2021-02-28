import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:routing/model.dart';


class CartScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CartState();
  }
}

class CartState extends State<CartScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart')
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: ScopedModel.of<CartSum>(context, rebuildOnChange: true).TotalSum,
                itemBuilder: (context, index) {
                  return ScopedModelDescendant<CartSum>(
                    builder: (context, child, model) {
                      return ListTile(
                        title: Text(model.cart[index].name),
                        subtitle: Text(model.cart[index].qyt.toString() *
                            model.cart[index].cost),
                        trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  model.updateproduct(model.cart[index],
                                      model.cart[index].qyt + 1);
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  model.updateproduct(model.cart[index],
                                      model.cart[index].qyt - 1);
                                },
                              ),
                            ]),
                      );
                    },
                  );
                },
            ),
          ),
          Container(
              padding: EdgeInsets.all(8.0),
              child: Text('Total: \$' + ScopedModel.of<CartSum>(context, rebuildOnChange: true).TotalSum.toString()
              ),
          )
        ],
      ),
      )
    );


  }
}