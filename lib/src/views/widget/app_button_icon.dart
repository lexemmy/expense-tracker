import 'package:expense_tracker/src/core/constants.dart';
import 'package:flutter/material.dart';

class AppButtonIcon extends StatelessWidget {
  final Function onPressed;
  final Color color;
  final Color textColor;
  final bool isLoading;
  final String label;
  final EdgeInsets padding;
  final IconData icon;

  const AppButtonIcon({
    Key key, this.onPressed, this.color, this.textColor, this.isLoading, this.label, 
    this.padding = const EdgeInsets.symmetric(
        vertical: 16,
    ), this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
      label: Text(label, 
            style: TextStyle(color: textColor),),
      icon: Icon(icon, color:textColor,), 
      textColor: Colors.white,
      color: color,);
  }
}
