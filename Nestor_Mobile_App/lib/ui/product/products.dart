import 'package:flutter/material.dart';
import 'package:nestore/resources/app_color.dart';
import 'package:nestore/ui/cart/cart.dart';
import 'package:nestore/ui/product/ProductList.dart';

class ProductsPage extends StatefulWidget {
  ProductsPage({Key key}) : super(key: key);

  @override
  _HotelHomeState createState() => _HotelHomeState();
}

class _HotelHomeState extends State<ProductsPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight( MediaQuery.of(context).size.height*0.126),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0),
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Container(
                  color: Colors.white,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: MediaQuery.of(context).size.height * 0.015),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex:1,
                              child: GestureDetector(
                                  onTap:(){
                                    Navigator.of(context).pop();
                                  },
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Icon(Icons.arrow_back, size: 30,color: AppColors.primaryColor)
                                  )
                              )
                            ),
                            Expanded(
                              flex:5,
                              child:  Text('NESTOR', textAlign: TextAlign.center,style: TextStyle(color: AppColors.primaryColor, fontSize: 20, fontWeight: FontWeight.bold),),
                            ),
                            Expanded(
                              child: Align(
                                child: Padding(
                                    padding: EdgeInsets.only(
                                    ),
                                    child: Icon(Icons.search_rounded, color: AppColors.primaryColor)
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                child: Padding(
                                    padding: EdgeInsets.only(
                                    ),
                                    child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => CartPage(),
                                            ),
                                          );
                                        },
                                        child: Icon(Icons.shopping_cart_rounded, color: AppColors.primaryColor)
                                    )
                                ),
                              ),
                            )
                          ],
                        ),
                       Padding(
                          padding: EdgeInsets.only(top:MediaQuery.of(context).size.height * 0.006),
                          child: Container(
                            width: double.infinity,
                            child: Text('Covid Essentials',style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),),
                          )
                        )
                      ],
                    )
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(
                left: 0, right: 0, top:0, bottom:0),
            child: Column(
              children: [
                ProductList()
              ],
            )
        ),
      ),
    );
  }
}
