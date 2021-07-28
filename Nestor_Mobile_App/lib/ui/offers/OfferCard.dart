import 'package:flutter/material.dart';

class OfferCard extends StatefulWidget {
  OfferCard({Key key}) : super(key: key);

  @override
  _OfferCardState createState() => _OfferCardState();
}

class _OfferCardState extends State<OfferCard> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[100], width:1)
        ),
        child: Padding(
            padding: EdgeInsets.only(top:25, bottom:10, left:0, right: 0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(

                        child: CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQx-YHTYySZO4IHxlF8acRE_nt3T3NHSOPjoQ&usqp=CAU')
                        )
                    ),
                    Expanded(
                        flex:4,
                        child: Container(
                            child: Text('FLAT 20% OFF on Your First Meds* Order + 20% NMS SuperCash', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16))
                        )
                    ),

                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        flex:1,
                        child:Container()
                    ),
                    Expanded(
                        flex:4,
                        child: Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(top:10, bottom:5, left:0, right: 5),
                                child: Container(
                                    child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQx-YHTYySZO4IHxlF8acRE_nt3T3NHSOPjoQ&usqp=CAU', )
                                )
                            ),
                            Padding(
                                padding: EdgeInsets.only(top:2, bottom:5, left:0, right: 5),
                                child: Container(
                                  width: double.infinity,
                                  child: Text('From 01st to 30th April 2021, get Flat 20% OFF* on your First Pre-Paid/COD Medicine order, AND upon delivery, a 20% NMS SuperCash* on "Pre-Paid" medicine order. *No min. order required. *T&C', style: TextStyle(color:Colors.grey,fontWeight: FontWeight.w400, fontSize: 12)),
                                )
                            ),
                          ],
                        )
                    )
                  ],
                )
              ],
            )
        )
    );
  }
}