import 'package:flutter/material.dart';
import 'package:nestore/model/result.dart';
import 'package:nestore/network/orders.dart';
import 'package:nestore/ui/common/HexColor.dart';
import 'package:nestore/ui/hotel/specialOffers.dart';
import 'package:nestore/ui/hotel/uploadPrescription.dart';
import 'package:nestore/ui/product/ProductDetail.dart';
import 'package:nestore/ui/product/productsByCategory.dart';

class GuestHome extends StatefulWidget {
  GuestHome({Key key}) : super(key: key);

  @override
  _HotelHomeState createState() => _HotelHomeState();
}

class _HotelHomeState extends State<GuestHome> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final authService = AuthService();
  List Slider = [];
  List Shop_By_Healthareas = [];
  List Deal_Of_The_Day = [];
  List Hot_Sellers = [];
  List Slider2 = [];
  List Trending_Today = [];
  List Shop_By_Category = [];

  void initState() {
    super.initState();
    getTermsAndCondition();
    getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
            child: Column(
              children: [
                if(Slider != null && Slider.length > 0)AllCuisines(data: Slider),
                ByTypeOfFood(),
                if(Trending_Today != null && Trending_Today.length > 0)TrendingToday(data: Trending_Today),
                if(Shop_By_Category != null && Shop_By_Category.length > 0)ShopByCategory(data: Shop_By_Category),
                if(Slider2 != null && Slider2.length > 0)AllCuisines(data: Slider2),
                if(Deal_Of_The_Day != null && Deal_Of_The_Day.length > 0)DealOfTheDay(data: Deal_Of_The_Day),
                if(Shop_By_Healthareas != null && Shop_By_Healthareas.length > 0)ShopByHealthArea(data: Shop_By_Healthareas)
              ],
            )),
      ),
    );
  }

  getTermsAndCondition() async {
    Result response  = await authService.getGuestHomeData();
    if(response is SuccessState) {

      if(response.value['status'] == true) {
        if(response.value['data'].length > 0) {
          for (var i = 0; i < response.value['data'].length; i++) {
            print(response.value['data'][i]);
            if(response.value['data'][i]['type'] == 'Slider') {
              setState(() {
                Slider = response.value['data'][i]['data'];
              });
            }
            if(response.value['data'][i]['type'] == 'Shop_By_Healthareas') {
              setState(() {
                Shop_By_Healthareas = response.value['data'][i]['data'];
              });
            }
            if(response.value['data'][i]['type'] == 'Deal_Of_The_Day') {
              setState(() {
                Deal_Of_The_Day = response.value['data'][i]['data'];
              });
            }
            if(response.value['data'][i]['type'] == 'Hot_Sellers') {
              setState(() {
                Hot_Sellers = response.value['data'][i]['data'];
              });
            }
            if(response.value['data'][i]['type'] == 'Slider2') {
              setState(() {
                Slider2 = response.value['data'][i]['data'];
              });
            }
            if(response.value['data'][i]['type'] == 'Trending_Today') {
              setState(() {
                Trending_Today = response.value['data'][i]['data'];
              });
            }
            // if(response.value['data'][i]['type'] == 'Shop_By_Category') {
            //   setState(() {
            //     Shop_By_Category = response.value['data'][i]['data'];
            //   });
            // }
          }
        }
        setState(() {
          // TermsAndCondtion = response.value['data'];
        });
      }
    }
  }

  getCategories() async {
    Result response = await authService.fetchAllCategoriesWithSub();
    if (response is SuccessState) {
      if (response.value['status'] == true) {
        setState(() {
          Shop_By_Category = response.value['data'];
        });
      }
    }
  }
}

class SpecialOffers extends StatefulWidget {
  SpecialOffers({Key key}) : super(key: key);

  @override
  _SpecialOffersState createState() => _SpecialOffersState();
}

class _SpecialOffersState extends State<SpecialOffers> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 5),
              child: Container(
                color: Colors.white,
                child: Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => HotelSpecialOffers(),
                                  ),
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                child: Text(
                                  'Special Offers',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28),
                                ),
                              ),
                            )),
                        Container(
                            color: Colors.white,
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(vertical: 0),
                            height: (MediaQuery.of(context).size.height * 0.55),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Positioned(
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            "graphics/girl2.png"),
                                                        fit: BoxFit.fill,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.all(
                                                        Radius.circular(10.0),
                                                      )),
                                                  child: Container(
                                                    height:
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                        0.45,
                                                    width:
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                        0.66,
                                                  )),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.6,
                                              child: Text(
                                                'Basic Kneads Pizza',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.bold),
                                                textAlign: TextAlign.start,
                                              ),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.6,
                                              child: Text(
                                                  "222, Seafood, Mediterranian...",
                                                  style: TextStyle(
                                                      color:
                                                      HexColor('ACB1C0'))),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.65,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Image.asset(
                                                              'graphics/green_star.png'),
                                                        ),
                                                        Expanded(
                                                          flex: 3,
                                                          child: Text(
                                                              '4.8 (120+)',
                                                              style: TextStyle(
                                                                  color: HexColor(
                                                                      'ACB1C0'),
                                                                  fontSize:
                                                                  12)),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Image.asset(
                                                              'graphics/timer.png'),
                                                        ),
                                                        Expanded(
                                                          flex: 3,
                                                          child: Text('60 Min',
                                                              style: TextStyle(
                                                                  color: HexColor(
                                                                      'ACB1C0'),
                                                                  fontSize:
                                                                  12)),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                      flex: 3,
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Image.asset(
                                                                'graphics/money.png'),
                                                          ),
                                                          Expanded(
                                                            flex: 3,
                                                            child: Text('Free',
                                                                style: TextStyle(
                                                                    color: HexColor(
                                                                        'ACB1C0'),
                                                                    fontSize:
                                                                    12)),
                                                          )
                                                        ],
                                                      ))
                                                ],
                                              ),
                                            ))
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Positioned(
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            "graphics/girl2.png"),
                                                        fit: BoxFit.fill,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.all(
                                                        Radius.circular(10.0),
                                                      )),
                                                  child: Container(
                                                    height:
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                        0.45,
                                                    width:
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                        0.66,
                                                  )),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.6,
                                              child: Text(
                                                'Basic Kneads Pizza',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.bold),
                                                textAlign: TextAlign.start,
                                              ),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.6,
                                              child: Text(
                                                  "222, Seafood, Mediterranian...",
                                                  style: TextStyle(
                                                      color:
                                                      HexColor('ACB1C0'))),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.65,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Image.asset(
                                                              'graphics/green_star.png'),
                                                        ),
                                                        Expanded(
                                                          flex: 3,
                                                          child: Text(
                                                              '4.8 (120+)',
                                                              style: TextStyle(
                                                                  color: HexColor(
                                                                      'ACB1C0'),
                                                                  fontSize:
                                                                  12)),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Image.asset(
                                                              'graphics/timer.png'),
                                                        ),
                                                        Expanded(
                                                          flex: 3,
                                                          child: Text('60 Min',
                                                              style: TextStyle(
                                                                  color: HexColor(
                                                                      'ACB1C0'),
                                                                  fontSize:
                                                                  12)),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                      flex: 3,
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Image.asset(
                                                                'graphics/money.png'),
                                                          ),
                                                          Expanded(
                                                            flex: 3,
                                                            child: Text('Free',
                                                                style: TextStyle(
                                                                    color: HexColor(
                                                                        'ACB1C0'),
                                                                    fontSize:
                                                                    12)),
                                                          )
                                                        ],
                                                      ))
                                                ],
                                              ),
                                            ))
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Positioned(
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            "graphics/girl2.png"),
                                                        fit: BoxFit.fill,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.all(
                                                        Radius.circular(10.0),
                                                      )),
                                                  child: Container(
                                                    height:
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                        0.45,
                                                    width:
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                        0.66,
                                                  )),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.6,
                                              child: Text(
                                                'Basic Kneads Pizza',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.bold),
                                                textAlign: TextAlign.start,
                                              ),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.6,
                                              child: Text(
                                                  "222, Seafood, Mediterranian...",
                                                  style: TextStyle(
                                                      color:
                                                      HexColor('ACB1C0'))),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.65,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Image.asset(
                                                              'graphics/green_star.png'),
                                                        ),
                                                        Expanded(
                                                          flex: 3,
                                                          child: Text(
                                                              '4.8 (120+)',
                                                              style: TextStyle(
                                                                  color: HexColor(
                                                                      'ACB1C0'),
                                                                  fontSize:
                                                                  12)),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Image.asset(
                                                              'graphics/timer.png'),
                                                        ),
                                                        Expanded(
                                                          flex: 3,
                                                          child: Text('60 Min',
                                                              style: TextStyle(
                                                                  color: HexColor(
                                                                      'ACB1C0'),
                                                                  fontSize:
                                                                  12)),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                      flex: 3,
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Image.asset(
                                                                'graphics/money.png'),
                                                          ),
                                                          Expanded(
                                                            flex: 3,
                                                            child: Text('Free',
                                                                style: TextStyle(
                                                                    color: HexColor(
                                                                        'ACB1C0'),
                                                                    fontSize:
                                                                    12)),
                                                          )
                                                        ],
                                                      ))
                                                ],
                                              ),
                                            ))
                                      ],
                                    )),
                              ],
                            ))
                      ],
                    )),
              ),
            )));
  }
}

class AllCuisines extends StatefulWidget {
  List data;
  AllCuisines({Key key, this.data}) : super(key: key);

  @override
  _AllCuisinesState createState() => _AllCuisinesState();
}

class _AllCuisinesState extends State<AllCuisines> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            color: Colors.grey[200],
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 0),
            height: (MediaQuery.of(context).size.height * 0.2),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                for (int i=0; i<this.widget.data.length; i++)Padding(
                    padding: EdgeInsets.only(
                        right:10),
                    child: GestureDetector(
                        onTap: (){
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => ProductsPage(),
                          //   ),
                          // );
                        },
                        child: Container(
                          // decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.all(Radius.circular(10.0),),
                          //     border: Border.all(color: Colors.grey[400])
                          // ),
                            child: Padding(
                                padding: EdgeInsets.only(top:10),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Positioned(
                                            child: Padding(
                                              padding: EdgeInsets.only(top:0, left: 0, right:0),
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: NetworkImage((this.widget.data[i]['image'] != null ) ? this.widget.data[i]['image'] : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQx-YHTYySZO4IHxlF8acRE_nt3T3NHSOPjoQ&usqp=CAU"),
                                                        fit: BoxFit.fill,
                                                      ),
                                                      borderRadius: BorderRadius.all(Radius.circular(10.0),)
                                                  ),
                                                  child: Container(
                                                    height: MediaQuery.of(context).size.height * 0.18,
                                                    width: MediaQuery.of(context).size.width,
                                                  )
                                              ),
                                            )
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                            )
                        )
                    )
                ),
              ],
            )));
  }
}

class ByTypeOfFood extends StatefulWidget {
  ByTypeOfFood({Key key}) : super(key: key);

  @override
  _ByTypeOfFoodState createState() => _ByTypeOfFoodState();
}

class _ByTypeOfFoodState extends State<ByTypeOfFood> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            width: double.infinity,
            color: Colors.grey[100],
            child: Padding(
              padding: EdgeInsets.only(top: 0, bottom: 0),
              child: Container(
                color: Colors.grey[100],
                child: Padding(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, top: 0, bottom: 0),
                    child: Column(
                      children: [
                        // Padding(
                        //     padding: EdgeInsets.only(top: 10, bottom: 0),
                        //     child: Container(
                        //       width: double.infinity,
                        //       child: Text(
                        //         'Explore',
                        //         style: TextStyle(
                        //             color: Colors.black26,
                        //             fontWeight: FontWeight.bold,
                        //             fontSize: 16),
                        //       ),
                        //     )),
                        // Padding(
                        //     padding: EdgeInsets.only(top: 5, bottom: 10),
                        //     child: Container(
                        //       width: double.infinity,
                        //       child: Text(
                        //         'NESTOR',
                        //         style: TextStyle(
                        //             color: Colors.black,
                        //             fontWeight: FontWeight.bold,
                        //             fontSize: 18),
                        //       ),
                        //     )),
                        // Padding(
                        //     padding: EdgeInsets.only(bottom: 10),
                        //     child: Row(
                        //       children: [
                        //         Expanded(
                        //             child: GestureDetector(
                        //                 onTap: () {
                        //                   Navigator.of(context).push(
                        //                     MaterialPageRoute(
                        //                       builder: (context) => UploadPrescription(),
                        //                     ),
                        //                   );
                        //                 },
                        //                 child: Padding(
                        //                     padding: EdgeInsets.only(right: 5),
                        //                     child: Container(
                        //                       decoration: BoxDecoration(
                        //                           borderRadius: BorderRadius.all(
                        //                             Radius.circular(10.0),
                        //                           ),
                        //                           color: Colors.white),
                        //                       child: Padding(
                        //                           padding: EdgeInsets.only(
                        //                               top: 20, bottom: 20, left: 5),
                        //                           child: Text('Upload Prescription',
                        //                               style: TextStyle(
                        //                                   fontWeight:
                        //                                   FontWeight.w500,
                        //                                   fontSize: 18))),
                        //                     ))
                        //             )),
                        //       ],
                        //     )),
                        // Padding(
                        //     padding: EdgeInsets.only(top: 10, bottom: 30),
                        //     child: Container(
                        //       width: double.infinity,
                        //       decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.all(
                        //             Radius.circular(10.0),
                        //           ),
                        //           color: Colors.white),
                        //       child: Padding(
                        //           padding: EdgeInsets.only(
                        //               top: 20, bottom: 20, left: 5),
                        //           child: Row(
                        //             children: [
                        //               Expanded(
                        //                   child: Padding(
                        //                       padding:
                        //                       EdgeInsets.only(left: 10),
                        //                       child: Text(
                        //                           'Find a Nestore Store near you',
                        //                           style: TextStyle(
                        //                               fontWeight:
                        //                               FontWeight.w500,
                        //                               fontSize: 18)))),
                        //               Expanded(
                        //                   child: Padding(
                        //                       padding:
                        //                       EdgeInsets.only(right: 10),
                        //                       child: Align(
                        //                           alignment: Alignment.topRight,
                        //                           child: Icon(
                        //                               Icons
                        //                                   .chevron_right_rounded,
                        //                               color: Colors.grey,
                        //                               size: 32))))
                        //             ],
                        //           )),
                        //     ))
                      ],
                    )),
              ),
            )));
  }
}

class TrendingToday extends StatefulWidget {
  List data;
  TrendingToday({Key key, this.data}) : super(key: key);

  @override
  _TrendingTodayState createState() => _TrendingTodayState();
}

class _TrendingTodayState extends State<TrendingToday> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10, bottom: 10),
        child: Container(
            color: Colors.white,
            child: Column(
              children: [
                // Padding(
                //     padding: EdgeInsets.only(top: 10, bottom: 0),
                //     child: Container(
                //       width: double.infinity,
                //       child: Text(
                //         'TRENDING',
                //         style: TextStyle(
                //             color: Colors.black26,
                //             fontWeight: FontWeight.bold,
                //             fontSize: 16),
                //       ),
                //     )),
                Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Container(
                      width: double.infinity,
                      child: Text(
                        'TRENDING TODAY',
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
                    height: (MediaQuery.of(context).size.height * 0.2),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        for (int i=0; i<this.widget.data.length; i++)Padding(
                            padding: EdgeInsets.only(
                                right:10),
                            child: GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ProductDetail(id: this.widget.data[i]['id'].toString()),
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
                                                            image: NetworkImage((this.widget.data[i]['image'] != null ) ? this.widget.data[i]['image'] : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQx-YHTYySZO4IHxlF8acRE_nt3T3NHSOPjoQ&usqp=CAU"),
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
                                                    child: RichText(
                                                      maxLines: 3,
                                                      overflow: TextOverflow.ellipsis,
                                                      strutStyle: StrutStyle(fontSize: 8.0,fontWeight: FontWeight.w600),
                                                      text: TextSpan(
                                                          style: TextStyle(color: Colors.black, fontSize: 12.0,fontWeight: FontWeight.bold),
                                                          text: (this.widget.data[i]['generic_name'] != null ) ? this.widget.data[i]['generic_name'] : ''),
                                                    )
                                                )
                                            )
                                          ],
                                        )
                                    )
                                )
                            )
                        ),
                      ],
                    ))
              ],
            )));
  }
}

class ShopByCategory extends StatefulWidget {
  List data;
  ShopByCategory({Key key, this.data}) : super(key: key);

  @override
  _ShopByCategoryState createState() => _ShopByCategoryState();
}

class _ShopByCategoryState extends State<ShopByCategory> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10, bottom: 10),
        child: Container(
            color: Colors.white,
            child: Column(
              children: [
                // Padding(
                //     padding: EdgeInsets.only(top: 10, bottom: 0),
                //     child: Container(
                //       width: double.infinity,
                //       child: Text(
                //         'SHOP BY',
                //         style: TextStyle(
                //             color: Colors.black26,
                //             fontWeight: FontWeight.bold,
                //             fontSize: 16),
                //       ),
                //     )),
                Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 10),
                    child: Container(
                      width: double.infinity,
                      child: Text(
                        'SHOP BY CATEGORIES',
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
                    // height: (MediaQuery.of(context).size.height * 0.18),
                    child: Column(
                      // scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        for (int i=0; i<this.widget.data.length; i++)Padding(
                            padding: EdgeInsets.only(
                                right:10, top:10, bottom:10),
                            child: GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ProductByCategory(data: this.widget.data[i]),
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
                                                            image: NetworkImage((this.widget.data[i]['image'] != null ) ? this.widget.data[i]['image'] : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQx-YHTYySZO4IHxlF8acRE_nt3T3NHSOPjoQ&usqp=CAU"),
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
                                                    child: RichText(
                                                      maxLines: 3,
                                                      overflow: TextOverflow.ellipsis,
                                                      strutStyle: StrutStyle(fontSize: 8.0,fontWeight: FontWeight.w600),
                                                      textAlign: TextAlign.center,
                                                      text: TextSpan(
                                                          style: TextStyle(color: Colors.black, fontSize: 12.0,fontWeight: FontWeight.bold, ),
                                                          text: (this.widget.data[i]['name'] != null ) ? this.widget.data[i]['name'] : ''),
                                                    )
                                                )
                                            )
                                          ],
                                        )
                                    )
                                )
                            )
                        ),
                      ],
                    ))
              ],
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
                // Padding(
                //     padding: EdgeInsets.only(top: 10, bottom: 0),
                //     child: Container(
                //       width: double.infinity,
                //       child: Text(
                //         'DEAL OF THE',
                //         style: TextStyle(
                //             color: Colors.black26,
                //             fontWeight: FontWeight.bold,
                //             fontSize: 16),
                //       ),
                //     )),
                Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 10),
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
                        for (int i=0; i<this.widget.data.length; i++)Padding(
                            padding: EdgeInsets.only(
                                right:10),
                            child: GestureDetector(
                                onTap: (){
                                  // Navigator.of(context).push(
                                  //   MaterialPageRoute(
                                  //     builder: (context) => ProductsPage(),
                                  //   ),
                                  // );
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
                                                            image: NetworkImage((this.widget.data[i]['image'] != null ) ? this.widget.data[i]['image'] : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQx-YHTYySZO4IHxlF8acRE_nt3T3NHSOPjoQ&usqp=CAU"),
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
                                                    child: RichText(
                                                      maxLines: 3,
                                                      overflow: TextOverflow.ellipsis,
                                                      strutStyle: StrutStyle(fontSize: 8.0,fontWeight: FontWeight.w600),
                                                      textAlign: TextAlign.center,
                                                      text: TextSpan(
                                                          style: TextStyle(color: Colors.black, fontSize: 12.0,fontWeight: FontWeight.bold, ),
                                                          text: (this.widget.data[i]['title'] != null ) ? this.widget.data[i]['title'] : ''),
                                                    )
                                                )
                                            )
                                          ],
                                        )
                                    )
                                )
                            )
                        ),
                      ],
                    ))
              ],
            )));
  }
}


class ShopByHealthArea extends StatefulWidget {
  List data;
  ShopByHealthArea({Key key, this.data}) : super(key: key);

  @override
  _ShopByHealthAreaState createState() => _ShopByHealthAreaState();
}

class _ShopByHealthAreaState extends State<ShopByHealthArea> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10, bottom: 10),
        child: Container(
            color: Colors.white,
            child: Column(
              children: [
                // Padding(
                //     padding: EdgeInsets.only(top: 10, bottom: 0),
                //     child: Container(
                //       width: double.infinity,
                //       child: Text(
                //         'SHOP BY',
                //         style: TextStyle(
                //             color: Colors.black26,
                //             fontWeight: FontWeight.bold,
                //             fontSize: 16),
                //       ),
                //     )),
                Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 10),
                    child: Container(
                      width: double.infinity,
                      child: Text(
                        'SHOP BY HEALTH AREA',
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
                        for (int i=0; i<this.widget.data.length; i++)Padding(
                            padding: EdgeInsets.only(
                                right:10),
                            child: GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ProductByCategory(data: this.widget.data[i]),
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
                                                            image: NetworkImage((this.widget.data[i]['image'] != null ) ? this.widget.data[i]['image'] : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQx-YHTYySZO4IHxlF8acRE_nt3T3NHSOPjoQ&usqp=CAU"),
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
                                                    child: RichText(
                                                      maxLines: 3,
                                                      overflow: TextOverflow.ellipsis,
                                                      strutStyle: StrutStyle(fontSize: 8.0,fontWeight: FontWeight.w600),
                                                      textAlign: TextAlign.center,
                                                      text: TextSpan(
                                                          style: TextStyle(color: Colors.black, fontSize: 12.0,fontWeight: FontWeight.bold, ),
                                                          text: (this.widget.data[i]['name'] != null ) ? this.widget.data[i]['name'] : ''),
                                                    )
                                                )
                                            )
                                          ],
                                        )
                                    )
                                )
                            )
                        ),
                      ],
                    ))
              ],
            )));
  }
}
