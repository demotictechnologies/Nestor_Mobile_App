import 'package:flutter/material.dart';
import 'package:nestore/ui/chemist/orderHistory.dart';
import 'package:nestore/ui/home/InnerHeader.dart';

class SideOrder extends StatefulWidget {
  SideOrder({Key key}) : super(key: key);

  @override
  _HotelHomeState createState() => _HotelHomeState();
}

class _HotelHomeState extends State<SideOrder> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight( MediaQuery.of(context).size.height*0.11),
        child: InnerHeader(),
      ),
      body: OrderHistoryPage(),
    );
  }

}
