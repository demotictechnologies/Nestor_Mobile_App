import 'package:flutter/material.dart';
import 'package:nestore/ui/common/HexColor.dart';
import 'package:nestore/ui/common/hotel_text_field.dart';
import 'package:nestore/ui/social/search_screen.dart';

class HotelTopCategories extends StatefulWidget {
  HotelTopCategories({Key key}) : super(key: key);

  @override
  _HotelTopCategoriesState createState() => _HotelTopCategoriesState();
}

class _HotelTopCategoriesState extends State<HotelTopCategories> {
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
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Image.asset('graphics/hotel_menu.png'),
                          )
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
                      child: Text('What would you', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                    )
                ),
                Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top:0),
                    child: Container(
                      width: double.infinity,
                      child: Text('like to eat?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
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
                                      builder: (context) => SocialSearch(),
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
                TopCategories(),
                MoreCategories()
              ],
            )
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
