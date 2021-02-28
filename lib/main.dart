import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' ;
import 'package:routing/Cart.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:routing/model.dart';

class gameDetail {
  final String image;
  final String title ;
  final String description;
  gameDetail({this.image, this.title , this.description}) ;
}

class productInfo {
  String image, name;
  int cost;
  int id;
  int qyt;
  productInfo({this.image, this.name, this.cost, this.id, this.qyt});
}

void main() => runApp(MyApp(
    model: CartSum(),
));

class MyApp extends StatelessWidget{

  final CartSum model;

  const MyApp({Key key, @required this.model}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModel<CartSum>(
      model: model,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopping Cart',
        home: GameShop(games: [
            gameDetail(image: "assets/images/ac.jpg", title: 'Animal Crossing', description:'Farming'),
          gameDetail(image: "assets/images/na.jpg",title: 'Nier: Automata', description: 'Action'),
        gameDetail(image: "assets/images/cv.jpg",title: 'Code;Vein', description: 'DarkSoul like'),
        gameDetail(image: "assets/images/gta.jpg",title: 'GTA5', description: 'Action, Rob, 18+'),
        gameDetail(image: "assets/images/mhw.jpg",title: 'Monster Hunter: World', description: 'DarkSoul like, but with monster'),
        gameDetail(image: "assets/images/zd.jpg",title: 'The Legend of Zelda', description: 'For HardCore Gamer'),
        gameDetail(image: "assets/images/ff.jpg",title: 'FFVII', description: 'Action JRPG'),
        gameDetail(image: "assets/images/ov.jpg",title: 'Overwatch', description: 'FPS first person shooter with tactics'),
        gameDetail(image: "assets/images/ps.jpg",title: 'Persona5', description: 'Action, JRPG'),
        gameDetail(image: "assets/images/re.jpg",title: 'Resident Evil2', description: 'Action, Horror'),
        ],),
        routes: {'/cart': (context) => CartScreen()},
      ),
    );
  }
}


class GameShop extends StatelessWidget {
  final List<gameDetail> games;
  GameShop({Key key, @required this.games}) : super(key: key);

  List<productInfo> items = [
    productInfo(id: 1, image: "assets/images/ac.jpg", name: 'Animal Crossing', cost: 1650, qyt: 1),
    productInfo(id: 2, image: "assets/images/na.jpg", name: 'Nier: Automata', cost: 2450, qyt: 1),
    productInfo(id: 3, image: "assets/images/cv.jpg", name: 'Code;Vein', cost: 1650, qyt: 1),
    productInfo(id: 4, image: "assets/images/gta.jpg", name: 'GTA5', cost: 650, qyt: 1),
    productInfo(id: 5, image: "assets/images/mhw.png", name: 'Monster Hunter: World', cost: 1650, qyt: 1),
    productInfo(id: 6, image: "assets/images/zd.jpg", name: 'The Legend of Zelda', cost: 1650, qyt: 1),
    productInfo(id: 7, image: "assets/images/ff.jpg", name: 'FFVII', cost: 1450, qyt: 1),
    productInfo(id: 8, image: "assets/images/ov.jpg", name: 'Overwatch', cost: 1250, qyt: 1),
    productInfo(id: 9, image: "assets/images/ps.png", name: 'Persona5', cost: 1650, qyt: 1),
    productInfo(id: 10, image: "assets/images/re.jpg", name: 'Resident Evil2', cost: 1650, qyt: 1)
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title : Text( 'GameShop'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () => Navigator.pushNamed(context, '/cart'))
          ],
    ) ,
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile (
            leading: CircleAvatar(
              backgroundImage: AssetImage(items[index].image),
            ),
            title: Text(items[index].name),
            trailing: Text(
              '\฿${items[index].cost}',
              style: TextStyle(
                  color: Colors.deepOrange,fontSize: 20,
                  fontWeight: FontWeight.bold),),
            onTap: () {
              Navigator.push(
                context,
            MaterialPageRoute(
            builder: (context) => DetailScreen(GameDes: games[index]),
                ) ,
              ) ;
            },
          ) ;
          },
    ) ,
    ) ;
  }
}


class DetailScreen extends StatelessWidget {
  final gameDetail GameDes;
  DetailScreen({Key key, @required this.GameDes}) : super(key: key);

  List<productInfo> items = [
    productInfo(id: 1, image: "assets/images/ac.jpg", name: 'Animal Crossing', cost: 1650, qyt: 1),
    productInfo(id: 2, image: "assets/images/na.jpg", name: 'Nier: Automata', cost: 2450, qyt: 1),
    productInfo(id: 3, image: "assets/images/cv.jpg", name: 'Code;Vein', cost: 1650, qyt: 1),
    productInfo(id: 4, image: "assets/images/gta.jpg", name: 'GTA5', cost: 650, qyt: 1),
    productInfo(id: 5, image: "assets/images/mhw.png", name: 'Monster Hunter: World', cost: 1650, qyt: 1),
    productInfo(id: 6, image: "assets/images/zd.jpg", name: 'The Legend of Zelda', cost: 1650, qyt: 1),
    productInfo(id: 7, image: "assets/images/ff.jpg", name: 'FFVII', cost: 1450, qyt: 1),
    productInfo(id: 8, image: "assets/images/ov.jpg", name: 'Overwatch', cost: 1250, qyt: 1),
    productInfo(id: 9, image: "assets/images/ps.png", name: 'Persona5', cost: 1650, qyt: 1),
    productInfo(id: 10, image: "assets/images/re.jpg", name: 'Resident Evil2', cost: 1650, qyt: 1)
  ];

  @override
    Widget build(BuildContext context) {
    // TODO: implement build
      return Scaffold(
        appBar: AppBar(
          title: Text(GameDes.title),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () => Navigator.pushNamed(context, '/cart'),
            )
          ],
        ),

        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
            itemBuilder: (context, index) {
              return ScopedModelDescendant<CartSum>(
                  builder: (context, child, model) {
                    return Scaffold(
                        body: Center(
                            child: Padding(
                              padding: EdgeInsets.all(16.0) ,
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                        child: new Container(
                                          child: Image.asset(GameDes.image),
                                        ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                        child: new Container(
                                          child: Text(GameDes.description),
                                        ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                        child: OutlineButton(
                                          child: Text('Add to cart'),
                                            onPressed: () {
                                              return showDialog(
                                                context: context,
                                                  builder: (i) => AlertDialog(
                                                    title: Text('You really want to buy this game?'),
                                                    content: Text('When you confirm order, you will not allow to change'),
                                                      actions: <Widget>[
                                                        FlatButton(
                                                            onPressed: () {
                                                              Navigator.of(i).pop();
                                                            },
                                                          child: Text('Cancel'),
                                                        ),
                                                        FlatButton(
                                                          child: Text('Confirm'),
                                                            onPressed: () => model.addCart(items[index])
                                                        )
                                                      ]
                                                  )
                                              );
                                            }
                                        )
                                    )
                                  ],
                                )
                            )
                        )
                    );
                  }
              );
            },
        )
      );
  }
}
