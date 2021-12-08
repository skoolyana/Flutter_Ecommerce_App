import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:shopapp_tut/pages/cart.dart';

// my own imports

import 'package:shopapp_tut/components/horizontal_listview.dart';
import 'package:shopapp_tut/components/products.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    Widget image_carousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/c1.jpg'),
          AssetImage('images/m1.jpeg'),
          AssetImage('images/m2.jpg'),
          AssetImage('images/w1.jpeg'),
          AssetImage('images/w3.jpeg'),
          AssetImage('images/w4.jpeg')
        ],
        autoplay: false,
        dotSize: 6.0,
        indicatorBgPadding: 2.0,
        dotBgColor: Colors.transparent,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
      ),
    );

    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        title: Text('Shopify'),
        backgroundColor: Colors.red,
        actions:<Widget> [
          new IconButton(onPressed: (){}, icon: Icon(Icons.search, color: Colors.white)),
          new IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> new Cart()));
          }, icon: Icon(Icons.shopping_cart, color: Colors.white))

        ],
      ),

      drawer: new Drawer(
        child: new ListView(
          children:<Widget> [
            //header
            new UserAccountsDrawerHeader(
              accountName: Text('Sunil kulyana'),
              accountEmail: Text('sunil.kulyana@gmail.com'),
              currentAccountPicture: GestureDetector(

                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white),
                ),

              ),
              decoration: new BoxDecoration(
                color: Colors.red,
              ),

            ),

            // body

            InkWell(
              onTap: (){},
              child: ListTile(

                title: Text("Home Page"),
                leading: Icon(Icons.home,color: Colors.red,),

              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(

                title: Text("My Account"),
                leading: Icon(Icons.person,color: Colors.red,),


              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(

                title: Text("My Orders"),
                leading: Icon(Icons.shopping_basket,color: Colors.red,),


              ),
            ),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> new Cart()));
              },
              child: ListTile(

                title: Text("Shopping Cart"),
                leading: Icon(Icons.shopping_cart,color: Colors.red,),


              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(

                  title: Text("Favourites"),
                  leading: Icon(Icons.favorite,color: Colors.red,)
              ),


            ),

            Divider(),

            InkWell(
              onTap: (){},
              child: ListTile(

                  title: Text("Settings"),
                  leading: Icon(Icons.settings)
              ),

            ),
            InkWell(
              onTap: (){},
              child: ListTile(

                  title: Text("About"),
                  leading: Icon(Icons.help)
              ),

            )



          ],

        ),

      ),

      body: new Column(
        children: <Widget>[
          // image carousel begins here
          //image_carousel,
          new Padding(padding: const EdgeInsets.all(8.0),

            child: Container(
                alignment: Alignment.centerLeft,
                child: new Text('Categories')),),

          // Horizontal List View begins here

          HorizontalList(),

          new  Padding(padding: const EdgeInsets.all(4.0),

            child: Container(
                alignment: Alignment.centerLeft,
                child: new Text('Recent Products')) ,
          ),

          Flexible(child: Products()),
        ],
      ),
    );
  }
}