import 'package:flutter/material.dart';
import 'package:nestore/ui/common/HexColor.dart';
import 'package:nestore/ui/common/chat_text_field.dart';

class SocialChat extends StatefulWidget {
  SocialChat({Key key}) : super(key: key);

  @override
  _SocialChatState createState() => _SocialChatState();
}

class _SocialChatState extends State<SocialChat> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: HexColor('F7F8FA'),
      body: Padding(
        padding: EdgeInsets.only(
            left: 0, right: 0, top:20),
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(
                    left: 10, right: 20, top:10, bottom:10),
                child: Row(
                  children: [
                    Expanded(
                        flex:1,
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              index=0;
                            });
                          },
                          child: Image.asset('graphics/backkey.png'),
                        )
                    ),
                    Expanded(
                      flex:6,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 20),
                        child: Text('Rosalie Gray', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),textAlign: TextAlign.center,),
                      ),
                    ),
                    Expanded(
                        flex:1,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Image.asset('graphics/3dot2.png'),
                        )
                    )
                  ],
                )
            ),
            Padding(
                padding: EdgeInsets.only(
                    left: 0, right: 0, top:0, bottom:0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.78,
                  color: Colors.white,
                  child: SingleChildScrollView(
                    physics: ScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 0, right: 0, top:10, bottom:0),
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: 1,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: 0, right: 0, top:0),
                              child: Container(),
                            );
                          }),
                    ),
                  ),
                )
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 5, right: 5, top:5),
              child: Row(
                children: [
                  Expanded(
                    child: Image.asset('graphics/pin.png', height: 20,),
                  ),
                  Expanded(
                    child: Image.asset('graphics/emoji.png'),
                  ),
                  Expanded(
                    flex:7,
                    child: ChatTextField(
                      placeholderText: 'Write a comment...',
                    ),
                  ),
                  Expanded(
                    child: Image.asset('graphics/send.png'),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}