import 'package:flutter/material.dart';
import 'package:nestore/model/result.dart';
import 'package:nestore/network/orders.dart';
import 'package:nestore/resources/app_color.dart';
import 'package:nestore/resources/app_style.dart';
import 'package:nestore/ui/cart/cart.dart';
import 'package:nestore/ui/common/search_field.dart';
import 'package:nestore/ui/home/InnerHeader.dart';
import 'package:nestore/ui/product/ProductDetail.dart';
import 'package:nestore/ui/product/products.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductsCategory extends StatefulWidget {
  String id;
  ProductsCategory({Key key, this.id}) : super(key: key);

  @override
  _HotelHomeState createState() => _HotelHomeState();
}

class _HotelHomeState extends State<ProductsCategory> {
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
                AllRestaurants(id: this.widget.id)
              ],
            )
        ),
      ),
    );
  }
}

class AllRestaurants extends StatefulWidget {
  String id;
  AllRestaurants({Key key, this.id}) : super(key: key);

  @override
  _AllRestaurantsState createState() => _AllRestaurantsState();
}

class _AllRestaurantsState extends State<AllRestaurants> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController otpCtrl = TextEditingController(text: '');
  final authService = AuthService();
  List products = [];
  List cart = [];

  void initState() {
    super.initState();
    getTermsAndCondition();
    getCart();
  }

  getCart() async {
    Result response  = await authService.fetchCart();
    if(response is SuccessState) {
      if(response.value['status'] == true) {
        for (var i = 0; i < response.value['data'].length; i++) {
          print(response.value['data'][i]['data']);
          if (response.value['data'][i]['type'] == 'Products') {
            setState(() {
              cart = response.value['data'][i]['data'];
            });
          }
        }
      }
    }
  }
  getTermsAndCondition() async {
    Result response  = await authService.fetchProductByGroup(this.widget.id);
    if(response is SuccessState) {

      if(response.value['status'] == true) {
        if(response.value['data'].length > 0) {
          setState(() {
            products = response.value['data'];
          });
        }

      }
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
    return Padding(
        padding: EdgeInsets.only(bottom:10, top:10, left:10, right:10),
        child: Container(
            color: Colors.white,
            child: Column(
              children: [

                if(products != null && products.length <= 0)
                  Container(
                      height: 100,
                      child: Align(
                          alignment: Alignment.center,
                          child: Text('No Products Found!')
                      )
                  ),
                if(products != null && products.length > 0)
                  for (int i=0; i<products.length; i++)GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ProductDetail(id: products[i]['id'].toString()),
                          ),
                        );
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey[100], width:1),
                              borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                          ),
                          child: Padding(
                              padding: EdgeInsets.only(top:25, bottom:10, left:0, right: 0),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Container(

                                          child: Image.network(products[i]['image'])
                                      )
                                  ),
                                  Expanded(
                                      flex:2,
                                      child: Column(
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.only(top:5, bottom:5, left:10, right: 5),
                                              child: Text(products[i]['generic_name'], style: TextStyle(fontWeight: FontWeight.w500, fontSize: AppStyles.SMALL_TEXTSIZE))
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(top:2, bottom:5, left:10, right: 5),
                                              child: Container(
                                                  width: double.infinity,
                                                  child: Wrap(
                                                    children: [
                                                      Text('MRP ', style: TextStyle(fontWeight: FontWeight.w500, fontSize: AppStyles.SMALL_TEXTSIZE,color: Colors.deepOrangeAccent,decoration: TextDecoration.lineThrough)),
                                                      Text('Rs. ${products[i]['mrp_amount']} ', style: TextStyle(fontWeight: FontWeight.w500, fontSize: AppStyles.SMALL_TEXTSIZE, color: Colors.deepOrangeAccent, decoration: TextDecoration.lineThrough)),
                                                      Text(' Rs. ${products[i]['chemist_amount']}', style: TextStyle(fontWeight: FontWeight.w500, fontSize: AppStyles.SMALL_TEXTSIZE, color: Colors.lightGreen))
                                                    ],
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
                                                        child: Text('${products[i]['package']}', style: TextStyle(fontWeight: FontWeight.w500, fontSize: AppStyles.SMALL_TEXTSIZE, color: Colors.grey)),
                                                      )
                                                  ),

                                                ],
                                              )
                                          ),
                                          if(isProductExistInCart(products[i]['id']) != null &&  isProductExistInCart(products[i]['id']))Row(
                                            children: [
                                              Expanded(child: Row(
                                                children: [

                                                  Expanded(
                                                      flex:1,
                                                      child: Container(
                                                          width: double.infinity,
                                                          child: RawMaterialButton(
                                                            onPressed: () {
                                                              addItemToCart(products[i]['id'], 'remove');
                                                            },
                                                            elevation: 2.0,
                                                            fillColor: Colors.white,
                                                            child:Text('-', style: TextStyle(fontSize: AppStyles.SMALL_TEXTSIZE, fontWeight: FontWeight.bold)),
                                                            padding: EdgeInsets.all(1.0),
                                                            shape: CircleBorder(),
                                                          )
                                                      )
                                                  ),
                                                  Expanded(
                                                      flex:1,
                                                      child: Container(
                                                          width: double.infinity,
                                                          child: Text(cart[i]['Qty'], textAlign: TextAlign.center, style: TextStyle(fontSize: AppStyles.SMALL_TEXTSIZE, fontWeight: FontWeight.bold))
                                                      )
                                                  ),
                                                  Expanded(
                                                    flex:1,
                                                    child: RawMaterialButton(
                                                      onPressed: () {
                                                        addItemToCart(products[i]['id'], 'add');
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
                                              )),
                                            ],
                                          ),
                                          if(isProductExistInCart(products[i]['id']) == null)Row(
                                            children: [
                                              Expanded(
                                                child: Align(
                                                    alignment: Alignment.topLeft,
                                                    child: GestureDetector(
                                                      onTap: (){
                                                        BuyNow(products[i]['id'], products[i]['chemist_amount'], products[i]['product_type']);
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
                                                        addToCart(products[i]['id'], products[i]['chemist_amount'], products[i]['product_type']);
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
                                          )
                                        ],
                                      )
                                  )
                                ],
                              )
                          )
                      )
                  ),
              ],
            )
        )
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
}
