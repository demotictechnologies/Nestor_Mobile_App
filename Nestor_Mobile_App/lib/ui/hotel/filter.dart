import 'package:flutter/material.dart';
import 'package:nestore/ui/common/HexColor.dart';
import 'package:nestore/ui/social/search_screen.dart';

class HotelFilter extends StatefulWidget {
  HotelFilter({Key key}) : super(key: key);

  @override
  _HotelFilterState createState() => _HotelFilterState();
}

class _HotelFilterState extends State<HotelFilter> {
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
                      child: Text('Filter your search', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                    )
                ),

                Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top:40),
                    child: Container(
                      width: double.infinity,
                      child: Text('Categories', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                    )
                ),

                Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top:40),
                    child:Row(
                      children: [
                        Expanded(
                          flex:1,
                          child:  Container(
                              decoration: BoxDecoration(
                                  color: HexColor('EAEAEB'),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  )
                              ),
                              margin: EdgeInsets.symmetric(horizontal: 5),

                              width: double.infinity,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top:10, bottom: 10),
                              child: Text('All', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),textAlign: TextAlign.center,),
                            )
                          ),
                        ),
                        Expanded(
                          flex:1,
                          child:  Container(
                            decoration: BoxDecoration(
                                color: HexColor('EAEAEB'),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                            )
                            ),
                              margin: EdgeInsets.symmetric(horizontal: 5),

                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top:10, bottom: 10),
                                child: Text('Breakfast', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),textAlign: TextAlign.center),
                              )
                          ),
                        ),
                        Expanded(
                          flex:1,
                          child:  Container(
                              decoration: BoxDecoration(
                                  color: HexColor('EAEAEB'),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  )
                              ),
                              margin: EdgeInsets.symmetric(horizontal: 5),

                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top:10, bottom: 10),
                                child: Text('Lunch', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),textAlign: TextAlign.center),
                              )
                          ),
                        ),
                        Expanded(
                          flex:1,
                          child:  Container(
                              decoration: BoxDecoration(
                                  color: HexColor('EAEAEB'),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  )
                              ),
                              margin: EdgeInsets.symmetric(horizontal: 5),

                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top:10, bottom: 10),
                                child: Text('Dinner', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),textAlign: TextAlign.center),
                              )
                          ),
                        ),
                      ],
                    )
                ),
                Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top:10),
                    child:Row(
                      children: [
                        Expanded(
                          flex:2,
                          child:  Container(
                              decoration: BoxDecoration(
                                  color: HexColor('EAEAEB'),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  )
                              ),
                              margin: EdgeInsets.symmetric(horizontal: 5),

                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 5, right: 5, top:10, bottom: 10),
                                child: Text('Burgers', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),textAlign: TextAlign.center,),
                              )
                          ),
                        ),
                        Expanded(
                          flex:2,
                          child:  Container(
                              decoration: BoxDecoration(
                                  color: HexColor('34C47C'),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  )
                              ),
                              margin: EdgeInsets.symmetric(horizontal: 5),

                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 5, right: 5, top:10, bottom: 10),
                                child: Text('Italian cuisine', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Colors.white),textAlign: TextAlign.center,),
                              )
                          ),
                        ),
                        Expanded(
                          flex:2,
                          child:  Container(
                              decoration: BoxDecoration(
                                  color: HexColor('EAEAEB'),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  )
                              ),
                              margin: EdgeInsets.symmetric(horizontal: 5),

                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 5, right: 5, top:10, bottom: 10),
                                child: Text('Pasta', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),textAlign: TextAlign.center),
                              )
                          ),
                        ),
                        Expanded(
                          flex:1,
                          child:  Container()
                        ),
                      ],
                    )
                ),

                Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top:10),
                    child:Row(
                      children: [
                        Expanded(
                          flex:1,
                          child:  Container(
                              decoration: BoxDecoration(
                                  color: HexColor('EAEAEB'),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  )
                              ),
                              margin: EdgeInsets.symmetric(horizontal: 5),

                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top:10, bottom: 10),
                                child: Text('Chinese', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),textAlign: TextAlign.center,),
                              )
                          ),
                        ),
                        Expanded(
                          flex:1,
                          child:  Container(
                              decoration: BoxDecoration(
                                  color: HexColor('EAEAEB'),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  )
                              ),
                              margin: EdgeInsets.symmetric(horizontal: 5),

                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top:10, bottom: 10),
                                child: Text('Pizza', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),textAlign: TextAlign.center),
                              )
                          ),
                        ),
                        Expanded(
                          flex:1,
                          child:  Container(
                              decoration: BoxDecoration(
                                  color: HexColor('EAEAEB'),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  )
                              ),
                              margin: EdgeInsets.symmetric(horizontal: 5),

                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top:10, bottom: 10),
                                child: Text('Salad', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),textAlign: TextAlign.center),
                              )
                          ),
                        ),
                        Expanded(
                          flex:1,
                          child:  Container(
                              decoration: BoxDecoration(
                                  color: HexColor('EAEAEB'),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  )
                              ),
                              margin: EdgeInsets.symmetric(horizontal: 5),

                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top:10, bottom: 10),
                                child: Text('Soups', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),textAlign: TextAlign.center),
                              )
                          ),
                        ),
                      ],
                    )
                ),

                Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top:40),
                    child: Container(
                      width: double.infinity,
                      child: Text('Type of food', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                    )
                ),
                Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top:10),
                    child:Row(
                      children: [
                        Expanded(
                          flex:2,
                          child:  Container(
                              decoration: BoxDecoration(
                                  color: HexColor('EAEAEB'),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  )
                              ),
                              margin: EdgeInsets.symmetric(horizontal: 5),

                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 5, right: 5, top:10, bottom: 10),
                                child: Text('Any', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),textAlign: TextAlign.center,),
                              )
                          ),
                        ),
                        Expanded(
                          flex:2,
                          child:  Container(
                              decoration: BoxDecoration(
                                  color: HexColor('34C47C'),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  )
                              ),
                              margin: EdgeInsets.symmetric(horizontal: 5),

                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 5, right: 5, top:10, bottom: 10),
                                child: Text('Vegetarian', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Colors.white),textAlign: TextAlign.center,),
                              )
                          ),
                        ),
                        Expanded(
                          flex:2,
                          child:  Container(
                              decoration: BoxDecoration(
                                  color: HexColor('EAEAEB'),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  )
                              ),
                              margin: EdgeInsets.symmetric(horizontal: 5),

                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 5, right: 5, top:10, bottom: 10),
                                child: Text('Vegan', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),textAlign: TextAlign.center),
                              )
                          ),
                        ),
                        Expanded(
                            flex:1,
                            child:  Container()
                        ),
                      ],
                    )
                ),
                Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top:40),
                    child: Container(
                      width: double.infinity,
                      child: Text('Price range', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                    )
                ),
                Container(
                  width:double.infinity,
                  child: Padding(
                      padding: EdgeInsets.only(
                          top:  MediaQuery.of(context).size.height * 0.12, bottom: 0, left: 20, right: 20),
                      child: RawMaterialButton(
                        onPressed: () {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => DeliveryPage(),
                          //   ),
                          // );
                        },

                        elevation: 2.0,
                        fillColor: HexColor('34C47C'),
                        child: Text('Apply Filters', style: TextStyle(color: Colors.white),),
                        padding: EdgeInsets.all(15.0),

                      )
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top:40),
                    child: Container(
                      width: double.infinity,
                      child: Text('Clear filters', style: TextStyle( fontSize: 16),textAlign: TextAlign.center,),
                    )
                ),
              ],
            )
        ),
      ),
    );
  }
}