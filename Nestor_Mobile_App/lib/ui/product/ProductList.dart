import 'package:flutter/material.dart';
import 'package:nestore/ui/product/ProductCard.dart';
import 'package:nestore/ui/product/products.dart';

class ProductList extends StatefulWidget {
  ProductList({Key key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom:10, top:10, left:10, right:10),
        child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        top:10, bottom:0),
                    child: Container(
                      width: double.infinity,
                      child: Text('SHOP BY', style: TextStyle(color: Colors.black26, fontWeight: FontWeight.bold, fontSize: 16),),
                    )
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top:5, bottom:10),
                    child: Container(
                      width: double.infinity,
                      child: Text('Category', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                    )
                ),
                Container(
                    color: Colors.white,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 0),
                    height:
                    (MediaQuery.of(context).size.height * 0.2),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(
                                right:10),
                            child: GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ProductsPage(),
                                    ),
                                  );
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(10.0),),
                                        border: Border.all(color: Colors.grey[400])
                                    ),
                                    child: Padding(
                                        padding: EdgeInsets.only(top:10),
                                        child: Column(
                                          children: [
                                            Stack(
                                              children: [
                                                Positioned(
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                            image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQx-YHTYySZO4IHxlF8acRE_nt3T3NHSOPjoQ&usqp=CAU"),
                                                            fit: BoxFit.fill,
                                                          ),
                                                          borderRadius: BorderRadius.all(Radius.circular(10.0),)
                                                      ),
                                                      child: Container(
                                                        height: MediaQuery.of(context).size.height * 0.1,
                                                        width: MediaQuery.of(context).size.width *0.2,
                                                      )
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                                width: MediaQuery.of(context).size.width *0.3,
                                                child: Padding(
                                                    padding: EdgeInsets.only(top:10, left:10, right:10),
                                                    child: Text('Persoanl & Home Essentials', textAlign:TextAlign.center,style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold))
                                                )
                                            )
                                          ],
                                        )
                                    )
                                )
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                right:10),
                            child: GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ProductsPage(),
                                    ),
                                  );
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(10.0),),
                                        border: Border.all(color: Colors.grey[400])
                                    ),
                                    child: Padding(
                                        padding: EdgeInsets.only(top:10),
                                        child: Column(
                                          children: [
                                            Stack(
                                              children: [
                                                Positioned(
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                            image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQx-YHTYySZO4IHxlF8acRE_nt3T3NHSOPjoQ&usqp=CAU"),
                                                            fit: BoxFit.fill,
                                                          ),
                                                          borderRadius: BorderRadius.all(Radius.circular(10.0),)
                                                      ),
                                                      child: Container(
                                                        height: MediaQuery.of(context).size.height * 0.1,
                                                        width: MediaQuery.of(context).size.width *0.2,
                                                      )
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                                width: MediaQuery.of(context).size.width *0.3,
                                                child: Padding(
                                                    padding: EdgeInsets.only(top:10, left:10, right:10),
                                                    child: Text('Persoanl & Home Essentials', textAlign:TextAlign.center,style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold))
                                                )
                                            )
                                          ],
                                        )
                                    )
                                )
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                right:10),
                            child: GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ProductsPage(),
                                    ),
                                  );
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(10.0),),
                                        border: Border.all(color: Colors.grey[400])
                                    ),
                                    child: Padding(
                                        padding: EdgeInsets.only(top:10),
                                        child: Column(
                                          children: [
                                            Stack(
                                              children: [
                                                Positioned(
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                            image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQx-YHTYySZO4IHxlF8acRE_nt3T3NHSOPjoQ&usqp=CAU"),
                                                            fit: BoxFit.fill,
                                                          ),
                                                          borderRadius: BorderRadius.all(Radius.circular(10.0),)
                                                      ),
                                                      child: Container(
                                                        height: MediaQuery.of(context).size.height * 0.1,
                                                        width: MediaQuery.of(context).size.width *0.2,
                                                      )
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                                width: MediaQuery.of(context).size.width *0.3,
                                                child: Padding(
                                                    padding: EdgeInsets.only(top:10, left:10, right:10),
                                                    child: Text('Persoanl & Home Essentials', textAlign:TextAlign.center,style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold))
                                                )
                                            )
                                          ],
                                        )
                                    )
                                )
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                right:10),
                            child: GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ProductsPage(),
                                    ),
                                  );
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(10.0),),
                                        border: Border.all(color: Colors.grey[400])
                                    ),
                                    child: Padding(
                                        padding: EdgeInsets.only(top:10),
                                        child: Column(
                                          children: [
                                            Stack(
                                              children: [
                                                Positioned(
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                            image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQx-YHTYySZO4IHxlF8acRE_nt3T3NHSOPjoQ&usqp=CAU"),
                                                            fit: BoxFit.fill,
                                                          ),
                                                          borderRadius: BorderRadius.all(Radius.circular(10.0),)
                                                      ),
                                                      child: Container(
                                                        height: MediaQuery.of(context).size.height * 0.1,
                                                        width: MediaQuery.of(context).size.width *0.2,
                                                      )
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                                width: MediaQuery.of(context).size.width *0.3,
                                                child: Padding(
                                                    padding: EdgeInsets.only(top:10, left:10, right:10),
                                                    child: Text('Persoanl & Home Essentials', textAlign:TextAlign.center,style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold))
                                                )
                                            )
                                          ],
                                        )
                                    )
                                )
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                right:10),
                            child: GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ProductsPage(),
                                    ),
                                  );
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(10.0),),
                                        border: Border.all(color: Colors.grey[400])
                                    ),
                                    child: Padding(
                                        padding: EdgeInsets.only(top:10),
                                        child: Column(
                                          children: [
                                            Stack(
                                              children: [
                                                Positioned(
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                            image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQx-YHTYySZO4IHxlF8acRE_nt3T3NHSOPjoQ&usqp=CAU"),
                                                            fit: BoxFit.fill,
                                                          ),
                                                          borderRadius: BorderRadius.all(Radius.circular(10.0),)
                                                      ),
                                                      child: Container(
                                                        height: MediaQuery.of(context).size.height * 0.1,
                                                        width: MediaQuery.of(context).size.width *0.2,
                                                      )
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                                width: MediaQuery.of(context).size.width *0.3,
                                                child: Padding(
                                                    padding: EdgeInsets.only(top:10, left:10, right:10),
                                                    child: Text('Persoanl & Home Essentials', textAlign:TextAlign.center,style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold))
                                                )
                                            )
                                          ],
                                        )
                                    )
                                )
                            )
                        ),
                      ],
                    )
                ),
                ProductCard(),
                ProductCard(),
                ProductCard(),
                ProductCard(),
                ProductCard(),
                ProductCard(),
                ProductCard()
              ],
            )
        )
    );
  }
}