import 'package:flutter/material.dart';
import 'package:nestore/bloc/auth_bloc.dart';
import 'package:nestore/ui/home/home.dart';
import 'package:nestore/ui/onboarding/kitchen_landing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    authBloc.restoreSession();
    return MaterialApp(
      title: 'Nestore',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: showRootScreen(),
    );
  }
  Widget showRootScreen() {
    return StreamBuilder<bool>(
        stream: authBloc.isSessionValid,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data) {
            print("going home have data");
            return CommonHome();
          } else {
            print("back to login");
            return SignUpPage();
          }
        });
  }
}
class SignUpPage extends StatelessWidget {
  final GlobalKey<NavigatorState> _key = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Navigator(
        key: _key,
        initialRoute: 'kitchen/',
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          print('navigator ==+++++>' + settings.name);
          switch (settings.name) {
            case 'kitchen/':
              builder = (BuildContext _) => KitchenPage();
              break;
            default:
              throw Exception('Invalid route: ${settings.name}');
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        },
      ),
    );
  }
}
