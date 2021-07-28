import 'package:flutter/material.dart';
import 'package:nestore/model/result.dart';
import 'package:nestore/network/orders.dart';
import 'package:nestore/resources/app_color.dart';
import 'package:nestore/resources/app_style.dart';
import 'package:nestore/ui/cart/cart.dart';
import 'package:nestore/ui/home/InnerHeader.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetail extends StatefulWidget {
  String id;
  ProductDetail({Key key, this.id}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final authService = AuthService();
  var product;
  List Similar_Products = [];
  List Therapeutic = [];
  List Precautions = [];
  List Usage = [];
  List Indicated = [];
  List Interactions =[];
  List Storage = [];
  List cart = [];

  void initState() {
    super.initState();
    getCart();
    getTermsAndCondition();

  }

  getCart() async {
    Result response = await authService.fetchCart();
    if (response is SuccessState) {
      if (response.value['status'] == true) {
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

  getCartCount(id) {
    if(cart.length > 0) {
      for (int i=0; i<cart.length; i++) {
        if(int.parse(cart[i]['product_id']) == id) {
          return cart[i]['Qty'].toString();
        }
      }
      return '1';
    } else {
      return '1';
    }
  }

  isProductExistInCart(id) {
    if(id != null && cart.length > 0) {
      for (int i=0; i<cart.length; i++) {
        print(cart[i]['product_id']);
        print(int.parse(cart[i]['product_id']) == id);
        if(int.parse(cart[i]['product_id']) == id) {
          return true;
        }
      }
    }
  }

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
                left: 10, right: 10, top:10, bottom:0),
            child: (product != null) ? Column(
              children: [

                if(product['image'] != null && product['image'].length > 0)
                Container(
                  width: double.infinity,
                  child: Padding(
                      padding: EdgeInsets.only(
                          left: 5, right: 5, top:20, bottom:0),
                    child: Image.network(product['image'][0], height: MediaQuery.of(context).size.height*0.3, width: MediaQuery.of(context).size.width,)
                  )
                ),
                Padding(
                    padding: EdgeInsets.only(top:MediaQuery.of(context).size.height * 0.00),
                    child: Container(
                      width: double.infinity,
                      child: Text(product['generic_name'],style: TextStyle(color: Colors.black, fontSize: AppStyles.MEDIUM_TEXTSIZE, fontWeight: FontWeight.w600),),
                    )
                ),
                Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
                    child: Container(
                      width: double.infinity,
                      child: Text(product['brand_name'],style: TextStyle(color: Colors.grey[600], fontSize: AppStyles.SMALL_TEXTSIZE, fontWeight: FontWeight.w600),),
                    )
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          )
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top:10, bottom: 10),
                        child: Text(product['product_type'], style: TextStyle(fontWeight: FontWeight.w400, fontSize: AppStyles.SMALL_TEXTSIZE, color: Colors.white),textAlign: TextAlign.center),
                      )
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top:MediaQuery.of(context).size.height * 0.015),
                    child: Container(
                      width: double.infinity,
                      child: Text('MRP Rs. ${product['mrp_amount']} (Incl. GST)',style: TextStyle(color: AppColors.primaryColor, fontSize: AppStyles.SMALL_TEXTSIZE, fontWeight: FontWeight.w600, decoration:
                      TextDecoration
                          .lineThrough),),
                    )
                ),
                Padding(
                    padding: EdgeInsets.only(top:MediaQuery.of(context).size.height * 0.015),
                    child: Container(
                      width: double.infinity,
                      child: Text('Price Rs. ${product['chemist_amount']} (excl. GST)',style: TextStyle(color: Colors.black, fontSize: AppStyles.SMALL_TEXTSIZE, fontWeight: FontWeight.w600,),),
                    )
                ),
                Padding(
                    padding: EdgeInsets.only(top:10),
                    child: Container(
                      width: double.infinity,
                      child: Text('Packaging: ${product['package_name']}',style: TextStyle(color: Colors.black, fontSize: AppStyles.SMALL_TEXTSIZE, fontWeight: FontWeight.w600,),),
                    )
                ),
                if (isProductExistInCart(
                    product['id']) !=
                    null &&
                    isProductExistInCart(
                        product['id']))
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
                                              product['id'],
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
                                      child: Text(getCartCount(product['id']),
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
                                        product['id'],
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
                if (isProductExistInCart(
                    product['id']) ==
                    null)
                Row(
                  children: [
                    Expanded(
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                            onTap: (){
                              BuyNow();
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20.0),
                                    )
                                ),
                                margin: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, top:10, bottom: 10),
                                  child: Text('BUY NOW', style: TextStyle(fontWeight: FontWeight.w400, fontSize: AppStyles.SMALL_TEXTSIZE, color: Colors.white),textAlign: TextAlign.center),
                                )
                            ),
                          )
                      ),
                    ),
                    Expanded(
                      flex:3,
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                            onTap: (){
                              addToCart();
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20.0),
                                    )
                                ),
                                margin: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, top:10, bottom: 10),
                                  child: Text('ADD TO CART', style: TextStyle(fontWeight: FontWeight.w400, fontSize: AppStyles.SMALL_TEXTSIZE, color: Colors.white),textAlign: TextAlign.center),
                                )
                            ),
                          )
                      ),
                    )
                  ],
                ),
                if(Therapeutic.length > 0)
                Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03, bottom:10),
                    child: Container(
                      width: double.infinity,
                      child: Text('Therapeutic Indications',style: TextStyle(color: Colors.black, fontSize: AppStyles.MEDIUM_TEXTSIZE, fontWeight: FontWeight.w600),),
                    )
                ),
                if(Therapeutic.length > 0)
                UnorderedList(Therapeutic),


                if(Precautions.length > 0)
                  Padding(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03, bottom:10),
                      child: Container(
                        width: double.infinity,
                        child: Text('Precautions & Warnings',style: TextStyle(color: Colors.black, fontSize: AppStyles.MEDIUM_TEXTSIZE, fontWeight: FontWeight.w600),),
                      )
                  ),
                if(Precautions.length > 0)
                  UnorderedList(Precautions),



                if(Usage.length > 0)
                  Padding(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03, bottom:10),
                      child: Container(
                        width: double.infinity,
                        child: Text('Usage Directions',style: TextStyle(color: Colors.black, fontSize: AppStyles.MEDIUM_TEXTSIZE, fontWeight: FontWeight.w600),),
                      )
                  ),
                if(Usage.length > 0)
                  UnorderedList(Usage),




                if(Indicated.length > 0)
                  Padding(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03, bottom:10),
                      child: Container(
                        width: double.infinity,
                        child: Text('Indicated Side Effects',style: TextStyle(color: Colors.black, fontSize: AppStyles.MEDIUM_TEXTSIZE, fontWeight: FontWeight.w600),),
                      )
                  ),
                if(Indicated.length > 0)
                  UnorderedList(Indicated),



                if(Interactions.length > 0)
                  Padding(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03, bottom:10),
                      child: Container(
                        width: double.infinity,
                        child: Text('Interactions',style: TextStyle(color: Colors.black, fontSize: AppStyles.MEDIUM_TEXTSIZE, fontWeight: FontWeight.w600),),
                      )
                  ),
                if(Interactions.length > 0)
                  UnorderedList(Interactions),


                if(Storage.length > 0)
                  Padding(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03, bottom:10),
                      child: Container(
                        width: double.infinity,
                        child: Text('Storage Condition',style: TextStyle(color: Colors.black, fontSize: AppStyles.MEDIUM_TEXTSIZE, fontWeight: FontWeight.w600),),
                      )
                  ),
                if(Storage.length > 0)
                  UnorderedList(Storage),

                if(Similar_Products.length > 0)
                  Padding(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03, bottom:10),
                      child: Container(
                        width: double.infinity,
                        child: Text('Similar Products',style: TextStyle(color: Colors.black, fontSize: AppStyles.MEDIUM_TEXTSIZE, fontWeight: FontWeight.w600),),
                      )
                  ),
                if (Similar_Products != null && Similar_Products.length > 0)
                  OrderHistory(data: Similar_Products, cart: cart, addToCart: (id, actual_amount, product_type){ addToCart2(id, actual_amount, product_type);}, BuyNow: (id, actual_amount, product_type){BuyNow2(id, actual_amount, product_type);}, addItemToCart: (product_id, type){addItemToCart(product_id, type);},),

                SizedBox(height: 25.0)
              ],
            ) : Container()
        ),
      ),
    );
  }

  getTermsAndCondition() async {
    Result response  = await authService.fetchProductDetail(this.widget.id);
    if(response is SuccessState) {
      if(response.value['status'] == true) {
        setState(() {
          product = response.value['data']['product'];
          if(response.value['data']['product']['description_data'].length > 0) {
            for (var text in response.value['data']['product']['description_data']) {
              // Add list item
              if(text['title'] == 'Therapeutic Indications') {
                if(text['descriptions'].length > 0) {
                  Therapeutic = text['descriptions'];
                }
              }


              if(text['title'] == 'Precautions & Warnings') {
                if(text['descriptions'].length > 0) {
                  Precautions = text['descriptions'];
                }
              }

              if(text['title'] == 'Usage Directions') {
                if(text['descriptions'].length > 0) {
                  Usage = text['descriptions'];
                }
              }

              if(text['title'] == 'Indicated Side Effects') {
                if(text['descriptions'].length > 0) {
                  Indicated = text['descriptions'];
                }
              }

              if(text['title'] == 'Interactions') {
                if(text['descriptions'].length > 0) {
                  Interactions = text['descriptions'];
                }
              }

              if(text['title'] == 'Storage Condition') {
                if(text['descriptions'].length > 0) {
                  Storage = text['descriptions'];
                }
              }
            }
          }

          if(response.value['data']['Similar_Products'] != null  && response.value['data']['Similar_Products'].length > 0){
            Similar_Products = response.value['data']['Similar_Products'];
          }
        });
      }
    }
  }

  addToCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String mobileValue = prefs.getString('mobile');
    var payload = {
      'product_id': this.widget.id,
      'Qty': 1,
      'amount': product['actual_amount'],
      'type': product['product_type'],
      'mobile': mobileValue
    };
    Result response  = await authService.addProductToCart(payload);
    if(response is SuccessState) {
      final snackBar = SnackBar(
        content: Text(response.value['message']),
        duration: Duration(seconds: 2),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
      getCart();
    }
  }
  addToCart2(id, actual_amount, product_type) async {
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
  BuyNow2(id, actual_amount, product_type) async {
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

  addItemToCart(product_id, type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String mobileValue = prefs.getString('mobile');
    var item;
    for (int i = 0; i < cart.length; i++) {
      if (int.parse(cart[i]['product_id']) == product_id) {
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
    Result response = await authService.addProductToCart(payload);
    if (response is SuccessState) {
      getCart();
    }
  }

  BuyNow() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String mobileValue = prefs.getString('mobile');
    var payload = {
      'product_id': this.widget.id,
      'Qty': 1,
      'amount': product['actual_amount'],
      'type': product['product_type'],
      'mobile': mobileValue
    };
    Result response  = await authService.addProductToCart(payload);
    if(response is SuccessState) {
      final snackBar = SnackBar(
        content: Text(response.value['message']),
        duration: Duration(seconds: 2),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CartPage(),
        ),
      );
    }
  }
}

class UnorderedList extends StatelessWidget {
  UnorderedList(this.texts);
  final List texts;

  @override
  Widget build(BuildContext context) {
    var widgetList = <Widget>[];
    for (var text in texts) {
      // Add list item
      print(texts);
      widgetList.add(UnorderedListItem(text['description'].toString()));
      // Add space between items
      widgetList.add(SizedBox(height: 5.0));
    }

    return Column(children: widgetList);
  }
}

class UnorderedListItem extends StatelessWidget {
  UnorderedListItem(this.text);
  String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("• "),
        Expanded(
          child: Text(text.toString()),
        ),
      ],
    );
  }
}


class OrderHistory extends StatefulWidget {
  List data;
  List cart;
  Function addToCart;
  Function BuyNow;
  Function addItemToCart;
  OrderHistory({Key key, this.data, this.cart, this.addToCart, this.BuyNow, this.addItemToCart}) : super(key: key);

  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10, bottom: 10),
        child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                    color: Colors.white,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 0),
                    height: MediaQuery.of(context).size.height < 800 ? (MediaQuery.of(context).size.height * 0.45) : MediaQuery.of(context).size.height < 800 ? (MediaQuery.of(context).size.height * 0.45) : (MediaQuery.of(context).size.height * 0.35),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        for (int i = 0; i < this.widget.data.length; i++)
                          Container(
                              width: MediaQuery.of(context).size.width *0.75,
                              child: GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => ProductDetail(
                                            id: this
                                                .widget
                                                .data[i]['productId'] != null ? this
                                                .widget
                                                .data[i]['productId']
                                                .toString() : this
                                                .widget
                                                .data[i]['id'].toString()),
                                      ),
                                    );
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(10.0),),
                                          border: Border.all(color: Colors.grey[100], width:1)
                                      ),
                                      child: Padding(
                                          padding: EdgeInsets.only(top:25, bottom:10, left:0, right: 0),
                                          child: Column(
                                            children: [
                                              Expanded(
                                                  child: Container(

                                                      child: Image.network(this.widget.data[i]['image'])
                                                  )
                                              ),
                                              Expanded(
                                                  flex:2,
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.only(top:5, bottom:5, left:30, right: 30),
                                                        child: RichText(
                                                          maxLines: 2,
                                                          textAlign: TextAlign.center,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          strutStyle: StrutStyle(
                                                              fontSize: 8.0,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w600),
                                                          text: TextSpan(
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: AppStyles.SMALL_TEXTSIZE,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w400),

                                                              text: (this.widget.data[
                                                              i][
                                                              'generic_name'] !=
                                                                  null)
                                                                  ? this
                                                                  .widget
                                                                  .data[i]
                                                              [
                                                              'generic_name']
                                                                  : ''),
                                                        ),
                                                      ),
                                                      Padding(
                                                          padding: EdgeInsets.only(top:2, bottom:5, left:10, right: 5),
                                                          child: Container(
                                                              width: double.infinity,
                                                              child: Align(
                                                                alignment: Alignment.center,
                                                                child: Wrap(
                                                                  children: [
                                                                    Text('MRP ', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500, fontSize: AppStyles.SMALL_TEXTSIZE,color: Colors.deepOrangeAccent,decoration: TextDecoration.lineThrough)),
                                                                    Text('Rs. ${this.widget.data[i]['mrp_amount']} ', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500, fontSize: AppStyles.SMALL_TEXTSIZE, color: Colors.deepOrangeAccent, decoration: TextDecoration.lineThrough)),
                                                                    Text(' Rs. ${this.widget.data[i]['chemist_amount']}', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500, fontSize: AppStyles.SMALL_TEXTSIZE, color: Colors.lightGreen))
                                                                  ],
                                                                ),
                                                              )
                                                          )
                                                      ),
                                                      Padding(
                                                          padding: EdgeInsets.only(top:2, bottom:5, left:10, right: 5),
                                                          child: Row(
                                                            children: [
                                                              Expanded(
                                                                  child: Container(
                                                                    width: double.infinity,
                                                                    child: Text('${this.widget.data[i]['package']}', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500, fontSize: AppStyles.SMALL_TEXTSIZE, color: Colors.grey)),
                                                                  )
                                                              ),

                                                            ],
                                                          )
                                                      ),
                                                      if(isProductExistInCart(this
                                                          .widget
                                                          .data[i]['productId'] != null ? this
                                                          .widget
                                                          .data[i]['productId'] : this
                                                          .widget
                                                          .data[i]['id']) != null &&  isProductExistInCart(this
                                                          .widget
                                                          .data[i]['productId'] != null ? this
                                                          .widget
                                                          .data[i]['productId'] : this
                                                          .widget
                                                          .data[i]['id']))Align(
                                                          alignment: Alignment.center,
                                                          child: Row(
                                                            children: [
                                                              Expanded(child: Align(
                                                                  alignment: Alignment.center,
                                                                  child: Row(
                                                                    children: [
                                                                      Expanded(
                                                                          flex:5,
                                                                          child: Align(
                                                                              alignment: Alignment.center,
                                                                              child: Container(
                                                                                  child: RawMaterialButton(
                                                                                    onPressed: () {
                                                                                      this.widget.addItemToCart(this
                                                                                          .widget
                                                                                          .data[i]['productId'] != null ? this
                                                                                          .widget
                                                                                          .data[i]['productId'] : this
                                                                                          .widget
                                                                                          .data[i]['id'], 'remove');
                                                                                    },
                                                                                    elevation: 2.0,
                                                                                    fillColor: Colors.white,
                                                                                    child:Text('-', style: TextStyle(fontSize: AppStyles.SMALL_TEXTSIZE, fontWeight: FontWeight.bold)),
                                                                                    padding: EdgeInsets.all(1.0),
                                                                                    shape: CircleBorder(),
                                                                                  )
                                                                              )
                                                                          )
                                                                      ),
                                                                      Expanded(
                                                                          flex:1,
                                                                          child: Container(
                                                                              child: Text(getCartCount(this
                                                                                  .widget
                                                                                  .data[i]['id']), textAlign: TextAlign.center, style: TextStyle(fontSize: AppStyles.SMALL_TEXTSIZE, fontWeight: FontWeight.bold))
                                                                          )
                                                                      ),
                                                                      Expanded(
                                                                        flex:5,
                                                                        child: RawMaterialButton(
                                                                          onPressed: () {
                                                                            this.widget.addItemToCart(this
                                                                                .widget
                                                                                .data[i]['productId'] != null ? this
                                                                                .widget
                                                                                .data[i]['productId'] : this
                                                                                .widget
                                                                                .data[i]['id'], 'add');
                                                                          },
                                                                          elevation: 2.0,
                                                                          fillColor: Colors.white,
                                                                          child: Text('+', style: TextStyle(fontSize: AppStyles.SMALL_TEXTSIZE, fontWeight: FontWeight.bold)),
                                                                          padding: EdgeInsets.all(1.0),
                                                                          shape: CircleBorder(),
                                                                        ),

                                                                      ),
                                                                      Expanded(
                                                                          child: Container()
                                                                      )
                                                                    ],
                                                                  )
                                                              )),
                                                            ],
                                                          )
                                                      ),
                                                      if(isProductExistInCart(this
                                                          .widget
                                                          .data[i]['productId'] != null ? this
                                                          .widget
                                                          .data[i]['productId'] : this
                                                          .widget
                                                          .data[i]['id']) == null)Row(
                                                        children: [
                                                          Expanded(
                                                            child: Align(
                                                                alignment: Alignment.topRight,
                                                                child: GestureDetector(
                                                                  onTap: (){
                                                                    this.widget.BuyNow(this
                                                                        .widget
                                                                        .data[i]['productId'] != null ? this
                                                                        .widget
                                                                        .data[i]['productId'] : this
                                                                        .widget
                                                                        .data[i]['id'], this.widget.data[i]['chemist_amount'], this.widget.data[i]['product_type']);
                                                                  },
                                                                  child: Container(
                                                                      decoration: BoxDecoration(
                                                                          color: AppColors.primaryColor,
                                                                          borderRadius: BorderRadius.all(
                                                                            Radius.circular(20.0),
                                                                          )
                                                                      ),
                                                                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                                                                      child: Padding(
                                                                        padding: EdgeInsets.only(
                                                                            left: 10, right: 10, top:10, bottom: 10),
                                                                        child: Text('BUY NOW', style: TextStyle(fontWeight: FontWeight.w400, fontSize: AppStyles.SMALL_TEXTSIZE, color: Colors.white),textAlign: TextAlign.center),
                                                                      )
                                                                  ),
                                                                )
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Align(
                                                                alignment: Alignment.topLeft,
                                                                child: GestureDetector(
                                                                  onTap: (){
                                                                    this.widget.addToCart(this
                                                                        .widget
                                                                        .data[i]['productId'] != null ? this
                                                                        .widget
                                                                        .data[i]['productId'] : this
                                                                        .widget
                                                                        .data[i]['id'], this.widget.data[i]['chemist_amount'], this.widget.data[i]['product_type']);
                                                                  },
                                                                  child: Container(
                                                                      decoration: BoxDecoration(
                                                                          color: AppColors.primaryColor,
                                                                          borderRadius: BorderRadius.all(
                                                                            Radius.circular(20.0),
                                                                          )
                                                                      ),
                                                                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                                                                      child: Padding(
                                                                        padding: EdgeInsets.only(
                                                                            left: 10, right: 10, top:10, bottom: 10),
                                                                        child: Text('ADD TO CART', style: TextStyle(fontWeight: FontWeight.w400, fontSize: AppStyles.SMALL_TEXTSIZE, color: Colors.white),textAlign: TextAlign.center),
                                                                      )
                                                                  ),
                                                                )
                                                            ),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  )
                                              )
                                            ],
                                          )
                                      )
                                  )
                              )
                          )

                      ],
                    ))
              ],
            )));
  }
  getCartCount(id) {
    if(this.widget.cart.length > 0) {
      for (int i=0; i<this.widget.cart.length; i++) {
        if(int.parse(this.widget.cart[i]['product_id']) == id) {
          return this.widget.cart[i]['Qty'].toString();
        }
      }
      return '1';
    } else {
      return '1';
    }
  }
  isProductExistInCart(id) {
    if(id != null && this.widget.cart.length > 0) {
      for (int i=0; i<this.widget.cart.length; i++) {
        print(this.widget.cart[i]['product_id']);
        print(int.parse(this.widget.cart[i]['product_id']) == id);
        if(int.parse(this.widget.cart[i]['product_id']) == id) {
          return true;
        }
      }
    }
  }
}