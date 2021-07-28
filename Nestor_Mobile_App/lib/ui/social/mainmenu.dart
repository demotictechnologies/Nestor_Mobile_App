import 'package:flutter/material.dart';
import 'package:nestore/ui/common/HexColor.dart';
import 'package:nestore/ui/hotel/home.dart';

class SocialMainMenu extends StatefulWidget {
  Function changeScreen;
  SocialMainMenu({Key key, this.changeScreen}) : super(key: key);

  @override
  _SocialMainMenuState createState() => _SocialMainMenuState();
}

class _SocialMainMenuState extends State<SocialMainMenu> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: HexColor('F7F8FA'),
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
                                left: 30, right: 30, top:30, bottom: 0),
                            child: Row(
                              children: [
                                Expanded(
                                    flex:1,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          child: Container(
                                              width: 40,
                                              height: 40,
                                              decoration: new BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: new DecorationImage(
                                                      fit: BoxFit.contain,
                                                      image: new NetworkImage(
                                                          "https://i.imgur.com/BoN9kdC.png")
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
                                              child: Text('Carolyn', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Image.asset('graphics/Search.png')),

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
                                            child: Text('Learn', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, color:HexColor('858997')),),
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
                                              child: Text('Earn', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, color:HexColor('858997')),),
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
                                              child: Text('Entertainment', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, color:HexColor('858997')),),
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
                                                    builder: (context) => HotelHome(),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                child: Text('Food', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, color:HexColor('858997')),),
                                              ),
                                            ),
                                            )
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
                                              child: Text('Transport', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, color:HexColor('858997')),),
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
                                              child: Text('Health & Fitness', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, color:HexColor('858997')),),
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
                                              child: Text('Data Store', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, color:HexColor('858997')),),
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
                                              child: Text('Communication', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, color:HexColor('858997')),),
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
                                                this.widget.changeScreen();
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                child: Text('Store', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, color:HexColor('858997')),),
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
                                              child: Text('Travel', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, color:HexColor('858997')),),
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
                                              child: Text('News', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, color:HexColor('858997')),),
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
                                              child: Text('House & Home', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, color:HexColor('858997')),),
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
                                              child: Text('Wings', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, color:HexColor('858997')),),
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