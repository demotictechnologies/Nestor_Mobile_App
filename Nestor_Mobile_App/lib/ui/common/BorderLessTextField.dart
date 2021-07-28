import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';

class BorderLessTextField extends StatefulWidget {
  final String placeholderText;
  final String icon;
  final Function(String) onChange;
  final VoidCallback onRightIconClick;
  final bool isPasswordTextField;
  final TextInputType keyboardType;
  final String error;
  final TextEditingController controller;
  final bool isEnabled;
  final Function onCountryChange;

  BorderLessTextField({
    Key key,
    @required this.placeholderText,
    this.icon = "",
    this.onChange,
    this.isPasswordTextField = false,
    this.keyboardType = TextInputType.text,
    this.error,
    this.controller,
    this.isEnabled = true,
    this.onRightIconClick,
    this.onCountryChange
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => CommonTextFieldState();
}

class CommonTextFieldState extends State<BorderLessTextField> {
  bool isSecurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: CountryListPick(

              // if you need custome picker use this
              pickerBuilder: (context, countryCode) {
                return Row(
                  children: [
                    Image.asset(
                      countryCode.flagUri,
                      package: 'country_list_pick',
                      height: 30,
                      width: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 10),
                      child: Text(countryCode.dialCode),
                    )
                  ],
                );
              },
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
                this.widget.onCountryChange(code.dialCode);
              },
            ),
          ),
          Expanded(
              flex:3,
              child: Container(
                child: TextField(
                  controller: this.widget.controller,
                  autocorrect: false,
                  // enabled: widget.isEnabled,
                  obscureText: (this.widget.isPasswordTextField && this.isSecurePassword),
                  keyboardType: this.widget.keyboardType,
                  onChanged: (text) {
                    this.widget.onChange(text);
                  },
                  decoration: InputDecoration(
                      errorText: widget.error,
                      errorMaxLines: 6,
                      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                      filled: true,
                      fillColor:
                      Colors.white,
                      hintText: this.widget.placeholderText,
                      hintStyle: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14),
                      enabledBorder: null,
                      disabledBorder: null,
                      errorBorder: null,
                      focusedErrorBorder: null,
                      focusedBorder: UnderlineInputBorder(
                        // borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide:
                          BorderSide(color: Colors.black, width: 0)
                      )
                  ),
                ),
                width: MediaQuery.of(context).size.width * 0.75,
              )
          )
        ],
      ),
      width: MediaQuery.of(context).size.width * 0.75,
    );
  }

}
