import 'package:flutter/material.dart';
import 'package:nestore/ui/common/HexColor.dart';
import 'package:nestore/ui/common/search_field.dart';
import 'package:nestore/ui/hotel/home.dart';
import 'package:nestore/ui/social/search_screen.dart';

class SocialHome extends StatefulWidget {
  SocialHome({Key key}) : super(key: key);

  @override
  _SocialHomeState createState() => _SocialHomeState();
}

class _SocialHomeState extends State<SocialHome> {
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
                        left: 20, right: 20, top:30),
                  child: Row(
                    children: [
                      Expanded(
                        flex:6,
                        child: SearchTextField(
                          placeholderText: 'search',
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
                            child: Image.asset('graphics/Avatar.png'),
                          )
                        )
                          //
                      )
                    ],
                  )
                ),
                Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top:10),
                  child:  Column(
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 0),
                          height:
                          (MediaQuery.of(context).size.height * 0.05),
                          child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                          width: 110.0,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                      onTap: () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => HotelHome()
                                        ),
                                      ),
                                      child: Text(
                                        'Following',
                                        textAlign:
                                        TextAlign.start,
                                        style: TextStyle(

                                            fontSize: 18,
                                            color: HexColor('ACB1C0')),
                                      )))
                            ],
                          )),
                      Container(
                          width: 100.0,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                      onTap: () => print(1),
                                      child: Text(
                                        'Popular',
                                        textAlign:
                                        TextAlign.start,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: HexColor('ACB1C0')),
                                      )))
                            ],
                          )),
                      Container(
                          width: 100.0,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                      onTap: () => print(2),
                                      child: Text(
                                        'Friends',
                                        textAlign:
                                        TextAlign.start,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: HexColor('ACB1C0')),
                                      )))
                            ],
                          )),
                        Container(
                            width: 100.0,
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: GestureDetector(
                                        onTap: () => print(3),
                                        child: Text(
                                          'Group',
                                          textAlign:
                                          TextAlign.start,
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: HexColor('ACB1C0')),
                                        )))
                              ],
                            )),
                    ],
                  )
                )
          ]
                  )
                ),
                Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top:10, bottom:30),
                    child:  Container(
                        margin: EdgeInsets.symmetric(vertical: 0),
                        height:
                        (MediaQuery.of(context).size.height * 0.09),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Container(
                              width: 90.0,
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                          onTap: () => print(0),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 10, right: 10, top:0),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage("graphics/oval.png"),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, right: 10, top:0),
                                                    child: Container(
                                                        width: 90,
                                                        height: 90,
                                                        decoration: new BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            image: new DecorationImage(
                                                                fit: BoxFit.contain,
                                                                image: new NetworkImage(
                                                                    "https://i.imgur.com/BoN9kdC.png")
                                                            )
                                                        ))
                                                )
                                            ),
                                          )
                                      ))
                                ],
                              ),
                            ),
                            Container(
                              width: 90.0,
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                          onTap: () => print(0),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 10, right: 10, top:0),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage("graphics/oval.png"),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, right: 10, top:0),
                                                    child: Container(
                                                        width: 90,
                                                        height: 90,
                                                        decoration: new BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            image: new DecorationImage(
                                                                fit: BoxFit.contain,
                                                                image: new NetworkImage(
                                                                    "https://i.imgur.com/BoN9kdC.png")
                                                            )
                                                        ))
                                                )
                                            ),
                                          )
                                      ))
                                ],
                              ),
                            ),
                            Container(
                              width: 90.0,
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                          onTap: () => print(0),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 10, right: 10, top:0),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage("graphics/oval.png"),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, right: 10, top:0),
                                                    child: Container(
                                                        width: 90,
                                                        height: 90,
                                                        decoration: new BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            image: new DecorationImage(
                                                                fit: BoxFit.contain,
                                                                image: new NetworkImage(
                                                                    "https://i.imgur.com/BoN9kdC.png")
                                                            )
                                                        ))
                                                )
                                            ),
                                          )
                                      ))
                                ],
                              ),
                            ),
                            Container(
                              width: 90.0,
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                          onTap: () => print(0),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 10, right: 10, top:0),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage("graphics/oval.png"),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, right: 10, top:0),
                                                    child: Container(
                                                        width: 90,
                                                        height: 90,
                                                        decoration: new BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            image: new DecorationImage(
                                                                fit: BoxFit.contain,
                                                                image: new NetworkImage(
                                                                    "https://i.imgur.com/BoN9kdC.png")
                                                            )
                                                        ))
                                                )
                                            ),
                                          )
                                      ))
                                ],
                              ),
                            ),
                            Container(
                              width: 90.0,
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                          onTap: () => print(0),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 10, right: 10, top:0),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage("graphics/oval.png"),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, right: 10, top:0),
                                                    child: Container(
                                                        width: 90,
                                                        height: 90,
                                                        decoration: new BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            image: new DecorationImage(
                                                                fit: BoxFit.contain,
                                                                image: new NetworkImage(
                                                                    "https://i.imgur.com/BoN9kdC.png")
                                                            )
                                                        ))
                                                )
                                            ),
                                          )
                                      ))
                                ],
                              ),
                            ),
                            Container(
                              width: 90.0,
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                          onTap: () => print(0),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 10, right: 10, top:0),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage("graphics/oval.png"),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, right: 10, top:0),
                                                    child: Container(
                                                        width: 90,
                                                        height: 90,
                                                        decoration: new BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            image: new DecorationImage(
                                                                fit: BoxFit.contain,
                                                                image: new NetworkImage(
                                                                    "https://i.imgur.com/BoN9kdC.png")
                                                            )
                                                        ))
                                                )
                                            ),
                                          )
                                      ))
                                ],
                              ),
                            ),
                            Container(
                              width: 90.0,
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                          onTap: () => print(0),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 10, right: 10, top:0),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage("graphics/oval.png"),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, right: 10, top:0),
                                                    child: Container(
                                                        width: 90,
                                                        height: 90,
                                                        decoration: new BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            image: new DecorationImage(
                                                                fit: BoxFit.contain,
                                                                image: new NetworkImage(
                                                                    "https://i.imgur.com/BoN9kdC.png")
                                                            )
                                                        ))
                                                )
                                            ),
                                          )
                                      ))
                                ],
                              ),
                            ),
                            Container(
                              width: 90.0,
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                          onTap: () => print(0),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 10, right: 10, top:0),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage("graphics/oval.png"),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, right: 10, top:0),
                                                    child: Container(
                                                        width: 90,
                                                        height: 90,
                                                        decoration: new BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            image: new DecorationImage(
                                                                fit: BoxFit.contain,
                                                                image: new NetworkImage(
                                                                    "https://i.imgur.com/BoN9kdC.png")
                                                            )
                                                        ))
                                                )
                                            ),
                                          )
                                      ))
                                ],
                              ),
                            ),
                            Container(
                              width: 90.0,
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                          onTap: () => print(0),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 10, right: 10, top:0),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage("graphics/oval.png"),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, right: 10, top:0),
                                                    child: Container(
                                                        width: 90,
                                                        height: 90,
                                                        decoration: new BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            image: new DecorationImage(
                                                                fit: BoxFit.contain,
                                                                image: new NetworkImage(
                                                                    "https://i.imgur.com/BoN9kdC.png")
                                                            )
                                                        ))
                                                )
                                            ),
                                          )
                                      ))
                                ],
                              ),
                            ),
                            Container(
                              width: 90.0,
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                          onTap: () => print(0),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 10, right: 10, top:0),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage("graphics/oval.png"),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, right: 10, top:0),
                                                    child: Container(
                                                        width: 90,
                                                        height: 90,
                                                        decoration: new BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            image: new DecorationImage(
                                                                fit: BoxFit.contain,
                                                                image: new NetworkImage(
                                                                    "https://i.imgur.com/BoN9kdC.png")
                                                            )
                                                        ))
                                                )
                                            ),
                                          )
                                      ))
                                ],
                              ),
                            ),
                          ],
                        )
                    )
                ),
                Posts()
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
                left: 10, right: 10, top:10),
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
                                          left: 0, right: 0, top:10, bottom:10),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex:1,
                                              child: Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: new BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: new DecorationImage(
                                                          fit: BoxFit.contain,
                                                          image: new NetworkImage(
                                                              "https://i.imgur.com/BoN9kdC.png")
                                                      )
                                                  ))
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
                                          left: 0, right: 0, bottom:20),
                                      child: Image.asset('graphics/rectangle.png')
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
                                          left: 0, right: 0, top:10, bottom:10),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex:1,
                                              child: Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: new BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: new DecorationImage(
                                                          fit: BoxFit.contain,
                                                          image: new NetworkImage(
                                                              "https://i.imgur.com/BoN9kdC.png")
                                                      )
                                                  ))
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
                                            left: 0, right: 0, bottom:20),
                                        child: Image.asset('graphics/rectangle.png')
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
                                          left: 0, right: 0, top:10, bottom:10),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex:1,
                                              child: Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: new BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: new DecorationImage(
                                                          fit: BoxFit.contain,
                                                          image: new NetworkImage(
                                                              "https://i.imgur.com/BoN9kdC.png")
                                                      )
                                                  ))
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
                                            left: 0, right: 0, bottom:20),
                                        child: Image.asset('graphics/rectangle.png')
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
                                          left: 0, right: 0, top:10, bottom:10),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex:1,
                                              child: Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: new BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: new DecorationImage(
                                                          fit: BoxFit.contain,
                                                          image: new NetworkImage(
                                                              "https://i.imgur.com/BoN9kdC.png")
                                                      )
                                                  ))
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
                                            left: 0, right: 0, bottom:20),
                                        child: Image.asset('graphics/rectangle.png')
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
                                          left: 0, right: 0, top:10, bottom:10),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex:1,
                                              child: Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: new BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: new DecorationImage(
                                                          fit: BoxFit.contain,
                                                          image: new NetworkImage(
                                                              "https://i.imgur.com/BoN9kdC.png")
                                                      )
                                                  ))
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
                                            left: 0, right: 0, bottom:20),
                                        child: Image.asset('graphics/rectangle.png')
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
                        ), Padding(
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
                                          left: 0, right: 0, top:10, bottom:10),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex:1,
                                              child: Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: new BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: new DecorationImage(
                                                          fit: BoxFit.contain,
                                                          image: new NetworkImage(
                                                              "https://i.imgur.com/BoN9kdC.png")
                                                      )
                                                  ))
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
                                            left: 0, right: 0, bottom:20),
                                        child: Image.asset('graphics/rectangle.png')
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
                                          left: 0, right: 0, top:10, bottom:10),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex:1,
                                              child: Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: new BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: new DecorationImage(
                                                          fit: BoxFit.contain,
                                                          image: new NetworkImage(
                                                              "https://i.imgur.com/BoN9kdC.png")
                                                      )
                                                  ))
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
                                            left: 0, right: 0, bottom:20),
                                        child: Image.asset('graphics/rectangle.png')
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
