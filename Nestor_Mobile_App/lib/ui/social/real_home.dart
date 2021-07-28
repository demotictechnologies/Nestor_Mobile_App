import 'package:flutter/material.dart';
import 'package:nestore/ui/common/HexColor.dart';
import 'package:nestore/ui/common/search_field.dart';
import 'package:nestore/ui/hotel/home.dart';
import 'package:nestore/ui/social/notification.dart';
import 'package:nestore/ui/social/search_screen.dart';

class RealHome extends StatefulWidget {
  RealHome({Key key}) : super(key: key);

  @override
  _RealHomeState createState() => _RealHomeState();
}

class _RealHomeState extends State<RealHome> {
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
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                         top:5, left:5),
                                    child: Image.asset('graphics/btn_Plus.png',),
                                  ),
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
                                      width: 90.0,
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 1,
                                              child: GestureDetector(
                                                  onTap: () => print(0),
                                                  child: Text(
                                                    'Travel',
                                                    textAlign:
                                                    TextAlign.start,
                                                    style: TextStyle(

                                                        fontSize: 18,
                                                        color: HexColor('ACB1C0')),
                                                  )))
                                        ],
                                      )),
                                  Container(
                                      width: 90.0,
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 1,
                                              child: GestureDetector(
                                                  onTap: () => print(1),
                                                  child: Text(
                                                    'Game',
                                                    textAlign:
                                                    TextAlign.start,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: HexColor('ACB1C0')),
                                                  )))
                                        ],
                                      )),
                                  Container(
                                      width: 90.0,
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 1,
                                              child: GestureDetector(
                                                  onTap: () => print(2),
                                                  child: Text(
                                                    'Dance',
                                                    textAlign:
                                                    TextAlign.start,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: HexColor('ACB1C0')),
                                                  )))
                                        ],
                                      )),
                                  Container(
                                      width: 80.0,
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 1,
                                              child: GestureDetector(
                                                  onTap: () => print(3),
                                                  child: Text(
                                                    'Pet',
                                                    textAlign:
                                                    TextAlign.start,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: HexColor('ACB1C0')),
                                                  )))
                                        ],
                                      )),
                                  Container(
                                      width: 90.0,
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 1,
                                              child: GestureDetector(
                                                  onTap: () => print(3),
                                                  child: Text(
                                                    'Sport',
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
                        (MediaQuery.of(context).size.height * 0.35),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  right:10),
                              child: Stack(
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
                                          height: MediaQuery.of(context).size.height * 0.35,
                                          width: MediaQuery.of(context).size.width *0.4,
                                        )
                                    ),
                                  ),
                                  Positioned(
                                    bottom:10,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right:10, left:10),
                                          child: Image.asset('graphics/Avatar.png',),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right:10),
                                          child: Text('Matilda Cross', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                        )

                                      ],
                                    ),
                                  )
                                ],
                              )
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    right:10),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      child: Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage("graphics/girl1.png"),
                                                fit: BoxFit.fill,
                                              ),
                                              borderRadius: BorderRadius.all(Radius.circular(10.0),)
                                          ),
                                          child: Container(
                                            height: MediaQuery.of(context).size.height * 0.35,
                                            width: MediaQuery.of(context).size.width *0.4,
                                          )
                                      ),
                                    ),
                                    Positioned(
                                      bottom:10,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right:10, left:10),
                                            child: Image.asset('graphics/Avatar.png',),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right:10),
                                            child: Text('Matilda Cross', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                          )

                                        ],
                                      ),
                                    )
                                  ],
                                )
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    right:10),
                                child: Stack(
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
                                            height: MediaQuery.of(context).size.height * 0.35,
                                            width: MediaQuery.of(context).size.width *0.4,
                                          )
                                      ),
                                    ),
                                    Positioned(
                                      bottom:10,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right:10, left:10),
                                            child: Image.asset('graphics/Avatar.png',),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right:10),
                                            child: Text('Matilda Cross', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                          )

                                        ],
                                      ),
                                    )
                                  ],
                                )
                            ),
                          ],
                        )
                    )
                ),
                Popular(),
                Events()
              ],
            )
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: HexColor('FF2D55'),
        currentIndex: 2,
        type: BottomNavigationBarType.fixed,
        items: [
          new BottomNavigationBarItem(
            icon: Image(
              image: AssetImage('graphics/home.png'),
              width: 30,
              height: 30,
            ),
            title: Text('Home', style: TextStyle(fontSize: 12)),
          ),
          new BottomNavigationBarItem(
            icon: Image(
              image: AssetImage('graphics/stream.png'),
              width: 30,
              height: 30,
            ),
            title: Text('Streams', style: TextStyle(fontSize: 12)),
          ),
          new BottomNavigationBarItem(
            icon: Image(
              image: AssetImage('graphics/messagesTab.png'),
              width: 30,
              height: 30,
            ),
            title: Text('Messages', style: TextStyle(fontSize: 12)),
          ),
          new BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SocialNotification(),
                  ),
                );
              },
              child: Image(
                image: AssetImage('graphics/alert.png'),
                width: 30,
                height: 30,
              ),
            ),
            title: GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SocialNotification(),
                  ),
                );
              },
              child: Text('Notifications', style: TextStyle(fontSize: 12),),
            )
          ),
          new BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: (){

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HotelHome(),
                    ),
                  );
                },
                child: Image(
                  image: AssetImage('graphics/sidemenu.png'),
                  width: 30,
                  height: 30,
                )
            ),

            title: Text('Menu' ,style: TextStyle(fontSize: 12)),
          ),
        ],
      ),
    );
  }
}




class Popular extends StatefulWidget {
  Popular({Key key}) : super(key: key);

  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: HexColor('F7F8FA'),
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
                            top:10, bottom:10),
                        child: Container(
                          width: double.infinity,
                          child: Text('Popular', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 28),),
                        )
                      ),
                      Container(
                          color: Colors.white,
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(vertical: 0),
                          height:
                          (MediaQuery.of(context).size.height * 0.32),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      right:10),
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
                                                  height: MediaQuery.of(context).size.height * 0.25,
                                                  width: MediaQuery.of(context).size.width *0.4,
                                                )
                                            ),
                                          ),
                                          // Positioned(
                                          //   bottom:10,
                                          //   child: Row(
                                          //     children: [
                                          //       Padding(
                                          //         padding: EdgeInsets.only(
                                          //             right:10, left:10),
                                          //         child: Image.asset('graphics/Avatar.png',),
                                          //       ),
                                          //       Padding(
                                          //         padding: EdgeInsets.only(
                                          //             right:10),
                                          //         child: Text('Matilda Cross', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                          //       )
                                          //
                                          //     ],
                                          //   ),
                                          // )
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top:5),
                                        child: Container(

                                          child: Text('LIVE - On the Radio', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
                                        )
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top:5),
                                          child: Container(

                                            child: Text('10:30 | Freedom Trail',style: TextStyle(color: HexColor('ACB1C0'))),
                                          )
                                      )
                                    ],
                                  )
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      right:10),
                                  child: Column(
                                    children: [

                                      Stack(
                                        children: [
                                          Positioned(
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage("graphics/girl1.png"),
                                                      fit: BoxFit.fill,
                                                    ),
                                                    borderRadius: BorderRadius.all(Radius.circular(10.0),)
                                                ),
                                                child: Container(
                                                  height: MediaQuery.of(context).size.height * 0.25,
                                                  width: MediaQuery.of(context).size.width *0.4,
                                                )
                                            ),
                                          ),
                                          // Positioned(
                                          //   bottom:10,
                                          //   child: Row(
                                          //     children: [
                                          //       Padding(
                                          //         padding: EdgeInsets.only(
                                          //             right:10, left:10),
                                          //         child: Image.asset('graphics/Avatar.png',),
                                          //       ),
                                          //       Padding(
                                          //         padding: EdgeInsets.only(
                                          //             right:10),
                                          //         child: Text('Matilda Cross', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                          //       )
                                          //
                                          //     ],
                                          //   ),
                                          // )
                                        ],
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top:5),
                                          child: Container(

                                            child: Text('LIVE - On the Radio', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
                                          )
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top:5),
                                          child: Container(

                                            child: Text('10:30 | Freedom Trail',style: TextStyle(color: HexColor('ACB1C0'))),
                                          )
                                      )
                                    ],
                                  )
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      right:10),
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
                                                  height: MediaQuery.of(context).size.height * 0.25,
                                                  width: MediaQuery.of(context).size.width *0.4,
                                                )
                                            ),
                                          ),
                                          // Positioned(
                                          //   bottom:10,
                                          //   child: Row(
                                          //     children: [
                                          //       Padding(
                                          //         padding: EdgeInsets.only(
                                          //             right:10, left:10),
                                          //         child: Image.asset('graphics/Avatar.png',),
                                          //       ),
                                          //       Padding(
                                          //         padding: EdgeInsets.only(
                                          //             right:10),
                                          //         child: Text('Matilda Cross', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                          //       )
                                          //
                                          //     ],
                                          //   ),
                                          // )
                                        ],
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top:5),
                                          child: Container(

                                            child: Text('LIVE - On the Radio', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
                                          )
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top:5),
                                          child: Container(

                                            child: Text('10:30 | Freedom Trail',style: TextStyle(color: HexColor('ACB1C0'))),
                                          )
                                      )
                                    ],
                                  )
                              ),
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



class Events extends StatefulWidget {
  Events({Key key}) : super(key: key);

  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            width: double.infinity,
            color: HexColor('F7F8FA'),
            child: Padding(
              padding: EdgeInsets.only(
                  top:10, bottom:10),
              child: Container(
                color: Colors.white,
                child: Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top:10, bottom:30),
                    child: Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                                top:10, bottom:10),
                            child: Container(
                              width: double.infinity,
                              child: Text('Events', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 28),),
                            )
                        ),
                        Container(
                            color: Colors.white,
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(vertical: 0),
                            height:
                            (MediaQuery.of(context).size.height * 0.32),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(
                                        right:10),
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
                                                    height: MediaQuery.of(context).size.height * 0.25,
                                                    width: MediaQuery.of(context).size.width *0.4,
                                                  )
                                              ),
                                            ),
                                            // Positioned(
                                            //   bottom:10,
                                            //   child: Row(
                                            //     children: [
                                            //       Padding(
                                            //         padding: EdgeInsets.only(
                                            //             right:10, left:10),
                                            //         child: Image.asset('graphics/Avatar.png',),
                                            //       ),
                                            //       Padding(
                                            //         padding: EdgeInsets.only(
                                            //             right:10),
                                            //         child: Text('Matilda Cross', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                            //       )
                                            //
                                            //     ],
                                            //   ),
                                            // )
                                          ],
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top:5),
                                            child: Container(

                                              child: Text('LIVE - On the Radio', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
                                            )
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top:5),
                                            child: Container(

                                              child: Text('10:30 | Freedom Trail',style: TextStyle(color: HexColor('ACB1C0'))),
                                            )
                                        )
                                      ],
                                    )
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        right:10),
                                    child: Column(
                                      children: [

                                        Stack(
                                          children: [
                                            Positioned(
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage("graphics/girl1.png"),
                                                        fit: BoxFit.fill,
                                                      ),
                                                      borderRadius: BorderRadius.all(Radius.circular(10.0),)
                                                  ),
                                                  child: Container(
                                                    height: MediaQuery.of(context).size.height * 0.25,
                                                    width: MediaQuery.of(context).size.width *0.4,
                                                  )
                                              ),
                                            ),
                                            // Positioned(
                                            //   bottom:10,
                                            //   child: Row(
                                            //     children: [
                                            //       Padding(
                                            //         padding: EdgeInsets.only(
                                            //             right:10, left:10),
                                            //         child: Image.asset('graphics/Avatar.png',),
                                            //       ),
                                            //       Padding(
                                            //         padding: EdgeInsets.only(
                                            //             right:10),
                                            //         child: Text('Matilda Cross', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                            //       )
                                            //
                                            //     ],
                                            //   ),
                                            // )
                                          ],
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top:5),
                                            child: Container(

                                              child: Text('LIVE - On the Radio', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
                                            )
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top:5),
                                            child: Container(

                                              child: Text('10:30 | Freedom Trail',style: TextStyle(color: HexColor('ACB1C0'))),
                                            )
                                        )
                                      ],
                                    )
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        right:10),
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
                                                    height: MediaQuery.of(context).size.height * 0.25,
                                                    width: MediaQuery.of(context).size.width *0.4,
                                                  )
                                              ),
                                            ),
                                            // Positioned(
                                            //   bottom:10,
                                            //   child: Row(
                                            //     children: [
                                            //       Padding(
                                            //         padding: EdgeInsets.only(
                                            //             right:10, left:10),
                                            //         child: Image.asset('graphics/Avatar.png',),
                                            //       ),
                                            //       Padding(
                                            //         padding: EdgeInsets.only(
                                            //             right:10),
                                            //         child: Text('Matilda Cross', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                            //       )
                                            //
                                            //     ],
                                            //   ),
                                            // )
                                          ],
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top:5),
                                            child: Container(

                                              child: Text('LIVE - On the Radio', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
                                            )
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top:5),
                                            child: Container(

                                              child: Text('10:30 | Freedom Trail',style: TextStyle(color: HexColor('ACB1C0'))),
                                            )
                                        )
                                      ],
                                    )
                                ),
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