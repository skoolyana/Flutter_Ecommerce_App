import 'package:flutter/material.dart';

class cart_products extends StatefulWidget {
  const cart_products({Key? key}) : super(key: key);

  @override
  _cart_productsState createState() => _cart_productsState();
}

class _cart_productsState extends State<cart_products> {

  var Products_on_cart = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "price": 85,
      "size":"M",
      "color":"Black",
      "quantity":1,

    },
    {
      "name": "Shoes",
      "picture": "images/products/hills1.jpeg",
      "price": 50,
      "size":"7",
      "color":"Red",
      "quantity":1,

    },
    {
      "name": "Blazer2",
      "picture": "images/products/blazer2.jpeg",
      "price": 185,
      "size":"M",
      "color":"Black",
      "quantity":1,

    },
    {
      "name": "Skirt2",
      "picture": "images/products/skt2.jpeg",
      "price": 35,
      "size":"M",
      "color":"Black",
      "quantity":1,
    },
    {
      "name": "Dress3",
      "picture": "images/products/dress2.jpeg",
      "price": 85,
      "size":"M",
      "color":"Black",
      "quantity":1,
    }

  ];





  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: Products_on_cart.length,
        itemBuilder: (context, index){
        return Single_cart_product(
          cart_prod_name: Products_on_cart[index]["name"],
          cart_prod_color: Products_on_cart[index]["color"],
          cart_prod_qty: Products_on_cart[index]["quantity"],
          cart_prod_size: Products_on_cart[index]["size"],
          cart_prod_price: Products_on_cart[index]["price"],
          cart_prod_picture: Products_on_cart[index]["picture"],


        );
        }
    );
  }
}

class Single_cart_product extends StatelessWidget {

  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_qty;


const  Single_cart_product({
    this.cart_prod_name,
  this.cart_prod_picture,
  this.cart_prod_price,
  this.cart_prod_size,
  this.cart_prod_color,this.cart_prod_qty
});



  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: new Image.asset(cart_prod_picture,height: 80.0,width: 80.0,),


      // ===================Title Section==================

        title: new Text(cart_prod_name),

        // ===================SubTitle Section==================


        subtitle: new Column(
          children: <Widget>[
            // Row inside the Column

            new Row(
              children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: new Text("Size"),
              ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text(cart_prod_size,style: TextStyle(color: Colors.red),),
                )


                //=============this Section is for the product Color
                ,Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                  child: new Text("Color"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(cart_prod_color,style: TextStyle(color: Colors.red),),
                )



              ],
            ),
            //=============this Section is for the product Price

            new Container(
              alignment: Alignment.topLeft,
              child: new Text("\$${cart_prod_price}",
                style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
                color: Colors.red
              ),),
            )

          ],

        ),

        trailing: new Column(
          children:<Widget>[
           Container(
             height: 20.0,
              child: new IconButton(icon: Icon(Icons.arrow_drop_up),onPressed: (){}),

           ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: new Text("$cart_prod_qty"),
            ),
            Container(
              height: 0.0,
                child:new IconButton(icon: Icon(Icons.arrow_drop_down),onPressed: (){})

            )

          ]

        ),

      ),

    );
  }
}
