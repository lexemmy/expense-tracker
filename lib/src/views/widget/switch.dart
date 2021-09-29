import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SwitchButton extends StatelessWidget {
  final String label_1;
  final String label_2;
  final Function onToggle;

  const SwitchButton({
  this.label_1, this.label_2, this.onToggle
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            child: ToggleSwitch(
              minWidth: 120.0,
              minHeight: 30.0,
              cornerRadius: 20.0,
              activeBgColor: [Color(0xFFA928A7)],
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.white,
              inactiveFgColor: Colors.black,
              initialLabelIndex: 1,
              totalSwitches: 2,
              labels: [label_1, label_2],
              radiusStyle: true,
              onToggle: onToggle,
            ),
          ),
        ],
      ),
    );
  }
}