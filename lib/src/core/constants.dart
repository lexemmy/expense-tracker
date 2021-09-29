import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// App Colors
const kPrimaryColor = Color(0xFF810180);

const kBlackColor = Colors.black;

const kErrorColor = Colors.red;

/// App TextStyles
const kHeadingTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w700
);
const kHeading1TextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w700,
  color: Colors.red
);
const kHeading2TextStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w700,
);

const kTextStyle = TextStyle(
  fontSize: 18,
  color: kPrimaryColor,
  fontWeight: FontWeight.w700,
);
const kLabelText = TextStyle(
  color: Colors.black,
  fontSize: 16,
  fontWeight: FontWeight.w400,
);

/// Vertical Spacings
const kTinyVerticalSpacing = SizedBox(height: 4.0);

const kExtraSmallVerticalSpacing = SizedBox(height: 8);

const kSmallVerticalSpacing = SizedBox(height: 16);

const kMediumVerticalSpacing = SizedBox(height: 24);

const kLargeVerticalSpacing = SizedBox(height: 32);

const kExtraLargeVerticalSpacing = SizedBox(height: 64);

/// Horizontal Spacings
const kTinyHorizontalSpacing = SizedBox(width: 4.0);

const kExtraSmallHorizontalSpacing = SizedBox(width: 8);

const kSmallHorizontalSpacing = SizedBox(width: 16);

const kMediumHorizontalSpacing = SizedBox(width: 24);

const kLargeHorizontalSpacing = SizedBox(width: 32);

//eguonzy

var mButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Color(0xff81007F)),
    padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(15, 15, 15, 15)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60.0),
            side: BorderSide(color: Colors.white))));

var mTitle = 'Set Budget';

var mTitleStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(
      color: Color(0xff040404), fontSize: 18, fontWeight: FontWeight.w600),
);
var mLabelStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(
      color: Color(0xde040404), fontSize: 14, fontWeight: FontWeight.w400),
);
var mDecoration = InputDecoration(
    prefixText: "\u20a6",
    enabledBorder: InputBorder.none,
    contentPadding: EdgeInsets.all(15),
    isDense: false,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
    ));
