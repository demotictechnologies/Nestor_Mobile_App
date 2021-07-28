import 'package:flutter/material.dart';
import 'package:nestore/ui/common/HexColor.dart';

class GearMenu extends StatefulWidget {
  GearMenu({Key key}) : super(key: key);

  @override
  _GearMenuState createState() => _GearMenuState();
}

class _GearMenuState extends State<GearMenu> {
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
                        left: 20, right: 20, top:20, bottom:0),
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
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 0, right: 0, top: 0, bottom:10),
                        child: Row(
                          children: [
                            Expanded(
                                flex:1,
                                child: GestureDetector(
                                  onTap:(){
                                    Navigator.of(context).pop();
                                  },
                                  child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Icon(Icons.arrow_back)
                                  )
                                )
                            ),
                            Expanded(
                              flex:1,
                              child: Container(
                                width: double.infinity,
                                child: Text('You', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                              ),
                            ),
                            Expanded(
                                flex:1,
                                child: Align(
                                    alignment: Alignment.topRight,
                                    child: Icon(Icons.add_alert)
                                )
                            ),
                          ],
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
                                              child: Text('Commerce Profile', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, color:HexColor('858997')),),
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
                                              child: Text('Inbox', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, color:HexColor('858997')),),
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
                                              child: Text('Location', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, color:HexColor('858997')),),
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
                        left: 30, right: 30, top: 0, bottom:0),
                    child: Container(
                      width: double.infinity,
                      child: Text('Selling', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
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
                                              child: Text('Your Listings', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, color:HexColor('858997')),),
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
                                              child: Text('Insights', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, color:HexColor('858997')),),
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
                        left: 30, right: 30, top: 10, bottom:0),
                    child: Container(
                      width: double.infinity,
                      child: Text('Buying', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
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
                                              child: Text('Cart', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, color:HexColor('858997')),),
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
                                              child: Text('Saved', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, color:HexColor('858997')),),
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
                                              child: Text('Following', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, color:HexColor('858997')),),
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
                        left: 30, right: 30, top: 10, bottom:0),
                    child: Container(
                      width: double.infinity,
                      child: Text('More', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
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
                                              child: Text('Settings', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, color:HexColor('858997')),),
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
                                              child: Text('Get Help On Marketplace', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, color:HexColor('858997')),),
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