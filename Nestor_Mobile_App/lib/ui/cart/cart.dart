import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nestore/model/result.dart';
import 'package:nestore/network/orders.dart';
import 'package:nestore/resources/app_style.dart';
import 'package:nestore/ui/common/Loader.dart';
import 'package:nestore/ui/common/borderButton.dart';
import 'package:nestore/ui/home/InnerHeader.dart';
import 'package:nestore/ui/product/ProductDetail.dart';
import 'package:paytm_allinonesdk/paytm_allinonesdk.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CartPage extends StatefulWidget {
  CartPage({Key key}) : super(key: key);

  @override
  _HotelHomeState createState() => _HotelHomeState();
}

class _HotelHomeState extends State<CartPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final authService = AuthService();
  List cart = [];
  bool loading = true;
  var totalInfo = null;
  void initState() {
    super.initState();
    getCart();
  }

  getCart() async {
    Result response = await authService.fetchCart();
    if (response is SuccessState) {
      if (response.value['status'] == true) {
        for (var i = 0; i < response.value['data'].length; i++) {
          print(response.value['data'][i]['data']);
          if (response.value['data'][i]['type'] == 'Products') {
            setState(() {
              cart = response.value['data'][i]['data'];
              loading = false;
            });
          }
          if (response.value['data'][i]['type'] == 'Total Amount') {
            setState(() {
              totalInfo = response.value['data'][i]['data'];
              loading = false;
            });
          }
        }
      } else {
        setState(() {
          loading = false;
        });
      }
    } else {
      setState(() {
        loading = false;
      });
    }
  }

  addToCart(cart, type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String mobileValue = prefs.getString('mobile');
    var payload = {
      'product_id': cart['product_id'],
      'Qty': 1,
      'amount': cart['chemist_amount'],
      'type': type,
      'mobile': mobileValue
    };
    Result response = await authService.addProductToCart(payload);
    if (response is SuccessState) {
      final snackBar = SnackBar(
        content: Text(response.value['message']),
        duration: Duration(seconds: 2),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
      getCart();
    }
  }

  InitiatePayment() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String mobileValue = prefs.getString('mobile');
    print(totalInfo['grand_total']);
    Map<String, String> headers = {'Content-Type': 'application/json'};
    final msg = jsonEncode({
      "requestType": "Payment",
      "mid": "YtBoHw17737500171583",
      "websiteName": "WEBSTAGING",
      'orderId': 'ORDERID_123',
      'callbackUrl': 'https://securegw-stage.paytm.in/order/process',
      'txnAmount': {'value': totalInfo['grand_total'], 'currency': 'INR'},
      'userInfo': {'custId': mobileValue}
    });
    final response = await http.post(
      Uri.parse(
          'https://securegw-stage.paytm.in/theia/api/v1/initiateTransaction'),
      headers: headers,
      body: msg,
    );
    print(response);
  }

  placeOrder() async {
    setState(() {
      loading = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String mobileValue = prefs.getString('mobile');
    var payload = {
      'mobile': mobileValue,
      'payment_amount': totalInfo['grand_total']
    };
    Result response = await authService.placeOrder(payload);
    if (response is SuccessState) {
    if(response.value['status'] == false) {
      setState(() {
        loading = false;
      });
      final snackBar = SnackBar(
        content: Text(response.value['message']),
        duration: Duration(seconds: 2),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    } else {
      setState(() {
        loading = false;
      });
      var body = json.decode(response.value['data']);
      var response2 = AllInOneSdk.startTransaction(
          'YtBoHw17737500171583',
          response.value['data1'],
          totalInfo['grand_total'],
          body['body']['txnToken'],
          null,
          true,
          false);
      response2.then((value) async {
        final snackBar = SnackBar(
          content: Text('Order Placed Successfully!'),
          duration: Duration(seconds: 2),
        );
        _scaffoldKey.currentState.showSnackBar(snackBar);
        Navigator.of(context).pop();
      }).catchError((onError) {
        setState(() {
          loading = false;
        });

        var msg = '';
        if (onError is PlatformException) {
          print(onError.message + " \n  " + onError.details.toString());
          msg = onError.message + " \n  " + onError.details.toString();
        } else {
          print(onError.toString());
          msg = onError.toString();
        }
        final snackBar = SnackBar(
          content: Text(msg),
          duration: Duration(seconds: 2),
        );
        _scaffoldKey.currentState.showSnackBar(snackBar);
      });
    }

    }
  }

  removeItemFromCart(id) async {
    var payload = {'card_id': id};
    Result response = await authService.removeItem(payload);
    if (response is SuccessState) {
      getCart();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.grey[200],
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
          child: InnerHeader(),
        ),
        body: (cart.length <= 0 && loading == false)
            ? Align(
                alignment: Alignment.center,
                child: Padding(
                    padding: EdgeInsets.only(
                        left: 0,
                        right: 0,
                        top: MediaQuery.of(context).size.height * 0.3,
                        bottom: 0),
                    child: Column(
                      children: [
                        Text('Your Cart is empty!',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: AppStyles.MEDIUM_TEXTSIZE)),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 0, right: 0, top: 20, bottom: 0),
                            child: Text('You have no items added in the cart.',
                                style: TextStyle(color: Colors.grey))),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 0, right: 0, top: 0, bottom: 0),
                            child: Text('Explore and add products you like!',
                                style: TextStyle(color: Colors.grey))),
                      ],
                    )),
              )
            : loading
                ? Align(
                    alignment: Alignment.center,
                    child: Loader(),
                  )
                : SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.only(
                            bottom: 10, top: 10, left: 0, right: 0),
                        child: Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                for (int i = 0; i < cart.length; i++)
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => ProductDetail(
                                                id: cart[i]['product_id']
                                                    .toString()),
                                          ),
                                        );
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey[100],
                                                  width: 1)),
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: 25,
                                                  bottom: 10,
                                                  left: 0,
                                                  right: 0),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                      child: Container(
                                                          child: Image.network(
                                                              cart[i]
                                                                  ['image']))),
                                                  Expanded(
                                                      flex: 2,
                                                      child: Column(
                                                        children: [
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 5,
                                                                      bottom: 5,
                                                                      left: 10,
                                                                      right: 5),
                                                              child: Text(
                                                                  cart[i][
                                                                      'brand_name'],
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize:
                                                                          AppStyles
                                                                              .SMALL_TEXTSIZE))),
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 2,
                                                                      bottom: 5,
                                                                      left: 10,
                                                                      right: 5),
                                                              child: Container(
                                                                  width: double
                                                                      .infinity,
                                                                  child: Wrap(
                                                                    children: [
                                                                      Text(
                                                                          'MRP ',
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: AppStyles.SMALL_TEXTSIZE,
                                                                              color: Colors.deepOrangeAccent,
                                                                              decoration: TextDecoration.lineThrough)),
                                                                      Text(
                                                                          'Rs. ${cart[i]['mrp_amount']} ',
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: AppStyles.SMALL_TEXTSIZE,
                                                                              color: Colors.deepOrangeAccent,
                                                                              decoration: TextDecoration.lineThrough)),
                                                                      Text(
                                                                          ' Rs. ${cart[i]['chemist_amount']}',
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: AppStyles.SMALL_TEXTSIZE,
                                                                              color: Colors.lightGreen))
                                                                    ],
                                                                  ))),
                                                          Row(
                                                            children: [
                                                              Expanded(
                                                                  child: Row(
                                                                children: [
                                                                  Expanded(
                                                                      flex: 1,
                                                                      child: Container(
                                                                          width: double.infinity,
                                                                          child: RawMaterialButton(
                                                                            onPressed:
                                                                                () {
                                                                              addToCart(cart[i], 'remove');
                                                                            },
                                                                            elevation:
                                                                                2.0,
                                                                            fillColor:
                                                                                Colors.white,
                                                                            child:
                                                                                Text(
                                                                              '-',
                                                                              style: TextStyle(fontSize: AppStyles.SMALL_TEXTSIZE, fontWeight: FontWeight.bold),
                                                                            ),
                                                                            padding:
                                                                                EdgeInsets.all(1.0),
                                                                            shape:
                                                                                CircleBorder(),
                                                                          ))),
                                                                  Expanded(
                                                                      flex: 1,
                                                                      child: Container(
                                                                          width: double.infinity,
                                                                          child: Text(
                                                                            cart[i]['Qty'],
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style:
                                                                                TextStyle(fontSize: AppStyles.SMALL_TEXTSIZE, fontWeight: FontWeight.bold),
                                                                          ))),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child:
                                                                        RawMaterialButton(
                                                                      onPressed:
                                                                          () {
                                                                        addToCart(
                                                                            cart[i],
                                                                            'add');
                                                                      },
                                                                      elevation:
                                                                          2.0,
                                                                      fillColor:
                                                                          Colors
                                                                              .white,
                                                                      child:
                                                                          Text(
                                                                        '+',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                AppStyles.SMALL_TEXTSIZE,
                                                                            fontWeight: FontWeight.bold),
                                                                      ),
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              1.0),
                                                                      shape:
                                                                          CircleBorder(),
                                                                    ),
                                                                  ),
                                                                ],
                                                              )),
                                                              Expanded(
                                                                  child:
                                                                      Container(
                                                                          width: double
                                                                              .infinity,
                                                                          child:
                                                                              RawMaterialButton(
                                                                            onPressed:
                                                                                () {
                                                                              removeItemFromCart(cart[i]['id']);
                                                                            },
                                                                            elevation:
                                                                                2.0,
                                                                            fillColor:
                                                                                Colors.white,
                                                                            child:
                                                                                Icon(Icons.delete, color: Colors.red),
                                                                            padding:
                                                                                EdgeInsets.all(1.0),
                                                                            shape:
                                                                                CircleBorder(),
                                                                          )))
                                                            ],
                                                          )
                                                        ],
                                                      ))
                                                ],
                                              )))),
                                Container(
                                  width: double.infinity,
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 30,
                                          bottom: 0,
                                          left: 10,
                                          right: 10),
                                      child: BorderButton(
                                        Title: 'PLACE ORDER',
                                        onClick: () {
                                          placeOrder();
                                        },
                                      )),
                                ),
                              ],
                            )))));
  }
}
