import 'package:flutter/material.dart';
import 'package:nestore/ui/common/HexColor.dart';
import 'package:nestore/ui/hotel/search.dart';

class HotelTextField extends StatefulWidget {
  final String placeholderText;
  final String icon;
  final Function(String) onChange;
  final VoidCallback onRightIconClick;
  final bool isPasswordTextField;
  final TextInputType keyboardType;
  final String error;
  final TextEditingController controller;
  final bool isEnabled;

  HotelTextField({
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
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => HotelTextFieldState();
}

class HotelTextFieldState extends State<HotelTextField> {
  bool isSecurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
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
            
            prefixIcon: GestureDetector(
            onTap:(){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductSearch(),
                ),
              );
            },
              child: Image.asset('graphics/Search.png')
        ),
            errorText: widget.error,
            errorMaxLines: 6,
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            filled: true,
            fillColor: Colors.white,
            hintText: this.widget.placeholderText,
            hintStyle: TextStyle(
                color: Colors.grey[600],
                fontSize: 14),
            enabledBorder:UnderlineInputBorder(
              // borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: HexColor('F1F2F6'), width: 1),
            ),
            disabledBorder: UnderlineInputBorder(
              // borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color:  Colors.white, width: 1)
            ),
            errorBorder: UnderlineInputBorder(
              // borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              // borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),
            focusedBorder: UnderlineInputBorder(
              // borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide:
                BorderSide(color: HexColor('F1F2F6'), width: 1)
            )
        ),
      ),
      width: MediaQuery.of(context).size.width,
    );
  }

}
