import 'package:flutter/material.dart';
import 'package:nestore/ui/common/HexColor.dart';
import 'package:nestore/ui/social/chat_list.dart';

class SocialSearch extends StatefulWidget {
  SocialSearch({Key key}) : super(key: key);

  @override
  _SocialSearchState createState() => _SocialSearchState();
}

class _SocialSearchState extends State<SocialSearch> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(
                left: 0, right: 0, top:10),
            child: Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(
                        left: 10, right: 20, top:30),
                    child: Row(
                      children: [
                        Expanded(
                            flex:1,
                            child: Image.asset('graphics/sidemenu.png')
                        ),
                        Expanded(
                          flex:6,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 20),
                            child: Text('Feed', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                          ),
                        ),
                        Expanded(
                            flex:1,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Image.asset('graphics/greyheart.png'),
                            )
                        ),
                          Expanded(
                              flex:1,
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Image.asset('graphics/Search.png'),
                              )
                          )
                      ],
                    )
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 0, right: 0, top:10),
                  child: Row(
                    children: [
                      //
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SocialChatList(),
                              ),
                            );
                          },
                          child: Image.asset('graphics/Image.png'),
                        ),
                      ),
                      Expanded(
                        child: Image.asset('graphics/Image (1).png'),
                      ),
                      Expanded(
                        child: Image.asset('graphics/Image (2).png'),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 0, right: 0, top:0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 0, right: 0, bottom: 5),
                              child: Image.asset('graphics/Image (3).png'),
                            ),
                            Image.asset('graphics/Image (5).png'),
                          ],
                        ),
                      ),
                      Expanded(
                        flex:2,
                        child: Image.asset('graphics/Image (4).png'),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 0, right: 0, top:0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Image.asset('graphics/Image (6).png'),
                      ),
                      Expanded(
                        child: Image.asset('graphics/Image (7).png'),
                      ),
                      Expanded(
                        child: Image.asset('graphics/Image (8).png'),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 0, right: 0, top:0),
                  child: Row(
                    children: [
                      Expanded(
                        flex:2,
                        child: Image.asset('graphics/Image (9).png'),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 0, right: 0, bottom: 5),
                              child: Image.asset('graphics/Image (10).png'),
                            ),
                            Image.asset('graphics/Image (11).png'),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}




class Posts extends StatefulWidget {
  Posts({Key key}) : super(key: key);

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Posts> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: HexColor('F7F8FA'),
          child: Padding(
              padding: EdgeInsets.only(
                  left: 20, right: 20, top:10),
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(
                          left: 0, right: 0, top:10, bottom: 10),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 0, right: 0, top:10),
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(5.0),)
                                ),
                                child: Container(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 0, right: 0, top:0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex:1,
                                                child: Image.asset('graphics/Avatar.png',)
                                            ),
                                            Expanded(
                                              flex:2,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width: double.infinity,
                                                    child: Text('Howard Barton', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    child: Text('2 hours ago', textAlign: TextAlign.start,style: TextStyle(color: HexColor('ACB1C0')),),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Image.asset('graphics/3dot.png'),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20, bottom:20),
                                        child: Container(
                                          width: double.infinity,
                                          child: Text('The Luxury Of Traveling With Yacht Charter Companies'),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20, bottom:20),
                                        child: Container(
                                            width: double.infinity,
                                            child: Image.asset('graphics/rectangle.png')
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20, top:0, bottom: 20),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex:1,
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Image.asset('graphics/heart.png',),
                                                    ),
                                                    Expanded(
                                                      child: Text('1125'),
                                                    )
                                                  ],
                                                )
                                            ),
                                            Expanded(
                                                flex:2,
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Image.asset('graphics/msg.png',),
                                                    ),
                                                    Expanded(
                                                      flex:3,
                                                      child: Container(
                                                        width: double.infinity,
                                                        child: Text('348'),
                                                      ),
                                                    )
                                                  ],
                                                )
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Image.asset('graphics/Avatar.png', height: 30,),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 0, right: 0, top:10),
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(5.0),)
                                ),
                                child: Container(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 0, right: 0, top:0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex:1,
                                                child: Image.asset('graphics/Avatar.png',)
                                            ),
                                            Expanded(
                                              flex:2,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width: double.infinity,
                                                    child: Text('Howard Barton', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    child: Text('2 hours ago', textAlign: TextAlign.start,style: TextStyle(color: HexColor('ACB1C0')),),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Image.asset('graphics/3dot.png'),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20, bottom:20),
                                        child: Container(
                                          width: double.infinity,
                                          child: Text('The Luxury Of Traveling With Yacht Charter Companies'),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20, bottom:20),
                                        child: Container(
                                            width: double.infinity,
                                            child: Image.asset('graphics/rectangle.png')
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20, top:0, bottom: 20),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex:1,
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Image.asset('graphics/heart.png',),
                                                    ),
                                                    Expanded(
                                                      child: Text('1125'),
                                                    )
                                                  ],
                                                )
                                            ),
                                            Expanded(
                                                flex:2,
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Image.asset('graphics/msg.png',),
                                                    ),
                                                    Expanded(
                                                      flex:3,
                                                      child: Container(
                                                        width: double.infinity,
                                                        child: Text('348'),
                                                      ),
                                                    )
                                                  ],
                                                )
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Image.asset('graphics/Avatar.png', height: 30,),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 0, right: 0, top:10),
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(5.0),)
                                ),
                                child: Container(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 0, right: 0, top:0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex:1,
                                                child: Image.asset('graphics/Avatar.png',)
                                            ),
                                            Expanded(
                                              flex:2,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width: double.infinity,
                                                    child: Text('Howard Barton', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    child: Text('2 hours ago', textAlign: TextAlign.start,style: TextStyle(color: HexColor('ACB1C0')),),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Image.asset('graphics/3dot.png'),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20, bottom:20),
                                        child: Container(
                                          width: double.infinity,
                                          child: Text('The Luxury Of Traveling With Yacht Charter Companies'),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20, bottom:20),
                                        child: Container(
                                            width: double.infinity,
                                            child: Image.asset('graphics/rectangle.png')
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20, top:0, bottom: 20),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex:1,
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Image.asset('graphics/heart.png',),
                                                    ),
                                                    Expanded(
                                                      child: Text('1125'),
                                                    )
                                                  ],
                                                )
                                            ),
                                            Expanded(
                                                flex:2,
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Image.asset('graphics/msg.png',),
                                                    ),
                                                    Expanded(
                                                      flex:3,
                                                      child: Container(
                                                        width: double.infinity,
                                                        child: Text('348'),
                                                      ),
                                                    )
                                                  ],
                                                )
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Image.asset('graphics/Avatar.png', height: 30,),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 0, right: 0, top:10),
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(5.0),)
                                ),
                                child: Container(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 0, right: 0, top:0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex:1,
                                                child: Image.asset('graphics/Avatar.png',)
                                            ),
                                            Expanded(
                                              flex:2,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width: double.infinity,
                                                    child: Text('Howard Barton', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    child: Text('2 hours ago', textAlign: TextAlign.start,style: TextStyle(color: HexColor('ACB1C0')),),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Image.asset('graphics/3dot.png'),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20, bottom:20),
                                        child: Container(
                                          width: double.infinity,
                                          child: Text('The Luxury Of Traveling With Yacht Charter Companies'),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20, bottom:20),
                                        child: Container(
                                            width: double.infinity,
                                            child: Image.asset('graphics/rectangle.png')
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20, top:0, bottom: 20),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex:1,
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Image.asset('graphics/heart.png',),
                                                    ),
                                                    Expanded(
                                                      child: Text('1125'),
                                                    )
                                                  ],
                                                )
                                            ),
                                            Expanded(
                                                flex:2,
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Image.asset('graphics/msg.png',),
                                                    ),
                                                    Expanded(
                                                      flex:3,
                                                      child: Container(
                                                        width: double.infinity,
                                                        child: Text('348'),
                                                      ),
                                                    )
                                                  ],
                                                )
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Image.asset('graphics/Avatar.png', height: 30,),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 0, right: 0, top:10),
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(5.0),)
                                ),
                                child: Container(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 0, right: 0, top:0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex:1,
                                                child: Image.asset('graphics/Avatar.png',)
                                            ),
                                            Expanded(
                                              flex:2,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width: double.infinity,
                                                    child: Text('Howard Barton', textAlign: TextAlign.start, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    child: Text('2 hours ago', textAlign: TextAlign.start,style: TextStyle(color: HexColor('ACB1C0')),),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Image.asset('graphics/3dot.png'),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20, bottom:20),
                                        child: Container(
                                          width: double.infinity,
                                          child: Text('The Luxury Of Traveling With Yacht Charter Companies'),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20, bottom:20),
                                        child: Container(
                                            width: double.infinity,
                                            child: Image.asset('graphics/rectangle.png')
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20, top:0, bottom: 20),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex:1,
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Image.asset('graphics/heart.png',),
                                                    ),
                                                    Expanded(
                                                      child: Text('1125'),
                                                    )
                                                  ],
                                                )
                                            ),
                                            Expanded(
                                                flex:2,
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Image.asset('graphics/msg.png',),
                                                    ),
                                                    Expanded(
                                                      flex:3,
                                                      child: Container(
                                                        width: double.infinity,
                                                        child: Text('348'),
                                                      ),
                                                    )
                                                  ],
                                                )
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Image.asset('graphics/Avatar.png', height: 30,),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                            ),
                          ),
                        ],
                      )
                  ),
                ],
              )
          ),
        )
    );
  }
}
