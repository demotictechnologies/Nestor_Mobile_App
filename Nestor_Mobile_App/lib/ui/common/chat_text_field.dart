import 'package:flutter/material.dart';
import 'package:nestore/ui/common/HexColor.dart';

class ChatTextField extends StatefulWidget {
  final String placeholderText;
  final String icon;
  final Function(String) onChange;
  final VoidCallback onRightIconClick;
  final bool isPasswordTextField;
  final TextInputType keyboardType;
  final String error;
  final TextEditingController controller;
  final bool isEnabled;

  ChatTextField({
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
  State<StatefulWidget> createState() => ChatTextFieldState();
}

class ChatTextFieldState extends State<ChatTextField> {
  bool isSecurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
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
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            filled: true,
            fillColor: Colors.white,
            hintText: this.widget.placeholderText,
            hintStyle: TextStyle(
                color: Colors.grey[600],
                fontSize: 14),
            enabledBorder:OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: HexColor('F1F2F6'), width: 1),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color:  Colors.white, width: 1)
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide:
                BorderSide(color: HexColor('F1F2F6'), width: 2)
            )
        ),
      ),
      width: MediaQuery.of(context).size.width * 0.75,
    );
  }

}
