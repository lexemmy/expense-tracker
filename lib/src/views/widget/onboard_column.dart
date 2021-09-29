import 'package:expense_tracker/src/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardColumn extends StatelessWidget {
  final String imgPath;
  final String titletext;

  OnboardColumn({
    this.imgPath,
    this.titletext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(56, 128, 56, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(imgPath),
          kLargeVerticalSpacing,
          Text(titletext,            
            style: GoogleFonts.montserrat(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Color(0xFF81007F),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
