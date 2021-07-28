import 'package:flutter/material.dart';

class CommonTextField extends StatefulWidget {
  final String placeholderText;
  final String icon;
  final Function(String) onChange;
  final VoidCallback onRightIconClick;
  final bool isPasswordTextField;
  final TextInputType keyboardType;
  final String error;
  final TextEditingController controller;
  final bool isEnabled;

  CommonTextField({
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
  State<StatefulWidget> createState() => CommonTextFieldState();
}

class CommonTextFieldState extends State<CommonTextField> {
  bool isSecurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.75,
      child: Stack(
      alignment: Alignment.centerRight,
      children: <Widget>[
        TextField(
        controller: this.widget.controller,
        autocorrect: false,
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
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[600], width: 1),
            ),
            disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color:  Colors.white, width: 1)
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide:
                BorderSide(color: Colors.black, width: 2)
            )
        ),
      ),
      this.widget.isPasswordTextField ? IconButton(
        onPressed: () => setState(() {
          isSecurePassword = !isSecurePassword;
        }),
        icon: Icon(isSecurePassword ? Icons.remove_red_eye : Icons.remove_red_eye_outlined),
      ): Container(),
    ])

    );
  }

}
