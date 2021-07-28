
import 'package:flutter/material.dart';
import 'package:nestore/ui/offers/OfferCard.dart';

class OffersList extends StatefulWidget {
  OffersList({Key key}) : super(key: key);

  @override
  _OffersListState createState() => _OffersListState();
}

class _OffersListState extends State<OffersList> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom:10, top:10, left:10, right:10),
        child: Container(
            color: Colors.white,
            child: Column(
              children: [
                OfferCard(),
                OfferCard(),
                OfferCard(),
                OfferCard(),
                OfferCard(),
              ],
            )
        )
    );
  }
}