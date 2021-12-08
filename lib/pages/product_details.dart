import 'package:flutter/material.dart';

import 'package:shopapp_tut/main.dart';
import 'home.dart';


class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_new_price;
  final product_detail_old_price;
  final product_detail_picture;

  ProductDetails(
      {this.product_detail_name,
      this.product_detail_new_price,
      this.product_detail_old_price,
      this.product_detail_picture});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        title: InkWell(

          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
          },

            child:Text('Shopify')),
        backgroundColor: Colors.red,
        actions: <Widget>[
          new IconButton(
              onPressed: () {}, icon: Icon(Icons.search, color: Colors.white)),

        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
              //
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.product_detail_picture),
              ),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: new Text(
                    widget.product_detail_name,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  title: new Row(
                    children: <Widget>[
                      Expanded(
                          child: new Text(
                        "\$${widget.product_detail_old_price}",
                        style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough),
                      )),
                      Expanded(
                          child: new Text(
                        "\$${widget.product_detail_new_price}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ))
                    ],
                  ),
                ),
              ),
            ),
          ),

          // The first Buttons

          Row(
            children: <Widget>[
              // the size button

              Expanded(
                  child: MaterialButton(
                onPressed: () {

                  showDialog(context: context, builder: (context)
                  {
                    return new AlertDialog(
                      title: new Text("Size"),
                      content: new Text("Choose the size"),
                      actions: <Widget>[
                        new MaterialButton(onPressed: (){
                          Navigator.of(context).pop(context);
                        },
                        child: new Text("close"),)
                      ],
                    );
                  }

                  );

                },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                child: Row(
                  children: <Widget>[
                    Expanded(child: new Text("Size")),
                    Expanded(child: new Icon(Icons.arrow_drop_down))
                  ],
                ),
              )),

              Expanded(
                  child: MaterialButton(
                    onPressed: () {

                      showDialog(context: context, builder: (context)
                      {
                        return new AlertDialog(
                          title: new Text("Color"),
                          content: new Text("Choose the Color"),
                          actions: <Widget>[
                            new MaterialButton(onPressed: (){
                              Navigator.of(context).pop(context);
                            },
                              child: new Text("close"),)
                          ],
                        );
                      }

                      );

                    },
                    color: Colors.white,
                    textColor: Colors.grey,
                    elevation: 0.2,
                    child: Row(
                      children: <Widget>[
                        Expanded(child: new Text("Color")),
                        Expanded(child: new Icon(Icons.arrow_drop_down))
                      ],
                    ),
                  )),


              Expanded(
                  child: MaterialButton(
                    onPressed: () {

                      showDialog(context: context, builder: (context)
                      {
                        return new AlertDialog(
                          title: new Text("Quantity"),
                          content: new Text("Choose the quantity"),
                          actions: <Widget>[
                            new MaterialButton(onPressed: (){
                              Navigator.of(context).pop(context);
                            },
                              child: new Text("close"),)
                          ],
                        );
                      }

                      );

                    },
                    color: Colors.white,
                    textColor: Colors.grey,
                    elevation: 0.2,
                    child: Row(
                      children: <Widget>[
                        Expanded(child: new Text("Qty")),
                        Expanded(child: new Icon(Icons.arrow_drop_down))
                      ],
                    ),
                  )),


            ],
          ),


          // The second Button

          Row(
            children: <Widget>[
              // the size button

              Expanded(
                  child: MaterialButton(
                    onPressed: () {},
                    color: Colors.red,
                    textColor: Colors.white,
                    elevation: 0.2,
                    child: new Text("Buy")
                  )),

              new IconButton(onPressed: null, icon: Icon(Icons.add_shopping_cart)),
             new IconButton(onPressed: null, icon: Icon(Icons.favorite_border))

            ],
          ),




          Divider(),
          new ListTile(
            title: new Text("Product Details"),
            subtitle: new Text("my name is Niklas, I am the CTO of CodingPassion. We are searching for a Junior nt with one clip. They are then selling this motor-bike component to the bike brands like, Trek, Canyon, Scott, Lapierre, Focus, Centurion, Bergamont and many more. I can only recommend to check out their website, they are really awesome!!!"),
          ),
          Divider(),
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child:new Text("Product Name ", style: TextStyle(color: Colors.grey))
              
              ),
              Padding(padding: EdgeInsets.all(5.0), child: new Text(widget.product_detail_name),)

            ],
          ),

          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                  child:new Text("Product Brand ", style: TextStyle(color: Colors.grey))

              ),

              Padding(padding: EdgeInsets.all(5.0), child: new Text("Brand X"),)


            ],
          ),

          // Add the Product Condition
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                  child:new Text("Product Condition ", style: TextStyle(color: Colors.grey))

              ),
              Padding(padding: EdgeInsets.all(5.0), child: new Text("New"),)
            ],
          ),

        Divider(),
        Padding(padding: const EdgeInsets.all(8.0)),
        new Text("Similar Products"),

        // Similar products Section

          Container(
            height: 360.0,
            child: Similar_Products(),
          )

        ],
      ),
    );
  }
}

class Similar_Products extends StatefulWidget {
  const Similar_Products({Key? key}) : super(key: key);

  @override
  _Similar_ProductsState createState() => _Similar_ProductsState();
}

class _Similar_ProductsState extends State<Similar_Products> {
  var product_list = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "old_price": "120",
      "price": "85"
    },
    {
      "name": "Redder Dress",
      "picture": "images/products/dress1.jpeg",
      "old_price": "100",
      "price": "50"
    }
  ];

  @override
  Widget build(BuildContext context) {
    //return Container();

    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Similar_Single_Prod(
            prod_name: product_list[index]['name'],
            prod_picture: product_list[index]['picture'],
            prod_oldprice: product_list[index]['old_price'],
            prod_price: product_list[index]['price'],
          );
        });
  }
}
class Similar_Single_Prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_oldprice;
  final prod_price;

  Similar_Single_Prod(
      {this.prod_name, this.prod_picture, this.prod_oldprice, this.prod_price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: prod_name,
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => new ProductDetails(
                    // here we are passing the values of the product to the product details page
                    product_detail_name: prod_name,
                    product_detail_new_price: prod_price,
                    product_detail_old_price: prod_oldprice,
                    product_detail_picture: prod_picture,

                  ))),
              child: GridTile(
                  footer: Container(
                    color: Colors.white,
                    child:new Row(children: <Widget>[
                      Expanded(
                        child: Text(prod_name, style:TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                      ),
                      new Text("\$${prod_price}",style: TextStyle(color:Colors.red,fontWeight:FontWeight.bold)
                      )],
                    ),
                  ),
                  child: Image.asset(
                    prod_picture,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}