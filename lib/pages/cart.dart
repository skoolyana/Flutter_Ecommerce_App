import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// my imports
import 'package:shopapp_tut/components/cart_products.dart';





class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        title: Text('Cart'),
        backgroundColor: Colors.red,
        actions:<Widget> [
          new IconButton(onPressed: (){}, icon: Icon(Icons.search, color: Colors.white)),
        ],
      ),

      body: new cart_products(),


      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(child: ListTile(
              title: new Text("Total"),
              subtitle: new Text("\$230"),
            )),
            
            Expanded(
                child: new MaterialButton(onPressed: (){},
            child:new Text("Check Out", style: TextStyle(color: Colors.white)),color:Colors.red
            )  ,

            )
          ],
        ),
      ),
    );
  }
}
