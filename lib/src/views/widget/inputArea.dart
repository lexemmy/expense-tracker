import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../controller/budget_controller.dart';

class InputArea extends StatelessWidget {
  SetBudgetController controller;
  Widget label;
  Widget input;
  InputArea({Key key, this.controller, this.input, this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          this.label,
          Padding(padding: EdgeInsets.all(7)),
          Material(
            elevation: 10,
            clipBehavior: Clip.hardEdge,
            shadowColor: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(16),
            child: this.input,
          ),
          Padding(padding: EdgeInsets.all(16)),
        ],
      ),
    );
  }
}
