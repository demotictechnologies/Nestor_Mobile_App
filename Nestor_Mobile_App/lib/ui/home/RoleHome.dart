import 'package:flutter/material.dart';
import 'package:nestore/ui/chemist/chemistHome.dart';
import 'package:nestore/ui/guest/guestHome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RoleHome extends StatefulWidget {
  RoleHome({Key key}) : super(key: key);

  @override
  _RoleHomeState createState() => _RoleHomeState();
}

class _RoleHomeState extends State<RoleHome> {
 String role;

  void initState() {
    super.initState();
    getTermsAndCondition();
  }

  @override
  Widget build(BuildContext context) {
    return (role != null) ? role == 'User' ? GuestHome() : ChemistHome() : Container();
  }

  getTermsAndCondition() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      role = prefs.getString('role');
    });
  }
}
