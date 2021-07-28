import 'package:flutter/material.dart';
import 'package:nestore/model/result.dart';
import 'package:nestore/network/orders.dart';
import 'package:nestore/resources/app_color.dart';
import 'package:nestore/ui/common/TextField.dart';
import 'package:nestore/ui/common/borderButton.dart';
import 'package:nestore/ui/home/InnerHeader.dart';
import 'package:nestore/ui/user/addressList.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddAddressPage extends StatefulWidget {
  var data;
  AddAddressPage({Key key, this.data}) : super(key: key);

  @override
  _HotelHomeState createState() => _HotelHomeState();
}

class _HotelHomeState extends State<AddAddressPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final authService = AuthService();
  TextEditingController pincodeCtrl = TextEditingController(text: '');
  String pincode;
  String pincodeError;

  TextEditingController nameCtrl = TextEditingController(text: '');
  String name;
  String nameError;

  TextEditingController address1Ctrl = TextEditingController(text: '');
  String address1;
  String address1Error;

  TextEditingController address2Ctrl = TextEditingController(text: '');
  String address2;
  String address2Error;

  TextEditingController address3Ctrl = TextEditingController(text: '');
  String address3;
  String address3Error;

  TextEditingController cityCtrl = TextEditingController(text: '');
  String city;
  String cityError;

  TextEditingController stateCtrl = TextEditingController(text: '');
  String state;
  String stateError;

  TextEditingController phoneCtrl = TextEditingController(text: '');
  String phone;
  String phoneError;

  bool isWork = true;

  List states = ["Select a State"];
  List states2 = [];
  List cities = ["Select a City"];

  void initState() {
    super.initState();
    getStates();
  }

  fetchCities(state) {
    for (int i = 0; i < states2.length; i++) {
      if (states2[i] != null &&
          states2[i]['name'] != null &&
          states2[i]['name'] == state) {
        for (int j = 0; j < states2[i]['cities'].length; j++) {
          if (states2[i]['cities'][j] != null &&
              states2[i]['cities'][j]['name'] != null) {
            setState(() {
              cities.add(states2[i]['cities'][j]['name']);
            });
          }
        }
        if(this.widget.data != null){
          setState(() {
            city = this.widget.data["city"]["name"];
          });
        }
      }
    }
  }

  getStates() async {
    Result response = await authService.fetchStates();
    if (response is SuccessState) {
      if (response.value['status'] == true) {
        for (int i = 0; i < response.value['data'].length; i++) {
          if (response.value['data'][i] != null &&
              response.value['data'][i]['name'] != null) {
            setState(() {
              states.add(response.value['data'][i]['name']);
            });
          }
        }
        setState(() {
          states2 = response.value['data'];
        });

        if(this.widget.data != null) {
          for (int i = 0; i < response.value['data'].length; i++) {
            if (response.value['data'][i]['state_code'] ==
                    this.widget.data["state"]["state_code"]) {
              fetchCities(this.widget.data["state"]["name"]);

            }
          }
        }
      }
    }

    if(this.widget.data != null) {
      setState(() {
        name = this.widget.data["Contact_Person"];
        nameCtrl.text = this.widget.data["Contact_Person"];

        address1 = this.widget.data["Address1"];
        address1Ctrl.text = this.widget.data["Address1"];

        address2 = this.widget.data["Address2"];
        address2Ctrl.text = this.widget.data["Address2"];

        address3 = this.widget.data["Address3"];
        address3Ctrl.text = this.widget.data["Address3"];

        pincode = this.widget.data["PIN"];
        pincodeCtrl.text = this.widget.data["PIN"];

        phone = this.widget.data["Mobile_No"];
        phoneCtrl.text = this.widget.data["Mobile_No"];

        isWork = this.widget.data["address_type"] == 'is_home' ? true : false;
        state = this.widget.data["state"]["name"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[200],
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.11),
        child: InnerHeader(),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      )),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                      child: Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Container(
                                  width: double.infinity,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(bottom: 10, left: 10),
                                    child: Text(
                                      'Address Details',
                                      style: TextStyle(
                                          color: Colors.black26,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ))),
                          Container(
                            width: double.infinity,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 15, bottom: 0, left: 10, right: 10),
                              child: CommonTextField(
                                controller: nameCtrl,
                                placeholderText: 'Contact Person Name',
                                onChange: (value) {
                                  setState(() {
                                    name = value;
                                    nameError = null;
                                  });
                                },
                                keyboardType: TextInputType.text,
                                error: nameError,
                              ),
                            ),
                          ),
                          Container(
                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 15, bottom: 0, left: 10, right: 10),
                                child: CommonTextField(
                                  controller: address1Ctrl,
                                  placeholderText: 'Address Line 1',
                                  onChange: (value) {
                                    setState(() {
                                      address1 = value;
                                      address1Error = null;
                                    });
                                  },
                                  keyboardType: TextInputType.text,
                                  error: address1Error,
                                ),
                              )),
                          Container(
                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 15, bottom: 0, left: 10, right: 10),
                                child: CommonTextField(
                                  controller: address2Ctrl,
                                  placeholderText: 'Address Line 2',
                                  onChange: (value) {
                                    setState(() {
                                      address2 = value;
                                    });
                                  },
                                  keyboardType: TextInputType.text,
                                  error: address2Error,
                                ),
                              )),
                          Container(
                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 15, bottom: 0, left: 10, right: 10),
                                child: CommonTextField(
                                  controller: address3Ctrl,
                                  placeholderText: 'Address Line 3',
                                  onChange: (value) {
                                    setState(() {
                                      address3 = value;
                                    });
                                  },
                                  keyboardType: TextInputType.text,
                                  error: address3Error,
                                ),
                              )),
                          if (states != null && states.length > 0)
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 15, bottom: 0, left: 10, right: 10),
                              child: Container(
                                  width: double.infinity,
                                  child: DropdownButton<String>(
                                    focusColor: Colors.white,
                                    value: state != null
                                        ? state
                                        : 'Select a State',
                                    style: TextStyle(color: Colors.white),
                                    iconEnabledColor: Colors.black,
                                    items: states.map<DropdownMenuItem<String>>(
                                        (dynamic value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      );
                                    }).toList(),
                                    hint: Text(
                                      "Please choose a state",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    onChanged: (String value) {
                                      setState(() {
                                        stateError = null;
                                        state = value == 'Select a State' ? null : value;
                                      });
                                      fetchCities(value);
                                    },
                                  )),
                            ),
                          if(stateError != null )
                            Container(
                                width: double.infinity,
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        bottom: 10,
                                        left: 10,
                                        right: 10),
                                    child: Text(
                                      'Please select state',
                                      style: TextStyle(
                                          color: Colors.redAccent),
                                    ))),
                          if (cities != null && cities.length > 0)
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 15, bottom: 0, left: 10, right: 10),
                              child: Container(
                                  width: double.infinity,
                                  child: DropdownButton<String>(
                                    focusColor: Colors.white,
                                    value:
                                        city != null ? city : 'Select a City',
                                    style: TextStyle(color: Colors.white),
                                    iconEnabledColor: Colors.black,
                                    items: cities.map<DropdownMenuItem<String>>(
                                        (dynamic value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      );
                                    }).toList(),
                                    hint: Text(
                                      "Please choose a city",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    onChanged: (String value) {
                                      setState(() {
                                        city = value == 'Select a City' ? null : value;
                                        cityError = null;
                                      });
                                    },
                                  )),
                            ),
                          if(cityError != null )
                            Container(
                              width: double.infinity,
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        bottom: 10,
                                        left: 10,
                                        right: 10),
                                    child: Text(
                                      'Please select city',
                                      style: TextStyle(
                                          color: Colors.redAccent),
                                    ))),
                          Container(
                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 15, bottom: 0, left: 10, right: 10),
                                child: CommonTextField(
                                  controller: pincodeCtrl,
                                  placeholderText: 'Pincode',
                                  onChange: (value) {
                                    setState(() {
                                      pincode = value;
                                      pincodeError = null;
                                    });
                                  },
                                  keyboardType: TextInputType.text,
                                  error: pincodeError,
                                ),
                              )),
                          Container(
                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 15, bottom: 20, left: 10, right: 10),
                                child: CommonTextField(
                                  controller: phoneCtrl,
                                  placeholderText: 'Mobile Number',
                                  onChange: (value) {
                                    setState(() {
                                      phone = value;
                                      phoneError = null;
                                    });
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  error: phoneError,
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Container(
                                  width: double.infinity,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(bottom: 10, left: 10),
                                    child: Text(
                                      'Located?',
                                      style: TextStyle(
                                          color: Colors.black26,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ))),
                          Container(
                              width: double.infinity,
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 15, bottom: 20, left: 10, right: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  isWork = true;
                                                });
                                              },
                                              child: Container(
                                                  color: isWork
                                                      ? AppColors.primaryColor
                                                      : Colors.white,
                                                  child: Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 10,
                                                          bottom: 10,
                                                          left: 10,
                                                          right: 10),
                                                      child: Text(
                                                        'Work',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            color: isWork
                                                                ? Colors.white
                                                                : Colors.black),
                                                      ))))),
                                      Expanded(
                                          child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  isWork = false;
                                                });
                                              },
                                              child: Container(
                                                  color: !isWork
                                                      ? AppColors.primaryColor
                                                      : Colors.white,
                                                  child: Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 10,
                                                          bottom: 10,
                                                          left: 10,
                                                          right: 10),
                                                      child: Text(
                                                        'Home',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            color: !isWork
                                                                ? Colors.white
                                                                : Colors.black),
                                                      ))))),
                                    ],
                                  ))),
                          Container(
                            width: double.infinity,
                            child: Padding(
                                padding: EdgeInsets.only(
                                    top: 30, bottom: 0, left: 10, right: 10),
                                child: BorderButton(
                                  Title: this.widget.data != null ? 'Edit Address' : 'Save Address',
                                  onClick: () {
                                    addAddress();
                                  },
                                )),
                          ),
                        ],
                      )),
                ),
              ],
            )),
      ),
    );
  }

  getState(state_code) {
    if (state_code != null && states2.length > 0) {
      for (int i = 0; i < states2.length; i++) {
        if (states2[i]['name'] == state_code) {
          return states2[i]['state_code'];
        }
      }
    } else {
      return '';
    }
  }

  getCity(state_code, city_code) {
    if (state_code != null && states2.length > 0) {
      for (int i = 0; i < states2.length; i++) {
        if (states2[i]['name'] == state_code) {
          for (int j = 0; j < states2[i]['cities'].length; j++) {
            if (states2[i]['cities'][j]['name'] == city_code) {
              return states2[i]['cities'][j]['city_code'];
            }
          }
        }
      }
    } else {
      return '';
    }
  }

  addAddress() async {
    if (pincode != null &&
        name != null &&
        city != null &&
        state != null &&
        address1 != null &&
        phone != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String mobileValue = prefs.getString('mobile');
      var payload = {
        'mobile': mobileValue,
        'Contact_Person': name,
        'Address1': address1,
        'Address2': address2,
        'Address3': address3,
        'City_Code': getCity(state, city),
        'State_Code': getState(state),
        'PIN': pincode,
        'Mobile_No': phone,
        'is_home': isWork ? 0 : 1,
        'is_work': isWork ? 1 : 0
      };
      if(this.widget.data != null) {
        payload["address_id"] = this.widget.data["id"];
      }
      Result response = this.widget.data != null ? await authService.editAddress(payload) : await authService.addAddress(payload);
      if (response is SuccessState) {
        final snackBar = SnackBar(
          content: Text(response.value['message']),
          duration: Duration(seconds: 2),
        );
        _scaffoldKey.currentState.showSnackBar(snackBar);
        if (response.value['status'] == true) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddressList(),
            ),
          );
        }
      }
    } else {
      if (pincode == null) {
        setState(() {
          pincodeError = 'Pincode is required!';
        });
      }
      if (name == null) {
        setState(() {
          nameError = 'Name is required!';
        });
      }
      if (city == null) {
        setState(() {
          cityError = 'City is required!';
        });
      }
      if (state == null) {
        setState(() {
          stateError = 'State is required!';
        });
      }
      if (address1 == null) {
        setState(() {
          address1Error = 'Address Line 1 is required!';
        });
      }
      if (phone == null) {
        setState(() {
          phoneError = 'Mobile number is required!';
        });
      }
    }
  }
}
