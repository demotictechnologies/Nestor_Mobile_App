import 'package:flutter/material.dart';
import 'package:nestore/ui/common/HexColor.dart';
import 'package:nestore/ui/social/chat.dart';

class SocialChatList extends StatefulWidget {
  SocialChatList({Key key}) : super(key: key);

  @override
  _SocialChatListState createState() => _SocialChatListState();
}

class _SocialChatListState extends State<SocialChatList> {
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
                        left: 10, right: 20, top:10),
                    child: Row(
                      children: [
                        Expanded(
                            flex:1,
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  index=0;
                                });
                                _scaffoldKey.currentState.openDrawer();
                              },
                              child: Image.asset('graphics/sidemenu.png'),
                            )
                        ),
                        Expanded(
                          flex:6,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 20),
                            child: Text('Messages', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),textAlign: TextAlign.center,),
                          ),
                        ),
                        Expanded(
                            flex:1,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Image.asset('graphics/friendrequest.png'),
                            )
                        )
                      ],
                    )
                ),
                Padding(
                    padding: EdgeInsets.only(
                        left: 0, right: 0, top:10, bottom:10),
                    child: Container(
                      color: Colors.white,
                      width: double.infinity,
                      child:  Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 20, right: 20, top:20, bottom:20),
                            child: Container(
                              width: double.infinity,
                              child: Text('ONLINE USERS', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                            )
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                 bottom:20),
                            child: Container(
                                margin: EdgeInsets.symmetric(vertical: 0),
                                height:
                                (MediaQuery.of(context).size.height * 0.07),
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: <Widget>[
                                    Container(
                                      width: 70.0,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            child: GestureDetector(
                                                onTap: () => print(0),
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10, right: 10, top:0),
                                                  child: Container(
                                                      width: 90,
                                                      height: 90,
                                                      decoration: new BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          image: new DecorationImage(
                                                              fit: BoxFit.fill,
                                                              image: new AssetImage(
                                                                  "graphics/Avatar.png")
                                                          )
                                                      )),
                                          ),
                            ),
                                          ),
                                          Positioned(
                                            top:35,
                                            right:10,
                                            child: Image.asset('graphics/online.png',),
                                          )
                                        ],
                                      )
                                    ),
                                    Container(
                                        width: 70.0,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              child: GestureDetector(
                                                onTap: () => print(0),
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10, right: 10, top:0),
                                                  child: Container(
                                                      width: 90,
                                                      height: 90,
                                                      decoration: new BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          image: new DecorationImage(
                                                              fit: BoxFit.fill,
                                                              image: AssetImage(
                                                                  "graphics/Avatar.png")
                                                          )
                                                      )),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top:35,
                                              right:10,
                                              child: Image.asset('graphics/online.png',),
                                            )
                                          ],
                                        )
                                    ),
                                    Container(
                                        width: 70.0,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              child: GestureDetector(
                                                onTap: () => print(0),
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10, right: 10, top:0),
                                                  child: Container(
                                                      width: 90,
                                                      height: 90,
                                                      decoration: new BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          image: new DecorationImage(
                                                              fit: BoxFit.fill,
                                                              image: AssetImage(
                                                                  "graphics/Avatar.png")
                                                          )
                                                      )),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top:35,
                                              right:10,
                                              child: Image.asset('graphics/online.png',),
                                            )
                                          ],
                                        )
                                    ),
                                    Container(
                                        width: 70.0,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              child: GestureDetector(
                                                onTap: () => print(0),
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10, right: 10, top:0),
                                                  child: Container(
                                                      width: 90,
                                                      height: 90,
                                                      decoration: new BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          image: new DecorationImage(
                                                              fit: BoxFit.fill,
                                                              image: AssetImage(
                                                                  "graphics/Avatar.png")
                                                          )
                                                      )),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top:35,
                                              right:10,
                                              child: Image.asset('graphics/online.png',),
                                            )
                                          ],
                                        )
                                    ),
                                    Container(
                                        width: 70.0,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              child: GestureDetector(
                                                onTap: () => print(0),
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10, right: 10, top:0),
                                                  child: Container(
                                                      width: 90,
                                                      height: 90,
                                                      decoration: new BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          image: new DecorationImage(
                                                              fit: BoxFit.fill,
                                                              image: AssetImage(
                                                                  "graphics/Avatar.png")
                                                          )
                                                      )),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top:35,
                                              right:10,
                                              child: Image.asset('graphics/online.png',),
                                            )
                                          ],
                                        )
                                    ),
                                    Container(
                                        width: 70.0,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              child: GestureDetector(
                                                onTap: () => print(0),
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10, right: 10, top:0),
                                                  child: Container(
                                                      width: 90,
                                                      height: 90,
                                                      decoration: new BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          image: new DecorationImage(
                                                              fit: BoxFit.fill,
                                                              image: AssetImage(
                                                                  "graphics/Avatar.png")
                                                          )
                                                      )),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top:35,
                                              right:10,
                                              child: Image.asset('graphics/online.png',),
                                            )
                                          ],
                                        )
                                    ),
                                    Container(
                                        width: 70.0,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              child: GestureDetector(
                                                onTap: () => print(0),
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10, right: 10, top:0),
                                                  child: Container(
                                                      width: 90,
                                                      height: 90,
                                                      decoration: new BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          image: new DecorationImage(
                                                              fit: BoxFit.fill,
                                                              image: AssetImage(
                                                                  "graphics/Avatar.png")
                                                          )
                                                      )),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top:35,
                                              right:10,
                                              child: Image.asset('graphics/online.png',),
                                            )
                                          ],
                                        )
                                    ),
                                    Container(
                                        width: 70.0,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              child: GestureDetector(
                                                onTap: () => print(0),
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10, right: 10, top:0),
                                                  child: Container(
                                                      width: 90,
                                                      height: 90,
                                                      decoration: new BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          image: new DecorationImage(
                                                              fit: BoxFit.fill,
                                                              image: AssetImage(
                                                                  "graphics/Avatar.png")
                                                          )
                                                      )),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top:35,
                                              right:10,
                                              child: Image.asset('graphics/online.png',),
                                            )
                                          ],
                                        )
                                    ),
                                    Container(
                                        width: 70.0,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              child: GestureDetector(
                                                onTap: () => print(0),
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10, right: 10, top:0),
                                                  child: Container(
                                                      width: 90,
                                                      height: 90,
                                                      decoration: new BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          image: new DecorationImage(
                                                              fit: BoxFit.fill,
                                                              image: AssetImage(
                                                                  "graphics/Avatar.png")
                                                          )
                                                      )),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top:35,
                                              right:10,
                                              child: Image.asset('graphics/online.png',),
                                            )
                                          ],
                                        )
                                    ),


                                  ],
                                )
                            ),
                          ),

                              ],
                            )
                          )
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SocialChat(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 0, top: 10),
                          child: Row(
                            children: [
                              Expanded(
                                  flex:1,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: new BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: new DecorationImage(
                                                    fit: BoxFit.contain,
                                                    image:AssetImage(
                                                        "graphics/Avatar.png")
                                                )
                                            )),
                                      ),
                                      Positioned(
                                        top:24,
                                        right:20,
                                        child: Image.asset('graphics/number.png',),
                                      )
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
                                          flex:3,
                                          child: Container(
                                            width: double.infinity,
                                            child: Text('Howard Barton', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text('03:04AM', style: TextStyle(color: HexColor('ACB1C0'))),
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: Text("Hey! How's it going?", textAlign: TextAlign.start,style: TextStyle(color: HexColor('ACB1C0')),),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SocialChat(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 0, top: 10),
                          child: Row(
                            children: [
                              Expanded(
                                  flex:1,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: new BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: new DecorationImage(
                                                    fit: BoxFit.contain,
                                                    image:AssetImage(
                                                        "graphics/Avatar.png")
                                                )
                                            )),
                                      ),
                                      Positioned(
                                        top:24,
                                        right:20,
                                        child: Image.asset('graphics/number.png',),
                                      )
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
                                          flex:3,
                                          child: Container(
                                            width: double.infinity,
                                            child: Text('Howard Barton', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text('03:04AM', style: TextStyle(color: HexColor('ACB1C0'))),
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: Text("Hey! How's it going?", textAlign: TextAlign.start,style: TextStyle(color: HexColor('ACB1C0')),),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SocialChat(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 0, top: 10),
                          child: Row(
                            children: [
                              Expanded(
                                  flex:1,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: new BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: new DecorationImage(
                                                    fit: BoxFit.contain,
                                                    image:AssetImage(
                                                        "graphics/Avatar.png")
                                                )
                                            )),
                                      ),
                                      Positioned(
                                        top:24,
                                        right:20,
                                        child: Image.asset('graphics/number.png',),
                                      )
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
                                          flex:3,
                                          child: Container(
                                            width: double.infinity,
                                            child: Text('Howard Barton', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text('03:04AM', style: TextStyle(color: HexColor('ACB1C0'))),
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: Text("Hey! How's it going?", textAlign: TextAlign.start,style: TextStyle(color: HexColor('ACB1C0')),),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SocialChat(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 0, top: 10),
                          child: Row(
                            children: [
                              Expanded(
                                  flex:1,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: new BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: new DecorationImage(
                                                    fit: BoxFit.contain,
                                                    image:AssetImage(
                                                        "graphics/Avatar.png")
                                                )
                                            )),
                                      ),
                                      Positioned(
                                        top:24,
                                        right:20,
                                        child: Image.asset('graphics/number.png',),
                                      )
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
                                          flex:3,
                                          child: Container(
                                            width: double.infinity,
                                            child: Text('Howard Barton', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text('03:04AM', style: TextStyle(color: HexColor('ACB1C0'))),
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: Text("Hey! How's it going?", textAlign: TextAlign.start,style: TextStyle(color: HexColor('ACB1C0')),),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SocialChat(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 0, top: 10),
                          child: Row(
                            children: [
                              Expanded(
                                  flex:1,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: new BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: new DecorationImage(
                                                    fit: BoxFit.contain,
                                                    image:AssetImage(
                                                        "graphics/Avatar.png")
                                                )
                                            )),
                                      ),
                                      Positioned(
                                        top:24,
                                        right:20,
                                        child: Image.asset('graphics/number.png',),
                                      )
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
                                          flex:3,
                                          child: Container(
                                            width: double.infinity,
                                            child: Text('Howard Barton', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text('03:04AM', style: TextStyle(color: HexColor('ACB1C0'))),
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: Text("Hey! How's it going?", textAlign: TextAlign.start,style: TextStyle(color: HexColor('ACB1C0')),),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SocialChat(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 0, top: 10),
                          child: Row(
                            children: [
                              Expanded(
                                  flex:1,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: new BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: new DecorationImage(
                                                    fit: BoxFit.contain,
                                                    image:AssetImage(
                                                        "graphics/Avatar.png")
                                                )
                                            )),
                                      ),
                                      Positioned(
                                        top:24,
                                        right:20,
                                        child: Image.asset('graphics/number.png',),
                                      )
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
                                          flex:3,
                                          child: Container(
                                            width: double.infinity,
                                            child: Text('Howard Barton', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text('03:04AM', style: TextStyle(color: HexColor('ACB1C0'))),
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: Text("Hey! How's it going?", textAlign: TextAlign.start,style: TextStyle(color: HexColor('ACB1C0')),),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SocialChat(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 0, top: 10),
                          child: Row(
                            children: [
                              Expanded(
                                  flex:1,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: new BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: new DecorationImage(
                                                    fit: BoxFit.contain,
                                                    image:AssetImage(
                                                        "graphics/Avatar.png")
                                                )
                                            )),
                                      ),
                                      Positioned(
                                        top:24,
                                        right:20,
                                        child: Image.asset('graphics/number.png',),
                                      )
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
                                          flex:3,
                                          child: Container(
                                            width: double.infinity,
                                            child: Text('Howard Barton', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text('03:04AM', style: TextStyle(color: HexColor('ACB1C0'))),
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: Text("Hey! How's it going?", textAlign: TextAlign.start,style: TextStyle(color: HexColor('ACB1C0')),),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SocialChat(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 0, top: 10),
                          child: Row(
                            children: [
                              Expanded(
                                  flex:1,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: new BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: new DecorationImage(
                                                    fit: BoxFit.contain,
                                                    image:AssetImage(
                                                        "graphics/Avatar.png")
                                                )
                                            )),
                                      ),
                                      Positioned(
                                        top:24,
                                        right:20,
                                        child: Image.asset('graphics/number.png',),
                                      )
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
                                          flex:3,
                                          child: Container(
                                            width: double.infinity,
                                            child: Text('Howard Barton', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text('03:04AM', style: TextStyle(color: HexColor('ACB1C0'))),
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: Text("Hey! How's it going?", textAlign: TextAlign.start,style: TextStyle(color: HexColor('ACB1C0')),),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SocialChat(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 0, top: 10),
                          child: Row(
                            children: [
                              Expanded(
                                  flex:1,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: new BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: new DecorationImage(
                                                    fit: BoxFit.contain,
                                                    image:AssetImage(
                                                        "graphics/Avatar.png")
                                                )
                                            )),
                                      ),
                                      Positioned(
                                        top:24,
                                        right:20,
                                        child: Image.asset('graphics/number.png',),
                                      )
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
                                          flex:3,
                                          child: Container(
                                            width: double.infinity,
                                            child: Text('Howard Barton', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text('03:04AM', style: TextStyle(color: HexColor('ACB1C0'))),
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: Text("Hey! How's it going?", textAlign: TextAlign.start,style: TextStyle(color: HexColor('ACB1C0')),),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SocialChat(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 0, top: 10),
                          child: Row(
                            children: [
                              Expanded(
                                  flex:1,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: new BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: new DecorationImage(
                                                    fit: BoxFit.contain,
                                                    image:AssetImage(
                                                        "graphics/Avatar.png")
                                                )
                                            )),
                                      ),
                                      Positioned(
                                        top:24,
                                        right:20,
                                        child: Image.asset('graphics/number.png',),
                                      )
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
                                          flex:3,
                                          child: Container(
                                            width: double.infinity,
                                            child: Text('Howard Barton', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text('03:04AM', style: TextStyle(color: HexColor('ACB1C0'))),
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: Text("Hey! How's it going?", textAlign: TextAlign.start,style: TextStyle(color: HexColor('ACB1C0')),),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SocialChat(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 0, top: 10),
                          child: Row(
                            children: [
                              Expanded(
                                  flex:1,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: new BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: new DecorationImage(
                                                    fit: BoxFit.contain,
                                                    image:AssetImage(
                                                        "graphics/Avatar.png")
                                                )
                                            )),
                                      ),
                                      Positioned(
                                        top:24,
                                        right:20,
                                        child: Image.asset('graphics/number.png',),
                                      )
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
                                          flex:3,
                                          child: Container(
                                            width: double.infinity,
                                            child: Text('Howard Barton', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text('03:04AM', style: TextStyle(color: HexColor('ACB1C0'))),
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: Text("Hey! How's it going?", textAlign: TextAlign.start,style: TextStyle(color: HexColor('ACB1C0')),),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SocialChat(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 0, top: 10),
                          child: Row(
                            children: [
                              Expanded(
                                  flex:1,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: new BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: new DecorationImage(
                                                    fit: BoxFit.contain,
                                                    image:AssetImage(
                                                        "graphics/Avatar.png")
                                                )
                                            )),
                                      ),
                                      Positioned(
                                        top:24,
                                        right:20,
                                        child: Image.asset('graphics/number.png',),
                                      )
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
                                          flex:3,
                                          child: Container(
                                            width: double.infinity,
                                            child: Text('Howard Barton', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text('03:04AM', style: TextStyle(color: HexColor('ACB1C0'))),
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: Text("Hey! How's it going?", textAlign: TextAlign.start,style: TextStyle(color: HexColor('ACB1C0')),),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SocialChat(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 0, top: 10),
                          child: Row(
                            children: [
                              Expanded(
                                  flex:1,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: new BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: new DecorationImage(
                                                    fit: BoxFit.contain,
                                                    image:AssetImage(
                                                        "graphics/Avatar.png")
                                                )
                                            )),
                                      ),
                                      Positioned(
                                        top:24,
                                        right:20,
                                        child: Image.asset('graphics/number.png',),
                                      )
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
                                          flex:3,
                                          child: Container(
                                            width: double.infinity,
                                            child: Text('Howard Barton', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text('03:04AM', style: TextStyle(color: HexColor('ACB1C0'))),
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: Text("Hey! How's it going?", textAlign: TextAlign.start,style: TextStyle(color: HexColor('ACB1C0')),),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),






                    ],
                  )
                )
                        ],
                      ),
                    )
                ),
      drawer: Drawer(
        elevation: 5,
        child: ListView(
          padding: EdgeInsets.only(
             top:30),
          children: <Widget>[
            ListTile(
              leading: Image.asset('graphics/Avatar.png'),
              title: Text('Carolyn', style: TextStyle(color: HexColor('596172')),),
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => HomeScreen(),
                //   ),
                // );
//  Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Image.asset('graphics/graph.png'),
              title: Text(index == 0 ? 'Main Category' : 'Sub Category', style: TextStyle(color: HexColor('596172'))),
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => HomeScreen(),
                //   ),
                // );
//  Navigator.pop(context);
              },
            ),
            ListTile(
                leading: Image.asset('graphics/chatmsg.png'),
                title: Text(index == 0 ? 'Main Category' : 'Sub Category', style: TextStyle(color: HexColor('596172'))),
                onTap: () {
                  // onTabTapped(2);
                  // Navigator.pop(context);
                }),
            ListTile(
                leading: Image.asset('graphics/notify.png'),
                title: Text(index == 0 ? 'Main Category' : 'Sub Category', style: TextStyle(color: HexColor('596172'))),
                onTap: () {
                  // onTabTapped(1);
                  // Navigator.pop(context);
                }),
            ListTile(
                leading: Image.asset('graphics/greyinline.png'),
                title: Text(index == 0 ? 'Main Category' : 'Sub Category', style: TextStyle(color: HexColor('596172'))),
                onTap: () {
                  // onTabTapped(3);
                  // Navigator.pop(context);
                }),

            ListTile(
              leading: Image.asset('graphics/cart.png'),
              title: Text(index == 0 ? 'Main Category' : 'Sub Category', style: TextStyle(color: HexColor('596172'))),
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => Container(),
                //   ),
                // );
//  Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Image.asset('graphics/inlineprofile.png'),
              title: Text(index == 0 ? 'Main Category' : 'Sub Category', style: TextStyle(color: HexColor('596172'))),
              onTap: () {

              },
            ),
            ListTile(
              leading: Image.asset('graphics/graph.png'),
              title: Text(index == 0 ? 'Main Category' : 'Sub Category', style: TextStyle(color: HexColor('596172'))),
              onTap: () {

              },
            ),
            ListTile(
              leading: Image.asset('graphics/chatmsg.png'),
              title: Text(index == 0 ? 'Main Category' : 'Sub Category', style: TextStyle(color: HexColor('596172'))),
              onTap: () {

              },
            ),
            ListTile(
              leading: Image.asset('graphics/notify.png'),
              title: Text(index == 0 ? 'Main Category' : 'Sub Category', style: TextStyle(color: HexColor('596172'))),
              onTap: () {

              },
            ),
            ListTile(
              leading: Image.asset('graphics/greyinline.png'),
              title: Text(index == 0 ? 'Main Category' : 'Sub Category', style: TextStyle(color: HexColor('596172'))),
              onTap: () {

                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => SelectPaymentOptionScreen(),
                //   ),
                // );
//  Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Image.asset('graphics/cart.png'),
              title: Text(index == 0 ? 'Main Category' : 'Sub Category', style: TextStyle(color: HexColor('596172'))),
              onTap: () {

              },
            ),

              ListTile(
                leading: Image.asset('graphics/inlineprofile.png'),
                title: Text(index == 0 ? 'Main Category' : 'Sub Category', style: TextStyle(color: HexColor('596172'))),
                onTap: () {
                  // Navigator.of(context).push(
                  //     new MaterialPageRoute(
                  //         builder: (BuildContext context) =>
                  //         new AgentsScreen()));
                  // // Navigator.pop(context);
                },
              ),
            ListTile(
              leading: Image.asset('graphics/graph.png'),
              title: Text(index == 0 ? 'Main Category' : 'Sub Category', style: TextStyle(color: HexColor('596172'))),
              onTap: () {

              },
            ),
            ListTile(
              leading: Image.asset('graphics/chatmsg.png'),
              title: Text(index == 0 ? 'Main Category' : 'Sub Category', style: TextStyle(color: HexColor('596172'))),
              onTap: () {

//  Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}