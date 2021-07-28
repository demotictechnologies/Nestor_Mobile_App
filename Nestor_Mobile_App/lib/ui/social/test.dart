// import 'package:flutter/material.dart';
// import 'package:nestore/resources/app_color.dart';
// import 'package:nestore/ui/common/HexColor.dart';
// import 'package:nestore/ui/social/home.dart';
//
// class TestStore extends StatefulWidget {
//   TestStore({Key key}) : super(key: key);
//
//   @override
//   _StoreState createState() => _StoreState();
// }
//
// class _StoreState extends State<TestStore> {
//   final _scaffoldKey = GlobalKey<ScaffoldState>();
//   int index = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: index == 0 ? Container(
//           constraints: BoxConstraints.expand(),
//           decoration: BoxDecoration(
//             color: Color.fromARGB(255, 247, 248, 250),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Container(
//                 height: 289,
//                 child: Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     Positioned(
//                       left: 0,
//                       top: 0,
//                       right: 0,
//                       child: Image.asset(
//                         "assets/images/bg.png",
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     Positioned(
//                       left: 16,
//                       top: 50,
//                       right: 20,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           Container(
//                             height: 19,
//                             margin: EdgeInsets.only(right: 5),
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.stretch,
//                               children: [
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Container(
//                                     width: 9,
//                                     height: 17,
//                                     child: Image.asset(
//                                       "assets/images/icons---filled---menu.png",
//                                       fit: BoxFit.none,
//                                     ),
//                                   ),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Container(
//                                     width: 3,
//                                     height: 14,
//                                     margin: EdgeInsets.only(top: 5),
//                                     child: Image.asset(
//                                       "assets/images/icons---filled---menu-copy.png",
//                                       fit: BoxFit.none,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Container(
//                             height: 116,
//                             margin: EdgeInsets.only(left: 4, top: 92),
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.stretch,
//                               children: [
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Container(
//                                     width: 235,
//                                     height: 116,
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                                       children: [
//                                         Container(
//                                           height: 51,
//                                           margin: EdgeInsets.only(right: 18),
//                                           child: Row(
//                                             crossAxisAlignment: CrossAxisAlignment.stretch,
//                                             children: [
//                                               Align(
//                                                 alignment: Alignment.bottomLeft,
//                                                 child: Container(
//                                                   width: 52,
//                                                   height: 50,
//                                                   child: Stack(
//                                                     alignment: Alignment.center,
//                                                     children: [
//                                                       Positioned(
//                                                         left: 0,
//                                                         child: Image.asset(
//                                                           "assets/images/rectangle.png",
//                                                           fit: BoxFit.none,
//                                                         ),
//                                                       ),
//                                                       Positioned(
//                                                         left: 32,
//                                                         bottom: 0,
//                                                         child: Image.asset(
//                                                           "assets/images/group.png",
//                                                           fit: BoxFit.none,
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ),
//                                               Expanded(
//                                                 flex: 1,
//                                                 child: Container(
//                                                   margin: EdgeInsets.only(left: 13),
//                                                   child: Column(
//                                                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                                                     children: [
//                                                       Align(
//                                                         alignment: Alignment.topRight,
//                                                         child: Text(
//                                                           "Catherine Lynch",
//                                                           textAlign: TextAlign.left,
//                                                           style: TextStyle(
//                                                             color: AppColors.primaryText,
//                                                             fontFamily: "SF UI Display",
//                                                             fontWeight: FontWeight.w700,
//                                                             fontSize: 20,
//                                                             letterSpacing: 0.22857,
//                                                             height: 1.4,
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       Spacer(),
//                                                       Align(
//                                                         alignment: Alignment.topLeft,
//                                                         child: Container(
//                                                           width: 82,
//                                                           child: Text(
//                                                             "@jorgecutis",
//                                                             textAlign: TextAlign.left,
//                                                             style: TextStyle(
//                                                               color: AppColors.primaryText,
//                                                               fontFamily: "",
//                                                               fontWeight: FontWeight.w400,
//                                                               fontSize: 13,
//                                                               letterSpacing: 0.32,
//                                                               height: 1.38462,
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         Expanded(
//                                           flex: 1,
//                                           child: Container(
//                                             margin: EdgeInsets.only(top: 23, right: 57),
//                                             child: Row(
//                                               crossAxisAlignment: CrossAxisAlignment.stretch,
//                                               children: [
//                                                 Container(
//                                                   width: 54,
//                                                   child: Stack(
//                                                     alignment: Alignment.center,
//                                                     children: [
//                                                       Positioned(
//                                                         left: 0,
//                                                         bottom: 0,
//                                                         child: Text(
//                                                           "Following",
//                                                           textAlign: TextAlign.left,
//                                                           style: TextStyle(
//                                                             color: AppColors.primaryText,
//                                                             fontFamily: "",
//                                                             fontWeight: FontWeight.w400,
//                                                             fontSize: 11,
//                                                             letterSpacing: 0.23467,
//                                                             height: 1.81818,
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       Positioned(
//                                                         left: 0,
//                                                         top: 0,
//                                                         child: Text(
//                                                           "128",
//                                                           textAlign: TextAlign.left,
//                                                           style: TextStyle(
//                                                             color: AppColors.primaryText,
//                                                             fontFamily: "SF UI Display",
//                                                             fontWeight: FontWeight.w700,
//                                                             fontSize: 13,
//                                                             letterSpacing: 0.24471,
//                                                             height: 1.53846,
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                   width: 50,
//                                                   margin: EdgeInsets.only(left: 21, top: 1),
//                                                   child: Stack(
//                                                     alignment: Alignment.center,
//                                                     children: [
//                                                       Positioned(
//                                                         left: 0,
//                                                         top: 0,
//                                                         child: Text(
//                                                           "3120",
//                                                           textAlign: TextAlign.left,
//                                                           style: TextStyle(
//                                                             color: AppColors.primaryText,
//                                                             fontFamily: "SF UI Display",
//                                                             fontWeight: FontWeight.w700,
//                                                             fontSize: 13,
//                                                             letterSpacing: 0.24471,
//                                                             height: 1.53846,
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       Positioned(
//                                                         left: 0,
//                                                         bottom: 0,
//                                                         child: Text(
//                                                           "Follower",
//                                                           textAlign: TextAlign.left,
//                                                           style: TextStyle(
//                                                             color: AppColors.primaryText,
//                                                             fontFamily: "",
//                                                             fontWeight: FontWeight.w400,
//                                                             fontSize: 11,
//                                                             letterSpacing: 0.23467,
//                                                             height: 1.81818,
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                                 Spacer(),
//                                                 Container(
//                                                   width: 34,
//                                                   margin: EdgeInsets.symmetric(vertical: 1),
//                                                   child: Stack(
//                                                     alignment: Alignment.center,
//                                                     children: [
//                                                       Positioned(
//                                                         right: 0,
//                                                         bottom: 0,
//                                                         child: Text(
//                                                           "Likes",
//                                                           textAlign: TextAlign.left,
//                                                           style: TextStyle(
//                                                             color: AppColors.primaryText,
//                                                             fontFamily: "",
//                                                             fontWeight: FontWeight.w400,
//                                                             fontSize: 11,
//                                                             letterSpacing: 0.23467,
//                                                             height: 1.81818,
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       Positioned(
//                                                         top: 0,
//                                                         right: 0,
//                                                         child: Text(
//                                                           "5024",
//                                                           textAlign: TextAlign.left,
//                                                           style: TextStyle(
//                                                             color: AppColors.primaryText,
//                                                             fontFamily: "SF UI Display",
//                                                             fontWeight: FontWeight.w700,
//                                                             fontSize: 13,
//                                                             letterSpacing: 0.24471,
//                                                             height: 1.53846,
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Container(
//                                     width: 36,
//                                     height: 36,
//                                     margin: EdgeInsets.only(top: 77),
//                                     decoration: BoxDecoration(
//                                       gradient: Gradients.primaryGradient,
//                                       boxShadow: [
//                                         Shadows.secondaryShadow,
//                                       ],
//                                       borderRadius: Radii.k18pxRadius,
//                                     ),
//                                     child: Column(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                                       children: [
//                                         Container(
//                                           height: 23,
//                                           margin: EdgeInsets.only(left: 6, right: 7),
//                                           child: Image.asset(
//                                             "assets/images/icons---filled---crown.png",
//                                             fit: BoxFit.none,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 height: 55,
//                 child: Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     Positioned(
//                       left: 0,
//                       top: 0,
//                       right: 0,
//                       child: Container(
//                         height: 55,
//                         decoration: BoxDecoration(
//                           color: AppColors.primaryElement,
//                           boxShadow: [
//                             Shadows.primaryShadow,
//                           ],
//                         ),
//                         child: Container(),
//                       ),
//                     ),
//                     Positioned(
//                       left: 0,
//                       top: 0,
//                       right: 0,
//                       child: Stack(
//                         alignment: Alignment.center,
//                         children: [
//                           Positioned(
//                             left: 0,
//                             right: 0,
//                             child: Image.asset(
//                               "assets/images/background.png",
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           Positioned(
//                             left: 15,
//                             top: 15,
//                             right: -44,
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.stretch,
//                               children: [
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Container(
//                                     width: 59,
//                                     child: Text(
//                                       "Photos",
//                                       textAlign: TextAlign.left,
//                                       style: TextStyle(
//                                         color: AppColors.accentText,
//                                         fontFamily: "",
//                                         fontWeight: FontWeight.w400,
//                                         fontSize: 17,
//                                         letterSpacing: 0.32,
//                                         height: 1.29412,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Container(
//                                     width: 56,
//                                     margin: EdgeInsets.only(left: 22),
//                                     child: Text(
//                                       "Videos",
//                                       textAlign: TextAlign.left,
//                                       style: TextStyle(
//                                         color: AppColors.secondaryText,
//                                         fontFamily: "",
//                                         fontWeight: FontWeight.w400,
//                                         fontSize: 17,
//                                         letterSpacing: 0.32,
//                                         height: 1.29412,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Container(
//                                     width: 47,
//                                     margin: EdgeInsets.only(right: 24),
//                                     child: Text(
//                                       "Posts",
//                                       textAlign: TextAlign.left,
//                                       style: TextStyle(
//                                         color: AppColors.secondaryText,
//                                         fontFamily: "",
//                                         fontWeight: FontWeight.w400,
//                                         fontSize: 17,
//                                         letterSpacing: 0.32,
//                                         height: 1.29412,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Container(
//                                     width: 61,
//                                     margin: EdgeInsets.only(right: 21),
//                                     child: Text(
//                                       "Friends",
//                                       textAlign: TextAlign.left,
//                                       style: TextStyle(
//                                         color: AppColors.secondaryText,
//                                         fontFamily: "",
//                                         fontWeight: FontWeight.w400,
//                                         fontSize: 17,
//                                         letterSpacing: 0.32,
//                                         height: 1.29412,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Container(
//                                     width: 88,
//                                     child: Text(
//                                       "Collections",
//                                       textAlign: TextAlign.left,
//                                       style: TextStyle(
//                                         color: AppColors.secondaryText,
//                                         fontFamily: "",
//                                         fontWeight: FontWeight.w400,
//                                         fontSize: 17,
//                                         letterSpacing: 0.32,
//                                         height: 1.29412,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 flex: 1,
//                 child: Row(children: [
//                   Expanded(child: Container(margin: const EdgeInsets.only(left: 5.0, right: 5.0) ,child:Image.asset('assets/images/bg.png')),),
//                   Expanded(child: Container(margin: const EdgeInsets.only(left: 5.0, right: 5.0) ,child:Image.asset('assets/images/bg.png')),),
//                   Expanded(child: Container(margin: const EdgeInsets.only(left: 5.0, right: 5.0) ,child:Image.asset('assets/images/bg.png')),),
//                 ],)
//                 ),
//                 Expanded(
//                 flex: 1,
//                 child: Row(children: [
//                   Expanded(child: Container(margin: const EdgeInsets.only(left: 5.0, right: 5.0) ,child:Image.asset('assets/images/bg.png')),),
//                   Expanded(child: Container(margin: const EdgeInsets.only(left: 5.0, right: 5.0) ,child:Image.asset('assets/images/bg.png')),),
//                   Expanded(child: Container(margin: const EdgeInsets.only(left: 5.0, right: 5.0) ,child:Image.asset('assets/images/bg.png')),),
//                 ],)
//                 ),
//                 Expanded(
//                 flex: 1,
//                 child: Row(children: [
//                   Expanded(child: Container(margin: const EdgeInsets.only(left: 5.0, right: 5.0) ,child:Image.asset('assets/images/bg.png')),),
//                   Expanded(child: Container(margin: const EdgeInsets.only(left: 5.0, right: 5.0) ,child:Image.asset('assets/images/bg.png')),),
//                   Expanded(child: Container(margin: const EdgeInsets.only(left: 5.0, right: 5.0) ,child:Image.asset('assets/images/bg.png')),),
//                 ],)
//                 ),
//             ],
//           ),
//         ):SocialHome(),bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.white,
//         selectedItemColor: HexColor('FF2D55'),
//         currentIndex: index,
//         type: BottomNavigationBarType.fixed,
//         items: [
//           new BottomNavigationBarItem(
//               icon: GestureDetector(
//                 onTap:(){
//                   print('callled');
//                   setState(() {
//                     index = 0;
//                   });
//                 },
//                 child: Image(
//                   image: AssetImage('graphics/home.png'),
//                   width: 30,
//                   height: 30,
//                 ),
//               ),
//               title: GestureDetector(
//                 onTap:(){
//                   print('called');
//                   setState(() {
//                     index = 0;
//                   });
//                 },
//                 child: Text('Home', style: TextStyle(fontSize: 12)),
//               )
//           ),
//           new BottomNavigationBarItem(
//             icon: Image(
//               image: AssetImage('graphics/stream.png'),
//               width: 30,
//               height: 30,
//             ),
//             title: Text('Streams', style: TextStyle(fontSize: 12)),
//           ),
//           new BottomNavigationBarItem(
//             icon: GestureDetector(
//               onTap:(){
//                 setState(() {
//                   index=2;
//                 });
//               },
//               child: Image(
//                 image: AssetImage('graphics/messagesTab.png'),
//                 width: 30,
//                 height: 30,
//               ),
//             ),
//             title: GestureDetector(
//               onTap:(){
//                 setState(() {
//                   index=2;
//                 });
//               },
//               child: Text('Messages', style: TextStyle(fontSize: 12)),
//             )
//           ),
//           new BottomNavigationBarItem(
//             icon: Image(
//               image: AssetImage('graphics/alert.png'),
//               width: 30,
//               height: 30,
//             ),
//             title: Text('Notifications', style: TextStyle(fontSize: 12),),
//           ),
//           new BottomNavigationBarItem(
//             icon: GestureDetector(
//                 onTap: (){
//                   print('clicked');
//                   setState(() {
//
//                     index=4;
//                   });
//                 },
//                 child: Image(
//                   image: AssetImage('graphics/sidemenu.png'),
//                   width: 30,
//                   height: 30,
//                 )
//             ),
//
//             title: Text('Menu' ,style: TextStyle(fontSize: 12)),
//           ),
//         ],
//       ),
//
//       );
//   }
// }
// class Shadows {
//   static const BoxShadow primaryShadow = BoxShadow(
//     color: Color.fromARGB(51, 172, 177, 192),
//     offset: Offset(0, 1),
//     blurRadius: 2,
//   );
//   static const BoxShadow secondaryShadow = BoxShadow(
//     color: Color.fromARGB(128, 0, 0, 0),
//     offset: Offset(0, 5),
//     blurRadius: 10,
//   );
// }
//
// class Gradients {
//   static const Gradient primaryGradient = LinearGradient(
//     begin: Alignment(0.85031, 0.14838),
//     end: Alignment(0.20654, 0.882),
//     stops: [
//       0,
//       1,
//     ],
//     colors: [
//       Color.fromARGB(255, 255, 145, 106),
//       Color.fromARGB(255, 255, 63, 100),
//     ],
//   );
// }
//
// class Radii {
//   static const BorderRadiusGeometry k18pxRadius = BorderRadius.all(Radius.circular(18));
// }