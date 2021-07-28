import 'package:flutter/material.dart';
import 'package:nestore/ui/common/HexColor.dart';
import 'package:nestore/ui/social/chat.dart';

class SocialNotification extends StatefulWidget {
  SocialNotification({Key key}) : super(key: key);

  @override
  _SocialNotificationState createState() => _SocialNotificationState();
}

class _SocialNotificationState extends State<SocialNotification> {
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
                              child: Image.asset('graphics/backkey.png'),
                            )
                        ),
                        Expanded(
                          flex:6,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 20),
                            child: Text('Notifications', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),textAlign: TextAlign.center,),
                          ),
                        ),
                        Expanded(
                            flex:1,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Container()
                            )
                        )
                      ],
                    )
                ),
                Padding(
                    padding: EdgeInsets.only(
                        left: 0, right: 0, top:10, bottom:5),
                    child: Container(
                        color: HexColor('F7F8FA'),
                        width: double.infinity,
                        child:  Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top:10, bottom:20),
                                child: Container(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(

                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(Radius.circular(10.0),)
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top:10, bottom:10),
                                            child: Text('Posts', textAlign: TextAlign.center,),
                                          )
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                            color: HexColor('F1F2F6'),


                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top:10, bottom:10),
                                            child: Text('Photos', textAlign: TextAlign.center,),
                                          )
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: HexColor('F1F2F6'),
                                                borderRadius: BorderRadius.only(bottomRight:
                                                Radius
                                                    .circular(
                                                    10),
                                                  topRight:
                                                  Radius
                                                      .circular(
                                                      10),)
                                            ),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top:10, bottom:10),
                                            child: Text('Friends', textAlign: TextAlign.center,),
                                          )
                                        ),
                                      )
                                    ],
                                  )
                                )
                            ),
                          ],
                        )
                    )
                ),
                Padding(
                    padding: EdgeInsets.only(
                        left: 0, right: 0, top:0, bottom:0),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 0, right: 0, top:0, bottom:0),
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => SocialChat(),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 0, right: 0, top:0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex:1,
                                          child: Image.asset('graphics/Avatar.png',height: 90,)
                                      ),
                                      Expanded(
                                        flex:5,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  //                   <--- left side
                                                  color: HexColor('EAECEF'),
                                                  width: 1.0,
                                                ),
                                              )
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    flex:2,
                                                    child: Container(
                                                      width: double.infinity,
                                                      child: Text('Jimmy Nilson followed you', textAlign: TextAlign.start, style: TextStyle(fontSize: 16),),
                                                    ),
                                                  ),

                                                ],
                                              ),
                                              Container(
                                                  width: double.infinity,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 0, right: 0, top:10, bottom:10),
                                                    child: Text("2 hours ago", textAlign: TextAlign.start,style: TextStyle(color: HexColor('ACB1C0')),),
                                                  )
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    )
                )
              ],
            ),
          )
      ),
    );
  }
}