import 'package:flutter/material.dart';
import 'package:nestore/model/result.dart';
import 'package:nestore/network/orders.dart';
import 'package:nestore/resources/app_style.dart';
import 'package:nestore/ui/common/borderButton.dart';
import 'package:nestore/ui/home/InnerHeader.dart';
import 'package:nestore/ui/user/addAddress.dart';

class AddressList extends StatefulWidget {
  AddressList({Key key}) : super(key: key);

  @override
  _HotelHomeState createState() => _HotelHomeState();
}

class _HotelHomeState extends State<AddressList> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final authService = AuthService();
  List addresses = [];
  List states = [];

  void initState() {
    super.initState();
    getStates();
    getTermsAndCondition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
          child: InnerHeader()),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
            child: Column(
              children: [
                // Padding(
                //     padding: EdgeInsets.only(top:0, left:10, right:10),
                //     child: Container(
                //       width: double.infinity,
                //       child: Text('Address',style: TextStyle(color: Colors.black, fontSize: AppStyles.MEDIUM_TEXTSIZE, fontWeight: FontWeight.w600),),
                //     )
                // ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
                  child: Container(
                      width: double.infinity,
                      child: BorderButton(
                        Title: 'Add Address',
                        onClick: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => AddAddressPage(),
                            ),
                          );
                        },
                      )),
                ),
                if (addresses != null &&
                    addresses.length > 0 &&
                    states != null &&
                    states.length > 0)
                  AddressList2(data: addresses, states: states)
              ],
            )),
      ),
    );
  }

  getTermsAndCondition() async {
    Result response = await authService.getAddressList();
    if (response is SuccessState) {
      if (response.value['status'] == true) {
        setState(() {
          addresses = response.value['data'];
        });
      }
    }
  }

  getStates() async {
    Result response = await authService.fetchStates();
    if (response is SuccessState) {
      if (response.value['status'] == true) {
        setState(() {
          states = response.value['data'];
        });
      }
    }
  }
}

class AddressList2 extends StatefulWidget {
  List data;
  List states;
  AddressList2({Key key, this.data, this.states}) : super(key: key);

  @override
  _AddressList2State createState() => _AddressList2State();
}

class _AddressList2State extends State<AddressList2> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final authService = AuthService();

  getState(state_code) {
    if (state_code != null && this.widget.states.length > 0) {
      for (int i = 0; i < this.widget.states.length; i++) {
        if (this.widget.states[i]['state_code'] == state_code) {
          return this.widget.states[i]['name'];
        }
      }
    } else {
      return '';
    }
  }

  getCity(state_code, city_code) {
    if (state_code != null && this.widget.states.length > 0) {
      for (int i = 0; i < this.widget.states.length; i++) {
        if (this.widget.states[i]['state_code'] == state_code) {
          for (int j = 0; j < this.widget.states[i]['cities'].length; j++) {
            if (this.widget.states[i]['cities'][j]['city_code'] == city_code) {
              return this.widget.states[i]['cities'][j]['name'];
            }
          }
        }
      }
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 10, top: 10, left: 10, right: 10),
        child: Container(
            color: Colors.white,
            child: Column(
              children: [
                for (int i = 0; i < this.widget.data.length; i++)
                  Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey[200], width: 1)),
                      child: Padding(
                          padding: EdgeInsets.only(
                              top: 25, bottom: 10, left: 0, right: 0),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Column(
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: 5,
                                              bottom: 5,
                                              left: 10,
                                              right: 5),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                    color: Colors.blueGrey,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 5,
                                                          bottom: 5,
                                                          left: 10,
                                                          right: 10),
                                                      child: Text(
                                                          this.widget.data[i][
                                                          'address_type'] ==
                                                              'is_home'
                                                              ? 'HOME'
                                                              : 'WORK',
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              fontSize: AppStyles
                                                                  .SMALL_TEXTSIZE)),
                                                    )
                                                )
                                              ),
                                              Expanded(
                                                flex:5,
                                                child:
                                                GestureDetector(
                                                  onTap: (){
                                                    print(this.widget.data[i]);
                                                    Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                        builder: (context) => AddAddressPage(data: this.widget.data[i]),
                                                      ),
                                                    );
                                                  },
                                                  child: Align(
                                                    alignment: Alignment.topRight,
                                                    child: Icon(Icons.edit),
                                                  ),
                                                )
                                              )
                                            ],
                                          )),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: 5,
                                              bottom: 5,
                                              left: 10,
                                              right: 5),
                                          child: Container(
                                              width: double.infinity,
                                              child: Text(
                                                  this.widget.data[i]
                                                      ['Contact_Person'],
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: AppStyles
                                                          .SMALL_TEXTSIZE)))),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: 5,
                                              bottom: 5,
                                              left: 10,
                                              right: 5),
                                          child: Container(
                                              width: double.infinity,
                                              child: Wrap(
                                                children: [
                                                  Text(
                                                      '${this.widget.data[i]['Address1']}, ',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: AppStyles
                                                              .SMALL_TEXTSIZE)),
                                                  Text(
                                                      '${this.widget.data[i]['Address2']}, ',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: AppStyles
                                                              .SMALL_TEXTSIZE)),
                                                  Text(
                                                      '${this.widget.data[i]['Address3']}',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: AppStyles
                                                              .SMALL_TEXTSIZE)),
                                                ],
                                              ))),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: 2,
                                              bottom: 5,
                                              left: 10,
                                              right: 5),
                                          child: Container(
                                              width: double.infinity,
                                              child: Wrap(
                                                children: [
                                                  Text(
                                                      'City: ${getCity(this.widget.data[i]['State_Code'], this.widget.data[i]['City_Code'])},',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: AppStyles
                                                              .SMALL_TEXTSIZE)),
                                                  Text(
                                                      ' State: ${getState(this.widget.data[i]['State_Code'])}, ',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: AppStyles
                                                              .SMALL_TEXTSIZE)),
                                                  Text(
                                                      '${this.widget.data[i]['PIN']}',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: AppStyles
                                                              .SMALL_TEXTSIZE))
                                                ],
                                              ))),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: 2,
                                              bottom: 5,
                                              left: 10,
                                              right: 5),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  child: Container(
                                                width: double.infinity,
                                                child: Text(
                                                    '${this.widget.data[i]['Mobile_No']}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: AppStyles
                                                            .SMALL_TEXTSIZE,
                                                        color: Colors.grey)),
                                              )),
                                            ],
                                          )),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: 2,
                                              bottom: 5,
                                              left: 10,
                                              right: 5),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  child: Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 5,
                                                          bottom: 5,
                                                          left: 5,
                                                          right: 5),
                                                      child: BorderButton(
                                                        Title: 'SET AS DEFAULT',
                                                        onClick: () {
                                                          setAsDefault(
                                                              this
                                                                      .widget
                                                                      .data[i]
                                                                  ['id'],
                                                              context);
                                                        },
                                                      ))),
                                              Expanded(
                                                  child: Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 5,
                                                          bottom: 5,
                                                          left: 5,
                                                          right: 5),
                                                      child: BorderButton(
                                                        Title: 'SET AS CURRENT',
                                                        onClick: () {
                                                          setAsCurrent(
                                                              this
                                                                      .widget
                                                                      .data[i]
                                                                  ['id'],
                                                              context);
                                                        },
                                                      )))
                                            ],
                                          ))
                                    ],
                                  ))
                            ],
                          ))),
              ],
            )));
  }

  setAsDefault(id, context) async {
    Result response = await authService.setDefaultAddress(id);
    if (response is SuccessState) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(response.value['message']),
        ),
      );
    }
  }

  setAsCurrent(id, context) async {
    Result response = await authService.setCurrentAddress(id);
    if (response is SuccessState) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(response.value['message']),
        ),
      );
    }
  }
}
