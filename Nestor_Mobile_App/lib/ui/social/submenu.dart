import 'package:flutter/material.dart';
import 'package:nestore/ui/common/HexColor.dart';
import 'package:nestore/ui/social/store.dart';

class SubMainMenu extends StatefulWidget {
  SubMainMenu({Key key}) : super(key: key);

  @override
  _SubMainMenuState createState() => _SubMainMenuState();
}

class _SubMainMenuState extends State<SubMainMenu> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: 0, right: 0, top:20),
            child: Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(
                        left: 0, right: 0, top:0, bottom:0),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: 0, right: 0, top:0, bottom:0),
                          child: GestureDetector(
                            onTap: (){
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (context) => SocialChat(),
                              //   ),
                              // );
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 0, right: 0, top:30, bottom: 0),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex:1,
                                      child: GestureDetector(
                                        onTap:() {
                                          Navigator.of(context).pop();
                                        },
                                        child: Icon(Icons.arrow_back)
                                      )
                                  ),
                                  Expanded(
                                    flex:4,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              flex:4,
                                              child: Container(
                                                width: double.infinity,
                                                child: Text('Search box here', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                              ),
                                            ),
                                            // Expanded(
                                            //     flex: 1,
                                            //     child: Image.asset('graphics/Search.png')),

                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          )
                      ),
                    )
                ),
                Padding(
                    padding: EdgeInsets.only(
                        left: 0, right: 0, top:0, bottom:0),
                    child: Container(
                        color: Colors.white,
                        child: GestureDetector(
                          onTap: (){
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) => SocialChat(),
                            //   ),
                            // );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 30, right: 30, top:20, bottom: 0),
                            child: Row(
                              children: [
                                Expanded(
                                    flex:1,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          child: Container(
                                              width: 30,
                                              height: 30,
                                              decoration: new BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: new DecorationImage(
                                                      fit: BoxFit.contain,
                                                      image: new AssetImage(
                                                          "graphics/graph.png")
                                                  )
                                              )),
                                        ),

                                      ],
                                    )
                                ),
                                Expanded(
                                  flex:4,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            flex:4,
                                            child: Container(
                                              width: double.infinity,
                                              child: Text('Local Listing', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, color:HexColor('858997')),),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        )
                    )
                ),
                Padding(
                    padding: EdgeInsets.only(
                        left: 0, right: 0, top:0, bottom:0),
                    child: Container(
                        color: Colors.white,
                        child: GestureDetector(
                          onTap: (){
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) => SocialChat(),
                            //   ),
                            // );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 30, right: 30, top:20, bottom: 0),
                            child: Row(
                              children: [
                                Expanded(
                                    flex:1,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            child: Image.asset(
                                                "graphics/chatmsg.png"),),
                                        ),

                                      ],
                                    )
                                ),
                                Expanded(
                                  flex:4,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            flex:4,
                                            child: Container(
                                              width: double.infinity,
                                              child: Text('Shipped Listing', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, color:HexColor('858997')),),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        )
                    )
                ),

                Padding(
                    padding: EdgeInsets.only(
                        left: 0, right: 0, top:0, bottom: 10),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              bottom: BorderSide( //                   <--- left side
                                color: Colors.grey[300],
                                width: 1.0,
                              ),
                            ),
                        ),

                        child: GestureDetector(
                          onTap: (){
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) => SocialChat(),
                            //   ),
                            // );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 30, right: 30, top:20, bottom: 10),
                            child: Row(
                              children: [
                                Expanded(
                                    flex:1,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            child: Image.asset(
                                                "graphics/notify.png"),),
                                        ),

                                      ],
                                    )
                                ),
                                Expanded(
                                  flex:4,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            flex:4,
                                            child: Container(
                                              width: double.infinity,
                                              child: Text('Buy & Sell Groups', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, color:HexColor('858997')),),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        )
                    )
                ),

          Padding(
            padding: EdgeInsets.only(
                left: 30, right: 30, top: 20, bottom:0),
            child: Container(
              width: double.infinity,
              child: Text('Top Categories', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
            )
          ),
                Padding(
                    padding: EdgeInsets.only(
                        left: 0, right: 0, top:0, bottom:0),
                    child: Container(
                        color: Colors.white,
                        child: GestureDetector(
                          onTap: (){
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) => SocialChat(),
                            //   ),
                            // );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 30, right: 30, top:20, bottom: 0),
                            child: Row(
                              children: [
                                Expanded(
                                    flex:1,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            child: Image.asset(
                                                "graphics/greyinline.png"),),
                                        ),

                                      ],
                                    )
                                ),
                                Expanded(
                                  flex:4,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            flex:4,
                                            child: Container(
                                              width: double.infinity,
                                              child: Text('Vehicles', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, color:HexColor('858997')),),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        )
                    )
                ),


                Padding(
                    padding: EdgeInsets.only(
                        left: 0, right: 0, top:0, bottom:0),
                    child: Container(
                        color: Colors.white,
                        child: GestureDetector(
                          onTap: (){
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) => SocialChat(),
                            //   ),
                            // );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 30, right: 30, top:20, bottom: 0),
                            child: Row(
                              children: [
                                Expanded(
                                    flex:1,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            child: Image.asset(
                                                "graphics/cart.png"),),
                                        ),

                                      ],
                                    )
                                ),
                                Expanded(
                                  flex:4,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            flex:4,
                                            child: Container(
                                              width: double.infinity,
                                              child: Text('Rentals', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, color:HexColor('858997')),),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        )
                    )
                ),

                Padding(
                    padding: EdgeInsets.only(
                        left: 0, right: 0, top:0, bottom:0),
                    child: Container(
                        color: Colors.white,
                        child: GestureDetector(
                          onTap: (){
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) => SocialChat(),
                            //   ),
                            // );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 30, right: 30, top:20, bottom: 0),
                            child: Row(
                              children: [
                                Expanded(
                                    flex:1,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            child: Image.asset(
                                                "graphics/inlineprofile.png"),),
                                        ),

                                      ],
                                    )
                                ),
                                Expanded(
                                  flex:4,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            flex:4,
                                            child: Container(
                                              width: double.infinity,
                                              child: Text('Furniture', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, color:HexColor('858997')),),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        )
                    )
                ),
                Padding(
                    padding: EdgeInsets.only(
                        left: 0, right: 0, top:0, bottom:0),
                    child: Container(
                        color: Colors.white,
                        child: GestureDetector(
                          onTap: (){
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) => SocialChat(),
                            //   ),
                            // );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 30, right: 30, top:20, bottom: 0),
                            child: Row(
                              children: [
                                Expanded(
                                    flex:1,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            child: Image.asset(
                                                "graphics/chatmsg.png"),),
                                        ),

                                      ],
                                    )
                                ),
                                Expanded(
                                  flex:4,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            flex:4,
                                            child: Container(
                                              width: double.infinity,
                                              child: Text('Electronics', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, color:HexColor('858997')),),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        )
                    )
                ),

                Padding(
                    padding: EdgeInsets.only(
                        left: 0, right: 0, top:0, bottom:0),
                    child: Container(
                        color: Colors.white,
                        child: GestureDetector(
                          onTap: (){
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) => SocialChat(),
                            //   ),
                            // );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 30, right: 30, top:20, bottom: 0),
                            child: Row(
                              children: [
                                Expanded(
                                    flex:1,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            child: Image.asset(
                                                "graphics/notify.png"),),
                                        ),

                                      ],
                                    )
                                ),
                                Expanded(
                                  flex:4,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            flex:4,
                                            child: Container(
                                              width: double.infinity,
                                              child: Text('Clothing, Shoes & Accessories', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, color:HexColor('858997')),),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        )
                    )
                ),



                Padding(
                    padding: EdgeInsets.only(
                        left: 0, right: 0, top:0, bottom:0),
                    child: Container(
                        color: Colors.white,
                        child: GestureDetector(
                          onTap: (){
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) => SocialChat(),
                            //   ),
                            // );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 30, right: 30, top:20, bottom: 0),
                            child: Row(
                              children: [
                                Expanded(
                                    flex:1,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            child: Image.asset(
                                                "graphics/greyinline.png"),),
                                        ),

                                      ],
                                    )
                                ),
                                Expanded(
                                  flex:4,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                              flex:4,
                                              child: GestureDetector(
                                                onTap:(){
                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                      builder: (context) => Store(),
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  child: Text('Live Shopping', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, color:HexColor('858997')),),
                                                ),
                                              )
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        )
                    )
                ),


                Padding(
                    padding: EdgeInsets.only(
                        left: 0, right: 0, top:0, bottom:0),
                    child: Container(
                        color: Colors.white,
                        child: GestureDetector(
                          onTap: (){
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) => SocialChat(),
                            //   ),
                            // );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 30, right: 30, top:20, bottom: 0),
                            child: Row(
                              children: [
                                Expanded(
                                    flex:1,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            child: Image.asset(
                                                "graphics/cart.png"),),
                                        ),

                                      ],
                                    )
                                ),
                                Expanded(
                                  flex:4,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            flex:4,
                                            child: Container(
                                              width: double.infinity,
                                              child: Text('Event Tickets', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, color:HexColor('858997')),),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        )
                    )
                ),

                Padding(
                    padding: EdgeInsets.only(
                        left: 0, right: 0, top:0, bottom:0),
                    child: Container(
                        color: Colors.white,
                        child: GestureDetector(
                          onTap: (){
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) => SocialChat(),
                            //   ),
                            // );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 30, right: 30, top:20, bottom: 0),
                            child: Row(
                              children: [
                                Expanded(
                                    flex:1,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            child: Image.asset(
                                                "graphics/inlineprofile.png"),),
                                        ),

                                      ],
                                    )
                                ),
                                Expanded(
                                  flex:4,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            flex:4,
                                            child: Container(
                                              width: double.infinity,
                                              child: Text('Jobs', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, color:HexColor('858997')),),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        )
                    )
                ),


              ],
            ),
          )
      ),
    );
  }
}