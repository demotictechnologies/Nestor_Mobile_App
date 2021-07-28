import 'package:flutter/material.dart';
import 'package:nestore/ui/common/HexColor.dart';
import 'package:nestore/ui/home/home.dart';

class SuccessLogin extends StatefulWidget {
  bool data;
  SuccessLogin({Key key, this.data}) : super(key: key);

  @override
  _SuccessLoginState createState() => _SuccessLoginState();
}

class _SuccessLoginState extends State<SuccessLogin> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();


  Future<void> initState() {
    super.initState();
    redirectToHome();
  }

  redirectToHome() async{
    await Future<void>.delayed(const Duration(seconds: 1));
    if(this.widget.data) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CommonHome(),
        ),
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CommonHome(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: HexColor('34C47C'),
      body: Align(
        alignment: Alignment.center,
        child: Image.asset('graphics/success.png'),
      )
    );
  }
}