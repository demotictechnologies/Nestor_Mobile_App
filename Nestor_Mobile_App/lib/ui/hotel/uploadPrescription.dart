import 'package:flutter/material.dart';
import 'package:nestore/resources/app_color.dart';

class UploadPrescription extends StatefulWidget {
  UploadPrescription({Key key}) : super(key: key);

  @override
  _HotelHomeState createState() => _HotelHomeState();
}

class _HotelHomeState extends State<UploadPrescription> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(
                left: 10, right:10, top:0, bottom:0),
            child: Column(
              children: [

                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.all(
                        Radius.circular(10.0),
                      )),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: MediaQuery.of(context).size.height * 0.03),
                      child: Column(
                        children: [

                          Padding(
                              padding: EdgeInsets.only(top:MediaQuery.of(context).size.height * 0.001),
                              child: Container(
                                  width: double.infinity,
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom:10, left:10),
                                    child: Text('Attach Prescription',style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),),
                                  )
                              )
                          ),
                          Container(
                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 15, bottom: 0, left: 10, right: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 5, bottom: 0, left: 10, right: 10),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  color: AppColors.primaryColor,
                                                  borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(25.0)),
                                                ),
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 10, bottom: 10, left: 10, right: 10),
                                                    child: Icon(Icons.camera_alt, color: Colors.white)
                                                )
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 5, bottom: 0, left: 10, right: 10),
                                            child: Container(
                                              child: Text('Camera')
                                            ),
                                          )
                                        ],
                                      )
                                    ),
                                    Expanded(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 5, bottom: 0, left: 10, right: 10),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: AppColors.primaryColor,
                                                    borderRadius:
                                                    BorderRadius.all(
                                                      Radius.circular(25.0)),
                                                ),
                                                  child: Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 10, bottom: 10, left: 10, right: 10),
                                                    child: Icon(Icons.image, color: Colors.white)
                                                  )
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 5, bottom: 0, left: 10, right: 10),
                                              child: Container(
                                                  child: Text('Gallery')
                                              ),
                                            )
                                          ],
                                        )
                                    )
                                  ],
                                )
                              )
                          ),
                          Container(
                            width: double.infinity,
                            child: Padding(
                                padding: EdgeInsets.only(
                                    top: 30, bottom: 0, left: 10, right: 10),
                                child: RawMaterialButton(
                                  onPressed: () {
                                    // userLogin();
                                    // Navigator.of(context).push(
                                    //   MaterialPageRoute(
                                    //     builder: (context) => SuccessLogin(),
                                    //   ),
                                    // );
                                  },
                                  elevation: 3.0,
                                  fillColor: AppColors.primaryColor,
                                  child: Text(
                                    'Continue',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  padding: EdgeInsets.all(12.0),
                                )
                            ),
                          ),
                        ],
                      )
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}
