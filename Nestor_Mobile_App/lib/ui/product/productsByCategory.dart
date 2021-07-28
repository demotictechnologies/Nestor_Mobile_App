import 'package:flutter/material.dart';
import 'package:nestore/model/result.dart';
import 'package:nestore/network/orders.dart';
import 'package:nestore/resources/app_color.dart';
import 'package:nestore/ui/cart/cart.dart';
import 'package:nestore/ui/chemist/chemistHome.dart';
import 'package:nestore/ui/common/search_field.dart';
import 'package:nestore/ui/home/InnerHeader.dart';
import 'package:nestore/ui/home/home.dart';
import 'package:nestore/ui/product/ProductDetail.dart';
import 'package:nestore/ui/product/products.dart';
import 'package:nestore/ui/product/productsCategory.dart';

class ProductByCategory extends StatefulWidget {
  var data;
  ProductByCategory({Key key, this.data}) : super(key: key);

  @override
  _ProductByCategoryState createState() => _ProductByCategoryState();
}

class _ProductByCategoryState extends State<ProductByCategory> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight( MediaQuery.of(context).size.height*0.1),
        child: InnerHeader(),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(
                left: 0, right: 0, top:0, bottom:0),
            child: Column(
              children: [
                AllRestaurants(data: this.widget.data)
              ],
            )
        ),
      ),
    );
  }
}

class AllRestaurants extends StatefulWidget {
  var data;
  AllRestaurants({Key key, this.data}) : super(key: key);

  @override
  _AllRestaurantsState createState() => _AllRestaurantsState();
}

class _AllRestaurantsState extends State<AllRestaurants> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController otpCtrl = TextEditingController(text: '');
  final authService = AuthService();
  List products = [];

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom:10, top:10, left:10, right:10),
        child: Container(
            color: Colors.white,
            child: Column(
              children: [
                for(int i=0; i<this.widget.data.length; i++)CategoryCard2(data: this.widget.data['groupcategories'][i])
              ],
            )
        )
    );
  }
}

class CategoryCard2 extends StatefulWidget {
  var data;
  CategoryCard2({Key key, this.data}) : super(key: key);

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard2> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            right:10, top:10, bottom:10),
        child: GestureDetector(
            onTap: (){
              print(this.widget.data);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductsCategory(id: this.widget.data['id'].toString()),
                ),
              );
            },
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0),),
                    border: Border.all(color: Colors.grey[400])
                ),
                child: Padding(
                    padding: EdgeInsets.only(top:10, bottom: 10),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Positioned(
                              child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage((this.widget.data['image'] != null ) ? this.widget.data['image'] : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQx-YHTYySZO4IHxlF8acRE_nt3T3NHSOPjoQ&usqp=CAU"),
                                        fit: BoxFit.fill,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(10.0),)
                                  ),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height * 0.125,
                                    width: MediaQuery.of(context).size.width *0.4,
                                  )
                              ),
                            ),
                          ],
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width *0.3,
                            child: Padding(
                                padding: EdgeInsets.only(top:10, left:10, right:10),
                                child: RichText(
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  strutStyle: StrutStyle(fontSize: 8.0,fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                      style: TextStyle(color: Colors.black, fontSize: 12.0,fontWeight: FontWeight.bold, ),
                                      text: (this.widget.data['name'] != null ) ? this.widget.data['name'] : ''),
                                )
                            )
                        )
                      ],
                    )
                )
            )
        )
    );
  }
}
