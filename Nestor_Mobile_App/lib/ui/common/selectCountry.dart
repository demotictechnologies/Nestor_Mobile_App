import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';

class CountryCode extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<CountryCode> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Country Code Pick'),
        ),
        body: Center(
          child: CountryListPick(
            appBar: AppBar(
              backgroundColor: Colors.amber,
              title: Text('Select Country'),
            ),
            theme: CountryTheme(
              isShowFlag: true,
              isShowTitle: false,
              isShowCode: true,
              isDownIcon: false,
              showEnglishName: true,
            ),
            initialSelection: '+62',
            onChanged: (code) {
              print(code.name);
              print(code.code);
              print(code.dialCode);
              print(code.flagUri);
            },
          ),
        ),
      ),
    );
  }
}