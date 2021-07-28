import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nestore/model/result.dart';
import 'package:nestore/network/orders.dart';
import 'package:nestore/resources/app_color.dart';
import 'package:nestore/resources/app_style.dart';
import 'package:nestore/ui/cart/cart.dart';
import 'package:nestore/ui/common/Loader.dart';
import 'package:nestore/ui/product/ProductByBrand.dart';
import 'package:nestore/ui/product/ProductDetail.dart';
import 'package:nestore/ui/product/categories.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class ChemistHome extends StatefulWidget {
  ChemistHome({Key key}) : super(key: key);

  @override
  _HotelHomeState createState() => _HotelHomeState();
}

class _HotelHomeState extends State<ChemistHome> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final authService = AuthService();
  List Slider = [];
  var Call;
  List Recent_Order = [];
  List Deal_of_the_day = [];
  List Trending_Today = [];
  List Categories = [];
  var Nestor_Balance;
  List cart = [];
  bool loading = true;

  void initState() {
    super.initState();
    getChemistHomeData();
    getCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: loading ? Align(
        alignment: Alignment.center,
        child: Loader(),
      ) : SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
            child: Column(
              children: [
                if (Slider != null && Slider.length > 0)
                  AllCuisines(data: Slider),
                Container(

                  width: double.infinity,
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: 30, bottom: 0, left: 10, right: 10),
                      child: RawMaterialButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius
                              .all(
                            Radius
                                .circular(
                                20.0),
                          )),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => MainCategories(),
                            ),
                          );
                        },
                        elevation: 3.0,
                        fillColor: AppColors.primaryColor,
                        child: Text(
                          'Place an Order Now',
                          style: TextStyle(color: Colors.white),
                        ),
                        padding: EdgeInsets.all(20.0),
                      )),
                ),

                if (Call != null) ByTypeOfFood(data: Call),

                if (Deal_of_the_day != null && Deal_of_the_day.length > 0)
                  DealOfTheDay(data: Deal_of_the_day),
                Padding(
                    padding: EdgeInsets.only(
                        top: 5, bottom: 10, right: 10, left: 10),
                    child: Container(
                      width: double.infinity,
                      child: Text(
                        'BRANDS',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: AppStyles.MEDIUM_TEXTSIZE),
                      ),
                    )),
                if (Categories != null && Categories.length > 0)
                  ShopByCategory(data: Categories),
                // if(Nestor_Balance != null && Nestor_Balance.length > 0)ShopByHealthArea(data: Nestor_Balance)
                Padding(
                    padding: EdgeInsets.only(
                        top: 5, bottom: 10, right: 10, left: 10),
                    child: Container(
                      width: double.infinity,
                      child: Text(
                        'RECENT ORDER',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: AppStyles.MEDIUM_TEXTSIZE),
                      ),
                    )),
                if (Recent_Order != null && Recent_Order.length > 0)
                  RecentOrder(data: Recent_Order, cart: cart, addToCart: (id, actual_amount, product_type){ addToCart(id, actual_amount, product_type);}, BuyNow: (id, actual_amount, product_type){BuyNow(id, actual_amount, product_type);}, addItemToCart: (product_id, type){addItemToCart(product_id, type);},),
                Padding(
                    padding: EdgeInsets.only(
                        top: 5, bottom: 10, right: 10, left: 10),
                    child: Container(
                      width: double.infinity,
                      child: Text(
                        'TRENDING TODAY',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: AppStyles.MEDIUM_TEXTSIZE),
                      ),
                    )),
                if (Trending_Today != null && Trending_Today.length > 0)
                  OrderHistory(data: Trending_Today, cart: cart, addToCart: (id, actual_amount, product_type){ addToCart(id, actual_amount, product_type);}, BuyNow: (id, actual_amount, product_type){BuyNow(id, actual_amount, product_type);}, addItemToCart: (product_id, type){addItemToCart(product_id, type);},),
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
  getChemistHomeData() async {
    Result response = await authService.getChemistHomeData();
    if (response is SuccessState) {
      if (response.value['status'] == true) {
        if (response.value['data'].length > 0) {
          for (var i = 0; i < response.value['data'].length; i++) {
            print(response.value['data'][i]);
            if (response.value['data'][i]['type'] == 'Slider') {
              setState(() {
                Slider = response.value['data'][i]['data'];
              });
            }

            if (response.value['data'][i]['type'] == 'Deal_of_the_day') {
              setState(() {
                Deal_of_the_day = response.value['data'][i]['data'];
              });
            }

            if (response.value['data'][i]['type'] == 'Trending_Today') {
              setState(() {
                Trending_Today = response.value['data'][i]['data'];
              });
            }
            if (response.value['data'][i]['type'] == 'Call') {
              setState(() {
                Call = response.value['data'][i]['data'];
              });
            }
            if (response.value['data'][i]['type'] == 'Recent_Order') {
              setState(() {
                Recent_Order = response.value['data'][i]['data'];
              });
            }
            if (response.value['data'][i]['type'] == 'Brand') {
              setState(() {
                Categories = response.value['data'][i]['data'];
              });
            }
            if (response.value['data'][i]['type'] == 'Nestor_Balance') {
              setState(() {
                Nestor_Balance = response.value['data'][i]['data'];
              });
            }
          }
          setState(() {
            loading = false;
          });
        }
      }
    }
  }
}

class AllCuisines extends StatefulWidget {
  List data;
  AllCuisines({Key key, this.data}) : super(key: key);

  @override
  _AllCuisinesState createState() => _AllCuisinesState();
}

class _AllCuisinesState extends State<AllCuisines> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.2,
        autoPlay: true,
        aspectRatio: 2,
        viewportFraction: 1,
      ),
      items: this.widget.data.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                // decoration: BoxDecoration(
                //     borderRadius: BorderRadius.all(Radius.circular(10.0),),
                //     border: Border.all(color: Colors.grey[400])
                // ),
                child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Positioned(
                                child: Padding(
                              padding:
                                  EdgeInsets.only(top: 0, left: 0, right: 0),
                              child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage((i['image'] != null)
                                            ? i['image']
                                            : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQx-YHTYySZO4IHxlF8acRE_nt3T3NHSOPjoQ&usqp=CAU"),
                                        fit: BoxFit.fill,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      )),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.18,
                                    width: MediaQuery.of(context).size.width,
                                  )),
                            )),
                          ],
                        ),
                      ],
                    )));
          },
        );
      }).toList(),
    )

        // Container(
        //     color: Colors.grey[200],
        //     width: double.infinity,
        //     margin: EdgeInsets.symmetric(vertical: 0),
        //     height: (MediaQuery.of(context).size.height * 0.2),
        //     child: ListView(
        //       scrollDirection: Axis.horizontal,
        //       children: <Widget>[
        //         for (int i=0; i<this.widget.data.length; i++)Padding(
        //             padding: EdgeInsets.only(
        //                 right:10),
        //             child: GestureDetector(
        //                 onTap: (){
        //                   // Navigator.of(context).push(
        //                   //   MaterialPageRoute(
        //                   //     builder: (context) => ProductsPage(),
        //                   //   ),
        //                   // );
        //                 },
        //                 child: Container(
        //                     // decoration: BoxDecoration(
        //                     //     borderRadius: BorderRadius.all(Radius.circular(10.0),),
        //                     //     border: Border.all(color: Colors.grey[400])
        //                     // ),
        //                     child: Padding(
        //                         padding: EdgeInsets.only(top:10),
        //                         child: Column(
        //                           children: [
        //                             Stack(
        //                               children: [
        //                                 Positioned(
        //                                   child: Padding(
        //                                     padding: EdgeInsets.only(top:0, left: 0, right:0),
        //                                     child: Container(
        //                                         decoration: BoxDecoration(
        //                                             image: DecorationImage(
        //                                               image: NetworkImage((this.widget.data[i]['image'] != null ) ? this.widget.data[i]['image'] : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQx-YHTYySZO4IHxlF8acRE_nt3T3NHSOPjoQ&usqp=CAU"),
        //                                               fit: BoxFit.fill,
        //                                             ),
        //                                             borderRadius: BorderRadius.all(Radius.circular(10.0),)
        //                                         ),
        //                                         child: Container(
        //                                           height: MediaQuery.of(context).size.height * 0.18,
        //                                           width: MediaQuery.of(context).size.width,
        //                                         )
        //                                     ),
        //                                   )
        //                                 ),
        //                               ],
        //                             ),
        //                           ],
        //                         )
        //                     )
        //                 )
        //             )
        //         ),
        //       ],
        //     ))
        );
  }
}

class ByTypeOfFood extends StatefulWidget {
  var data;
  ByTypeOfFood({Key key, this.data}) : super(key: key);

  @override
  _ByTypeOfFoodState createState() => _ByTypeOfFoodState();
}

class _ByTypeOfFoodState extends State<ByTypeOfFood> {
  _launchCaller(number) async {
    var url = "tel:$number";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            width: double.infinity,
            color: Colors.grey[100],
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 0),
              child: Container(
                color: Colors.grey[100],
                child: Padding(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 0),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 0, bottom: 10),
                          child: Container(
                            width: double.infinity,
                            child: Padding(
                                padding: EdgeInsets.only(
                                    top: 0, bottom: 0, left: 0, right: 0),
                                child: RawMaterialButton(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius
                                      .all(
                                    Radius
                                        .circular(
                                        20.0),
                                  )),
                                  onPressed: () {
                                    _launchCaller(this.widget.data['phoneNo']);
                                  },
                                  elevation: 3.0,
                                  fillColor: AppColors.primaryColor,
                                  child: Text(
                                    'Call Now',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  padding: EdgeInsets.all(20.0),
                                )),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: Padding(
                              padding: EdgeInsets.only(
                                  top: 10, bottom: 10, left: 0, right: 0),
                              child: RawMaterialButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius
                                    .all(
                                  Radius
                                      .circular(
                                      20.0),
                                )),
                                onPressed: () {},
                                elevation: 3.0,
                                fillColor: AppColors.primaryColor,
                                child: Text(
                                  'Chat with us',
                                  style: TextStyle(color: Colors.white),
                                ),
                                padding: EdgeInsets.all(20.0),
                              )),
                        ),
                      ],
                    )),
              ),
            )));
  }
}
class RecentOrder extends StatefulWidget {
  List data;
  List cart;
  Function addToCart;
  Function BuyNow;
  Function addItemToCart;
  RecentOrder({Key key, this.data, this.cart, this.addToCart, this.BuyNow, this.addItemToCart}) : super(key: key);

  @override
  _RecentOrderState createState() => _RecentOrderState();
}

class _RecentOrderState extends State<RecentOrder> {
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
                                                .data[i]['productId'].toString()),
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
                                                          .data[i]['productId']) != null &&  isProductExistInCart(this
                                                          .widget
                                                          .data[i]['productId']))Align(
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
                                                                                          .data[i]['productId'], 'remove');
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
                                                                                  .data[i]['productId']), textAlign: TextAlign.center, style: TextStyle(fontSize: AppStyles.SMALL_TEXTSIZE, fontWeight: FontWeight.bold))
                                                                          )
                                                                      ),
                                                                      Expanded(
                                                                        flex:5,
                                                                        child: RawMaterialButton(
                                                                          onPressed: () {
                                                                            this.widget.addItemToCart(this
                                                                                .widget
                                                                                .data[i]['productId'], 'add');
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

class ShopByCategory extends StatefulWidget {
  List data;
  ShopByCategory({Key key, this.data}) : super(key: key);

  @override
  _ShopByCategoryState createState() => _ShopByCategoryState();
}

class _ShopByCategoryState extends State<ShopByCategory> {

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10, right: 0, top: 5, bottom: 5),
        child: Container(
          color: Colors.white,
          margin: EdgeInsets.symmetric(vertical: 0),
          child: Column(
            children: [
              for (int i = 0; i < this.widget.data.length; i++)
                CategoryCard(data: this.widget.data[i])
            ],
          )
    )
    );

  }
}

class CategoryCard extends StatefulWidget {
  var data;
  CategoryCard({Key key, this.data}) : super(key: key);

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 10, top: 10, bottom: 10),
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      ProductByBrand(id: this.widget.data['ProductBrand_Code'].toString()),
                ),
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0),),
                    border: Border.all(color: Colors.grey[100], width:1)
                ),
                child: Padding(
                    padding: EdgeInsets.only(top:25, bottom:10, left:0, right: 0),
                    child: Column(
                      children: [
                        Container(
                            child: Image.network((this
                                .widget
                                .data['image'] !=
                                null)
                                ? this.widget.data['image']
                                : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQx-YHTYySZO4IHxlF8acRE_nt3T3NHSOPjoQ&usqp=CAU", height: MediaQuery.of(context).size.height *0.08,)
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top:10, bottom:5, left:30, right: 30),
                              child: RichText(
                                textAlign: TextAlign.center,
                                maxLines: 2,
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
                                    text: (this.widget.data['name'] != null)
                                        ? this.widget.data['name']
                                        : ''),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                )
            )));
  }
}

class DealOfTheDay extends StatefulWidget {
  List data;
  DealOfTheDay({Key key, this.data}) : super(key: key);

  @override
  _DealOfTheDayState createState() => _DealOfTheDayState();
}

class _DealOfTheDayState extends State<DealOfTheDay> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10, bottom: 10),
        child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Container(
                      width: double.infinity,
                      child: Text(
                        'DEAL OF THE DAY',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    )),
                Container(
                    color: Colors.white,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 0),
                    height: (MediaQuery.of(context).size.height * 0.18),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        for (int i = 0; i < this.widget.data.length; i++)
                          Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                          border: Border.all(
                                              color: Colors.grey[400])),
                                      child: Padding(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Column(
                                            children: [
                                              Stack(
                                                children: [
                                                  Positioned(
                                                    child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  image: NetworkImage((this.widget.data[i]
                                                                              [
                                                                              'image'] !=
                                                                          null)
                                                                      ? this.widget.data[
                                                                              i]
                                                                          [
                                                                          'image']
                                                                      : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQx-YHTYySZO4IHxlF8acRE_nt3T3NHSOPjoQ&usqp=CAU"),
                                                                  fit: BoxFit
                                                                      .fill,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .all(
                                                                  Radius
                                                                      .circular(
                                                                          10.0),
                                                                )),
                                                        child: Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.1,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.2,
                                                        )),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.3,
                                                  child: Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 10,
                                                          left: 10,
                                                          right: 10),
                                                      child: RichText(
                                                        maxLines: 3,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        strutStyle: StrutStyle(
                                                            fontSize: 8.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                        textAlign:
                                                            TextAlign.center,
                                                        text: TextSpan(
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                            text: (this.widget.data[
                                                                            i][
                                                                        'title'] !=
                                                                    null)
                                                                ? this
                                                                        .widget
                                                                        .data[i]
                                                                    ['title']
                                                                : ''),
                                                      )))
                                            ],
                                          ))))),
                      ],
                    ))
              ],
            )));
  }
}
