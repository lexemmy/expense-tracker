import 'package:expense_tracker/src/core/constants.dart';
import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final IconData leading;
  final String title;
  final IconData trailing;
  final Function onPressed;

  const AppCard({
    Key key,
    this.leading,
    @required this.title,
    this.trailing,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Material(
          elevation: 10,
            shadowColor: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(16),  
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Container(  
                         width: MediaQuery.of(context).size.width * 0.55,
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Spacer(),
                      Icon(trailing, color: Color(0xFFE0E0E0)),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
