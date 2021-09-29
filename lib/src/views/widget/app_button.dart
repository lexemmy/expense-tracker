import 'package:expense_tracker/src/core/constants.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Function onPressed;
  final Color color;
  final Gradient gradient;
  final Color textColor;
  final bool isLoading;
  final String label;
  final EdgeInsets padding;
  

  const AppButton({
    Key key,
    @required this.onPressed,
    this.color,
    this.gradient,
    this.textColor = Colors.white,
    this.isLoading = false,
    this.padding = const EdgeInsets.symmetric(
        vertical: 16,
    ),
    @required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return RaisedButton(
    onPressed: onPressed,
      color: color,
      textColor: textColor,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    padding:  EdgeInsets.all(0.0),
    child: Ink(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        constraints: BoxConstraints(minWidth: 16.0, minHeight: 36.0),
        height: 50, // min sizes for Material buttons
         alignment: Alignment.center,
        child: isLoading
          ? SizedBox(
              width: 25.0,
              height: 25.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Text(
          label,
          style: TextStyle(color: textColor),
          textAlign: TextAlign.center,
      ),
    ),
  ),
);
  }
}


  
