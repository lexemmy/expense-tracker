import 'package:expense_tracker/src/core/constants.dart';
import 'package:expense_tracker/src/core/images.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  final Color color;
  final Gradient gradient;
  final Color textColor;
  final bool isLoading;
  final String value;
  final String price;
  final String image;

  const ExpenseList({
    Key key,
    this.color,
    this.image,
    this.gradient,
    this.textColor = Colors.white,
    this.isLoading = false,
    this.value,
    this.price
   
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 20.0,
                width: 20.0,
                child: ClipRect(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Image(
                        image: AssetImage(image)),
                  ),
                ),
              ),
              kExtraSmallHorizontalSpacing,
              Text(
                value,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Text(price,
              style: TextStyle(fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}