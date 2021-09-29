import 'package:expense_tracker/src/core/constants.dart';
import 'package:flutter/material.dart';

class AppDropdown extends StatelessWidget {
  final List<String> items;
  final String value;
  final String text;
  final String label;
  final String hintText;
  final TextEditingController controller;
  final void Function(String) onChanged;
  final String Function(String) validator;
  final Color textColor;

  const AppDropdown({
    Key key,
    @required this.items,
    @required this.value,
    @required this.onChanged,
    this.text,
    this.label,
    this.controller,
    this.validator,
    this.hintText,
    this.textColor = Colors.black45,
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
        child: DropdownButtonFormField(
          items: items.map(
            (String item) {
              return new DropdownMenuItem(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(color: textColor, fontSize: 18),
                ),
              );
            },
          ).toList(),
          onChanged: onChanged,
          value: value,
          validator: validator,
          style: TextStyle(color: textColor, fontSize: 18),
          icon: Icon(Icons.arrow_drop_down),
          decoration: InputDecoration(
            hintText: hintText,
            enabledBorder: InputBorder.none,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            contentPadding: EdgeInsets.all(16.0),
            filled: false
          ),
        ),
        )],
    );
  }
}
