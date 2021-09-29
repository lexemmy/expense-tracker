import 'package:expense_tracker/src/core/constants.dart';
import 'package:flutter/material.dart';


class AppTextField extends StatelessWidget {
  final String hintText;
  final bool filled;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function(String) validator;
  final TextInputAction textInputAction;
  final int maxlength;
  final InputBorder border;
  final String title;
  final String label;
  final int maxLines;
  final Widget suffixIcon;
  final void Function(String) onChanged;
  final Color borderColor;
  final Color textColor;
  final double height;
  final bool enabled;
  final Widget input;
  final Function(String) onSaved;

  const AppTextField({
    Key key,
    this.label,
    this.hintText,
    this.controller,
    this.suffixIcon,
    this.onChanged,
    this.maxLines,
    this.obscureText,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.borderColor,
    this.textColor = Colors.black87,
    this.filled,
    this.input,
    this.maxlength,
    this.border,
    this.title,
    this.height,
    this.enabled,this.onSaved
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null ? Text(label) : SizedBox(),
        kSmallVerticalSpacing,
        Material(
          elevation: 10,
          shadowColor: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(16),  
          child: TextFormField(
            onSaved: onSaved,
            controller: controller,
            style: TextStyle(color: textColor, fontSize: 18, height: height),
            onChanged: onChanged,
            maxLines: maxLines ?? 1,
            validator: validator,
            keyboardType: keyboardType,
            enabled: enabled,
            textInputAction: textInputAction ?? TextInputAction.next,
            obscureText: obscureText ?? false,
            decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: suffixIcon,
              contentPadding: EdgeInsets.all(16.0),
              border: InputBorder.none,
              filled: false,      
            ),
          ),
        ),
      ],
    );
  }
}
