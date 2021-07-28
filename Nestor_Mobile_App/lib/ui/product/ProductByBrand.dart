import 'package:flutter/material.dart';
import 'package:nestore/model/result.dart';
import 'package:nestore/network/orders.dart';
import 'package:nestore/resources/app_color.dart';
import 'package:nestore/resources/app_style.dart';
import 'package:nestore/ui/cart/cart.dart';
import 'package:nestore/ui/common/search_field.dart';
import 'package:nestore/ui/home/InnerHeader.dart';
import 'package:nestore/ui/product/ProductDetail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductByBrand extends StatefulWidget {
  String id;
  ProductByBrand({Key key, this.id}) : super(key: key);

  @override
  _MainCategoriesState createState() => _MainCategoriesState();
}

class _MainCategoriesState extends State<ProductByBrand> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final authService = AuthService();

  List products = [];
  List cart = [];

  void initState() {
    super.initState();
    getProductsByGroup();
    getCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight( MediaQuery.of(context).size.height*0.11),
        child: InnerHeader(),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
            child: Column(
              children: [
                if (products != null && products.length <= 0)
                  Container(
                      height: 100,
                      child: Align(
                          alignment: Alignment.center,
                          child: Text('No Product Found!'))),
                if (products != null && products.length > 0)

                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: products.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ProductDetail(
                                    id: products[i]['id'].toString()),
                              ),
                            );
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey[100], width: 1),
                                      borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),),
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 25, bottom: 10, left: 0, right: 0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Container(
                                              child: Image.network(
                                                  products[i]['image']))),
                                      Expanded(
                                          flex: 2,
                                          child: Column(
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 5,
                                                      bottom: 5,
                                                      left: 10,
                                                      right: 5),
                                                  child: Text(
                                                      products[i]['generic_name'],
                                                      style: TextStyle(
                                                          fontWeight:
                                                          FontWeight.w500,
                                                          fontSize: AppStyles.SMALL_TEXTSIZE))),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 2,
                                                      bottom: 5,
                                                      left: 10,
                                                      right: 5),
                                                  child: Container(
                                                      width: double.infinity,
                                                      child: Wrap(
                                                        children: [
                                                          Text('MRP ',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                                  fontSize: AppStyles.SMALL_TEXTSIZE,
                                                                  color: Colors
                                                                      .deepOrangeAccent,
                                                                  decoration:
                                                                  TextDecoration
                                                                      .lineThrough)),
                                                          Text(
                                                              'Rs. ${products[i]['mrp_amount']} ',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                                  fontSize: AppStyles.SMALL_TEXTSIZE,
                                                                  color: Colors
                                                                      .deepOrangeAccent,
                                                                  decoration:
                                                                  TextDecoration
                                                                      .lineThrough)),
                                                          Text(
                                                              ' Rs. ${products[i]['chemist_amount']}',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                                  fontSize: AppStyles.SMALL_TEXTSIZE,
                                                                  color: Colors
                                                                      .lightGreen))
                                                        ],
                                                      ))),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 2,
                                                      bottom: 5,
                                                      left: 10,
                                                      right: 5),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                          child: Container(
                                                            width: double.infinity,
                                                            child: Text(
                                                                '${products[i]['package']}',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                    fontSize: AppStyles.SMALL_TEXTSIZE,
                                                                    color:
                                                                    Colors.grey)),
                                                          )),
                                                    ],
                                                  )),
                                              if (products[i] != null && isProductExistInCart(
                                                  products[i]['id']) !=
                                                  null)
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                                flex: 1,
                                                                child: Container(
                                                                    width: double
                                                                        .infinity,
                                                                    child:
                                                                    RawMaterialButton(
                                                                      onPressed: () {
                                                                        addItemToCart(
                                                                            products[
                                                                            i]
                                                                            [
                                                                            'id'],
                                                                            'remove');
                                                                      },
                                                                      elevation: 2.0,
                                                                      fillColor:
                                                                      Colors
                                                                          .white,
                                                                      child:
                                                                      Text('-', style: TextStyle(fontSize: AppStyles.SMALL_TEXTSIZE, fontWeight: FontWeight.bold)),
                                                                      padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                          1.0),
                                                                      shape:
                                                                      CircleBorder(),
                                                                    ))),
                                                            Expanded(
                                                                flex: 1,
                                                                child: Container(
                                                                    width: double
                                                                        .infinity,
                                                                    child: Text(
                                                                      getCartCount(products[i]['id']),
                                                                      textAlign:
                                                                      TextAlign
                                                                          .center, style: TextStyle(fontSize: AppStyles.SMALL_TEXTSIZE, fontWeight: FontWeight.bold)
                                                                    ))),
                                                                    Expanded(
                                                              flex: 1,
                                                              child:
                                                              RawMaterialButton(
                                                                onPressed: () {
                                                                  addItemToCart(
                                                                      products[i]
                                                                      ['id'],
                                                                      'add');
                                                                },
                                                                elevation: 2.0,
                                                                fillColor:
                                                                Colors.white,
                                                                child: Text('+', style: TextStyle(fontSize: AppStyles.SMALL_TEXTSIZE, fontWeight: FontWeight.bold)),
                                                                padding:
                                                                EdgeInsets.all(
                                                                    1.0),
                                                                shape: CircleBorder(),
                                                              ),
                                                            ),
                                                            
                                                            Expanded(
                                                                child: Container())
                                                          ],
                                                        )),
                                                  ],
                                                ),
                                              if (products[i] != null && isProductExistInCart(
                                                  products[i]['id']) ==
                                                  null)
                                                Wrap(
                                                  children: [
                                                    Padding(
                                                        padding: EdgeInsets.only(
                                                            left: 0,
                                                            right: 10,
                                                            top: 0,
                                                            bottom: 0),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            BuyNow(
                                                                products[i]['id'],
                                                                products[i][
                                                                'chemist_amount'],
                                                                products[i][
                                                                'product_type']);
                                                          },
                                                          child: Container(
                                                              decoration:
                                                              BoxDecoration(
                                                                  color: AppColors
                                                                      .primaryColor,
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .all(
                                                                    Radius.circular(
                                                                        20.0),
                                                                  )),
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                  0,
                                                                  vertical:
                                                                  20),
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                    left: 10,
                                                                    right: 10,
                                                                    top: 10,
                                                                    bottom:
                                                                    10),
                                                                child: Text(
                                                                    'BUY NOW',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                        fontSize:
                                                                        AppStyles.SMALL_TEXTSIZE,
                                                                        color: Colors
                                                                            .white),
                                                                    textAlign:
                                                                    TextAlign
                                                                        .center),
                                                              )),
                                                        )),
                                                    GestureDetector(
                                                      onTap: () {
                                                        addToCart(
                                                            products[i]['id'],
                                                            products[i][
                                                            'chemist_amount'],
                                                            products[i]
                                                            ['product_type']);
                                                      },
                                                      child: Container(
                                                          decoration:
                                                          BoxDecoration(
                                                              color: AppColors
                                                                  .primaryColor,
                                                              borderRadius:
                                                              BorderRadius
                                                                  .all(
                                                                Radius
                                                                    .circular(
                                                                    20.0),
                                                              )),
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                              horizontal: 0,
                                                              vertical: 20),
                                                          child: Padding(
                                                            padding:
                                                            EdgeInsets.only(
                                                                left: 10,
                                                                right: 10,
                                                                top: 10,
                                                                bottom: 10),
                                                            child: Text(
                                                                'ADD TO CART',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                    fontSize: AppStyles.SMALL_TEXTSIZE,
                                                                    color: Colors
                                                                        .white),
                                                                textAlign:
                                                                TextAlign
                                                                    .center),
                                                          )),
                                                    ),
                                                  ],
                                                )
                                            ],
                                          ))
                                    ],
                                  ))));
                    },
                  ),

                // if(Categories != null && Categories.length > 0)ShopByCategory(data: Categories)
              ],
            )),
      ),
    );
  }

  addItemToCart(product_id, type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String mobileValue = prefs.getString('mobile');
    var item;
    for (int i=0; i<cart.length; i++) {
      print(cart[i]['product_id']);
      print(int.parse(cart[i]['product_id']) == product_id);
      if(int.parse(cart[i]['product_id']) == product_id) {
        item = cart[i];
      }
    }

    var payload = {
      'product_id': item['product_id'],
      'Qty': 1,
      'amount': item['chemist_amount'],
      'type': type,
      'mobile': mobileValue
    };
    Result response  = await authService.addProductToCart(payload);
    if(response is SuccessState) {
      getCart();
    }
  }

  BuyNow(id, actual_amount, product_type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String mobileValue = prefs.getString('mobile');
    var payload = {
      'product_id': id,
      'Qty': 1,
      'amount': actual_amount,
      'type': product_type,
      'mobile': mobileValue
    };
    Result response  = await authService.addProductToCart(payload);
    if(response is SuccessState) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CartPage(),
        ),
      );
    }
  }

  addToCart(id, actual_amount, product_type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String mobileValue = prefs.getString('mobile');
    var payload = {
      'product_id': id,
      'Qty': 1,
      'amount': actual_amount,
      'type': product_type,
      'mobile': mobileValue
    };
    Result response  = await authService.addProductToCart(payload);
    if(response is SuccessState) {
      getCart();
    }
  }

  getCart() async {
    Result response  = await authService.fetchCart();
    if(response is SuccessState) {
      if(response.value['status'] == true) {
        for (var i = 0; i < response.value['data'].length; i++) {
          if (response.value['data'][i]['type'] == 'Products') {
            setState(() {
              cart = response.value['data'][i]['data'];
            });
          }
        }
      }
    }
  }

  isProductExistInCart(id) {
    if(id != null && cart.length > 0) {
      for (int i=0; i<cart.length; i++) {
        if(int.parse(cart[i]['product_id']) == id) {
          return true;
        }
      }
    }
  }

  getCartCount(id) {
    if(cart.length > 0) {
      for (int i=0; i<cart.length; i++) {
        if(int.parse(cart[i]['product_id']) == id) {
          return cart[i]['Qty'].toString();
        }
      }
    } else {
      return '1';
    }
  }

  getProductsByGroup() async {
    Result response = await authService.getProductsByBrand(this.widget.id);
    if (response is SuccessState) {
      if (response.value['status'] == true) {
        setState(() {
          products = response.value['data'];
        });
      } else {
        setState(() {
          products = [];
        });
      }
    } else {
      setState(() {
        products = [];
      });
    }
  }
}

class ShopByCategory extends StatefulWidget {
  List data;
  Function setGroup;
  ShopByCategory({Key key, this.data, this.setGroup}) : super(key: key);

  @override
  _ShopByCategoryState createState() => _ShopByCategoryState();
}

class _ShopByCategoryState extends State<ShopByCategory> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom:5),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: this.widget.data.length,
            itemBuilder: (BuildContext context, int i) {
              return CategoryCard(data: this.widget.data[i], setGroup: (id) {
                this.widget.setGroup(id);
              },);
            })

    );
  }
}

class CategoryCard extends StatefulWidget {
  var data;
  Function setGroup;
  CategoryCard({Key key, this.data, this.setGroup}) : super(key: key);

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            right:10, top:10, bottom:10),
        child: GestureDetector(
            onTap: (){
              print(this.widget.data);
              this.widget.setGroup(this.widget.data);
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
                                    height: MediaQuery.of(context).size.height * 0.05,
                                    width: MediaQuery.of(context).size.width *0.1,
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


class CustomDialogBox extends StatefulWidget {
  List data;
  Function setGroup;
  CustomDialogBox({Key key, this.data, this.setGroup}) : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }
  contentBox(context){
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10, top: 10, right: 10,bottom: 10
          ),
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(color: Colors.black,offset: Offset(0,10),
                    blurRadius: 10
                ),
              ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 15,),
              Text('Filter by category',style: TextStyle(fontSize: 14),textAlign: TextAlign.center,),
              SizedBox(height: 22,),
              ShopByCategory(data: this.widget.data, setGroup: (id){
                this.widget.setGroup(id);
                Navigator.of(context).pop();
              }),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Text('Close',style: TextStyle(fontSize: 18),)),
              ),
            ],
          ),
        ),
        Positioned(
          left: 10,
          right: 10,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 10,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image.asset("assets/model.jpeg")
            ),
          ),
        ),
      ],
    );
  }
}









class CustomDialogBox2 extends StatefulWidget {
  List data;
  Function setGroup;
  CustomDialogBox2({Key key, this.data, this.setGroup}) : super(key: key);

  @override
  _CustomDialogBoxState2 createState() => _CustomDialogBoxState2();
}

class _CustomDialogBoxState2 extends State<CustomDialogBox2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.black,offset: Offset(0,10),
                blurRadius: 10
            ),
          ]
      ),
      child: ShopByCategory(data: this.widget.data, setGroup: (id){
        this.widget.setGroup(id);
        Navigator.of(context).pop();
      }),
    );
  }
  contentBox(context){
    return Container(
      padding: EdgeInsets.only(left: 10, top: 10, right: 10,bottom: 0
      ),
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.black,offset: Offset(0,10),
                blurRadius: 10
            ),
          ]
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 5,),
          Text('Filter by category',style: TextStyle(fontSize: 14),textAlign: TextAlign.center,),
          SizedBox(height: 5,),


        ],
      ),
    );
  }
}