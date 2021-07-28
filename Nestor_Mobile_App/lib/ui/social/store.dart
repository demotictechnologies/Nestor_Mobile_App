import 'package:flutter/material.dart';
import 'package:nestore/ui/common/HexColor.dart';
import 'package:nestore/ui/common/page_transition.dart';
import 'package:nestore/ui/social/gear_menu.dart';
import 'package:nestore/ui/social/submenu.dart';

class Store extends StatefulWidget {
  Store({Key key}) : super(key: key);

  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
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
                left: 0, right: 0, top:0),
            child: Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top:30),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap:(){
                              Navigator.push(context, SlideRightRoute(page: SubMainMenu()));
                            },
                            child: Padding(
                                padding: EdgeInsets.only(
                                    left: 0, right: 0, top:0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Icon(Icons.menu),
                                )
                            ),
                          )
                        ),
                        Expanded(
                          flex:5,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 0, right: 0, top:0),
                            child: Text('Store', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),textAlign: TextAlign.center,),
                          ),
                        ),


                        Expanded(
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 0, right: 0, top:0),
                              child: Align(
                                  alignment: Alignment.topRight,
                                  child: Icon(Icons.search, color: Colors.black,)
                              )
                          ),
                        ),
                        Expanded(
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 0, right: 0, top:0),
                              child: GestureDetector(
                                onTap:(){

                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => GearMenu(),
                                    ),
                                  );
                                },
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Icon(Icons.settings),
                                )
                              )
                          ),
                        ),
                      ],
                    )
                ),
                TopCategories(),
                MoreCategories()
              ],
            )
        ),
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





class TopCategories extends StatefulWidget {
  TopCategories({Key key}) : super(key: key);

  @override
  _TopCategoriesState createState() => _TopCategoriesState();
}

class _TopCategoriesState extends State<TopCategories> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(
                  top:10, bottom:0),
              child: Container(
                color: Colors.white,
                child: Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top:10, bottom:0),
                    child: Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                                top:10, bottom:10),
                            child: Container(
                              width: double.infinity,
                              child: Text('Top Categories', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 28),),
                            )
                        ),
                        Container(
                            color: Colors.white,
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(vertical: 0),
                            child:GridView.count(
                                crossAxisCount: 2,
                                crossAxisSpacing: 0,
                                mainAxisSpacing: 0,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                childAspectRatio: MediaQuery.of(context).size.height <=
                                    680
                                    ? 0.9
                                    : MediaQuery.of(context).size.height <=
                                    692
                                    ? 0.9
                                    : MediaQuery.of(context).size.height <=
                                    700
                                    ? 0.95
                                    : MediaQuery.of(context).size.height <=
                                    750
                                    ? 0.95
                                    : MediaQuery.of(context).size.height <=
                                    800
                                    ? 0.9
                                    : MediaQuery.of(context)
                                    .size
                                    .height <=
                                    850
                                    ? 0.9
                                    : MediaQuery.of(context)
                                    .size
                                    .height <=
                                    900
                                    ? 0.95
                                    : MediaQuery.of(context)
                                    .size
                                    .height <=
                                    950
                                    ? 0.95
                                    : MediaQuery.of(context).size.height <=
                                    1000
                                    ? 0.1
                                    : MediaQuery.of(context).size.height >
                                    1000
                                    ? 1
                                    : 1,
                                physics: ClampingScrollPhysics(),
                                children: List.generate(
                                    7,
                                        (index) {
                                      return GestureDetector(
                                        child: Padding(
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
                                                            height: MediaQuery.of(context).size.height * 0.2,
                                                            width: MediaQuery.of(context).size.width *0.4,
                                                          )
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        top:5),
                                                    child: Container(
                                                        width: MediaQuery.of(context).size.width *0.4,
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                              child: Text('Italian', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
                                                            ),
                                                            Expanded(
                                                              flex:2,
                                                              child: Text('(24)', style: TextStyle(color: HexColor('1A1824'), fontSize: 16),),
                                                            )
                                                          ],
                                                        )
                                                    )
                                                ),
                                              ],
                                            )
                                        ),
                                      );
                                    })
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



class MoreCategories extends StatefulWidget {
  MoreCategories({Key key}) : super(key: key);

  @override
  _MoreCategoriesState createState() => _MoreCategoriesState();
}

class _MoreCategoriesState extends State<MoreCategories> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(
                  top:0, bottom:0),
              child: Container(
                color: Colors.white,
                child: Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top:0, bottom:0),
                    child: Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                                top:0, bottom:0),
                            child: Container(
                              width: double.infinity,
                              child: Text('More Categories', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 28),),
                            )
                        ),
                        Container(
                            color: Colors.white,
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(vertical: 0),
                            child:GridView.count(
                                crossAxisCount: 2,
                                crossAxisSpacing: 0,
                                mainAxisSpacing: 0,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                childAspectRatio: MediaQuery.of(context).size.height <=
                                    680
                                    ? 0.9
                                    : MediaQuery.of(context).size.height <=
                                    692
                                    ? 0.9
                                    : MediaQuery.of(context).size.height <=
                                    700
                                    ? 0.95
                                    : MediaQuery.of(context).size.height <=
                                    750
                                    ? 0.95
                                    : MediaQuery.of(context).size.height <=
                                    800
                                    ? 0.9
                                    : MediaQuery.of(context)
                                    .size
                                    .height <=
                                    850
                                    ? 0.9
                                    : MediaQuery.of(context)
                                    .size
                                    .height <=
                                    900
                                    ? 0.95
                                    : MediaQuery.of(context)
                                    .size
                                    .height <=
                                    950
                                    ? 0.95
                                    : MediaQuery.of(context).size.height <=
                                    1000
                                    ? 0.1
                                    : MediaQuery.of(context).size.height >
                                    1000
                                    ? 1
                                    : 1,
                                physics: ClampingScrollPhysics(),
                                children: List.generate(
                                    7,
                                        (index) {
                                      return GestureDetector(
                                        child: Padding(
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
                                                            height: MediaQuery.of(context).size.height * 0.2,
                                                            width: MediaQuery.of(context).size.width *0.4,
                                                          )
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        top:5),
                                                    child: Container(
                                                        width: MediaQuery.of(context).size.width *0.4,
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                              child: Text('Italian', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
                                                            ),
                                                            Expanded(
                                                              flex:2,
                                                              child: Text('(24)', style: TextStyle(color: HexColor('1A1824'), fontSize: 16),),
                                                            )
                                                          ],
                                                        )
                                                    )
                                                ),
                                              ],
                                            )
                                        ),
                                      );
                                    })
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
