import 'package:flutter/material.dart';
import 'package:nestore/ui/common/HexColor.dart';
import 'package:nestore/ui/common/hotel_text_field.dart';
import 'package:nestore/ui/hotel/search.dart';
import 'package:nestore/ui/social/search_screen.dart';

class HotelSpecialOffers extends StatefulWidget {
  HotelSpecialOffers({Key key}) : super(key: key);

  @override
  _HotelSpecialOffersState createState() => _HotelSpecialOffersState();
}

class _HotelSpecialOffersState extends State<HotelSpecialOffers> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(
                left: 0, right: 0, top:0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      left: 20, right: 20, top:30, bottom: 20),
                  child: Row(
                    children: [
                      Expanded(
                          flex:1,
                          child: Container()
                      ),
                      Expanded(
                          flex:2,
                          child: Align(
                              alignment: Alignment.center,
                              child: Image.asset('graphics/Logo_icon.png')
                          )
                      ),
                      Expanded(
                          flex:1,
                          child: GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => SocialSearch(),
                                  ),
                                );
                              },
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                  ),
                                  child: Image.asset('graphics/close icon.png',),
                                ),
                              )
                          )
                        //
                      )
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top:30),
                    child: Container(
                      width: double.infinity,
                      child: Text('Special Offers', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                    )
                ),

                Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top:20),
                    child: Stack(
                      children: [
                        Positioned(
                            child: GestureDetector(
                              onTap: (){

                              },
                              child: HotelTextField(
                                placeholderText: 'Search food you like',
                              ),
                            )
                        ),
                        Positioned(
                            right:10,
                            child: GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ProductSearch(),
                                    ),
                                  );
                                },
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top:5, left:5),
                                    child: Image.asset('graphics/settings (1).png',),
                                  ),
                                )
                            )
                          //
                        )
                      ],
                    )
                ),
                SpecialOffers(),


              ],
            )
        ),
      ),
    );
  }
}




class SpecialOffers extends StatefulWidget {
  SpecialOffers({Key key}) : super(key: key);

  @override
  _SpecialOffersState createState() => _SpecialOffersState();
}

class _SpecialOffersState extends State<SpecialOffers> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(
                  top:10, bottom:5),
              child: Container(
                color: Colors.white,
                child: Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top:10, bottom:10),
                    child: Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                                right:10, top:30),
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Positioned(
                                      child: Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage("graphics/girl2.png"),
                                                fit: BoxFit.fill,
                                              ),
                                              borderRadius: BorderRadius.all(Radius.circular(10.0),)
                                          ),
                                          child: Container(
                                            height: MediaQuery.of(context).size.height * 0.3,
                                            width: MediaQuery.of(context).size.width,
                                          )
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top:5),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Text('Basic Kneads Pizza', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                                    )
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top:5),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Text("222, Seafood, Mediterranian...",style: TextStyle(color: HexColor('ACB1C0'))),
                                    )
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top:5),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex:3,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Image.asset('graphics/green_star.png'),
                                                ),
                                                Expanded(
                                                  flex:3,
                                                  child: Text('4.8 (120+)', style: TextStyle(color: HexColor('ACB1C0'), fontSize: 12)),
                                                )
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex:3,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Image.asset('graphics/timer.png'),
                                                ),
                                                Expanded(
                                                  flex:3,
                                                  child: Text('60 Min', style: TextStyle(color: HexColor('ACB1C0'), fontSize: 12)),
                                                )
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                              flex:3,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Image.asset('graphics/money.png'),
                                                  ),
                                                  Expanded(
                                                    flex:3,
                                                    child: Text('Free', style: TextStyle(color: HexColor('ACB1C0'), fontSize: 12)),
                                                  )
                                                ],
                                              )
                                          )
                                        ],
                                      ),
                                    )
                                )
                              ],
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                right:10, top:30),
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Positioned(
                                      child: Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage("graphics/girl2.png"),
                                                fit: BoxFit.fill,
                                              ),
                                              borderRadius: BorderRadius.all(Radius.circular(10.0),)
                                          ),
                                          child: Container(
                                            height: MediaQuery.of(context).size.height * 0.3,
                                            width: MediaQuery.of(context).size.width,
                                          )
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top:5),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Text('Basic Kneads Pizza', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                                    )
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top:5),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Text("222, Seafood, Mediterranian...",style: TextStyle(color: HexColor('ACB1C0'))),
                                    )
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top:5),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex:3,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Image.asset('graphics/green_star.png'),
                                                ),
                                                Expanded(
                                                  flex:3,
                                                  child: Text('4.8 (120+)', style: TextStyle(color: HexColor('ACB1C0'), fontSize: 12)),
                                                )
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex:3,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Image.asset('graphics/timer.png'),
                                                ),
                                                Expanded(
                                                  flex:3,
                                                  child: Text('60 Min', style: TextStyle(color: HexColor('ACB1C0'), fontSize: 12)),
                                                )
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                              flex:3,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Image.asset('graphics/money.png'),
                                                  ),
                                                  Expanded(
                                                    flex:3,
                                                    child: Text('Free', style: TextStyle(color: HexColor('ACB1C0'), fontSize: 12)),
                                                  )
                                                ],
                                              )
                                          )
                                        ],
                                      ),
                                    )
                                )
                              ],
                            )
                        ),Padding(
                            padding: EdgeInsets.only(
                                right:10, top:30),
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Positioned(
                                      child: Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage("graphics/girl2.png"),
                                                fit: BoxFit.fill,
                                              ),
                                              borderRadius: BorderRadius.all(Radius.circular(10.0),)
                                          ),
                                          child: Container(
                                            height: MediaQuery.of(context).size.height * 0.3,
                                            width: MediaQuery.of(context).size.width,
                                          )
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top:5),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Text('Basic Kneads Pizza', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                                    )
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top:5),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Text("222, Seafood, Mediterranian...",style: TextStyle(color: HexColor('ACB1C0'))),
                                    )
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top:5),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex:3,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Image.asset('graphics/green_star.png'),
                                                ),
                                                Expanded(
                                                  flex:3,
                                                  child: Text('4.8 (120+)', style: TextStyle(color: HexColor('ACB1C0'), fontSize: 12)),
                                                )
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex:3,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Image.asset('graphics/timer.png'),
                                                ),
                                                Expanded(
                                                  flex:3,
                                                  child: Text('60 Min', style: TextStyle(color: HexColor('ACB1C0'), fontSize: 12)),
                                                )
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                              flex:3,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Image.asset('graphics/money.png'),
                                                  ),
                                                  Expanded(
                                                    flex:3,
                                                    child: Text('Free', style: TextStyle(color: HexColor('ACB1C0'), fontSize: 12)),
                                                  )
                                                ],
                                              )
                                          )
                                        ],
                                      ),
                                    )
                                )
                              ],
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                right:10, top:30),
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Positioned(
                                      child: Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage("graphics/girl2.png"),
                                                fit: BoxFit.fill,
                                              ),
                                              borderRadius: BorderRadius.all(Radius.circular(10.0),)
                                          ),
                                          child: Container(
                                            height: MediaQuery.of(context).size.height * 0.3,
                                            width: MediaQuery.of(context).size.width,
                                          )
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top:5),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Text('Basic Kneads Pizza', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                                    )
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top:5),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Text("222, Seafood, Mediterranian...",style: TextStyle(color: HexColor('ACB1C0'))),
                                    )
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top:5),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex:3,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Image.asset('graphics/green_star.png'),
                                                ),
                                                Expanded(
                                                  flex:3,
                                                  child: Text('4.8 (120+)', style: TextStyle(color: HexColor('ACB1C0'), fontSize: 12)),
                                                )
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex:3,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Image.asset('graphics/timer.png'),
                                                ),
                                                Expanded(
                                                  flex:3,
                                                  child: Text('60 Min', style: TextStyle(color: HexColor('ACB1C0'), fontSize: 12)),
                                                )
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                              flex:3,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Image.asset('graphics/money.png'),
                                                  ),
                                                  Expanded(
                                                    flex:3,
                                                    child: Text('Free', style: TextStyle(color: HexColor('ACB1C0'), fontSize: 12)),
                                                  )
                                                ],
                                              )
                                          )
                                        ],
                                      ),
                                    )
                                )
                              ],
                            )
                        )

                      ],
                    )
                ),
              ),
            )
        )
    );
  }
}
