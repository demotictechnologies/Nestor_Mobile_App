import 'package:flutter/material.dart';
import 'package:nestore/resources/app_color.dart';
import 'package:nestore/resources/app_style.dart';

class BorderButton extends StatefulWidget {
  String Title;
  Function onClick;
  BorderButton({Key key, this.Title, this.onClick}) : super(key: key);

  @override
  _BorderButtonState createState() => _BorderButtonState();
}

class _BorderButtonState extends State<BorderButton> {

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius
          .all(
        Radius
            .circular(
            20.0),
      )),
      onPressed: () {
        this.widget.onClick();
      },
      elevation: 3.0,
      fillColor: AppColors.primaryColor,
      child: Text(
        this.widget.Title,
        style: TextStyle(color: Colors.white, fontSize: AppStyles.SMALL_TEXTSIZE),
      ),
      padding: EdgeInsets.all(20.0),
    );
  }
}
