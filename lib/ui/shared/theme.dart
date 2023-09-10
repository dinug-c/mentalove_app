import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultMargin = 20.0;
double defaultRadius = 10.0;

Color kPrimaryColor = const Color(0xff738AE6);
Color kPrimary2Color = const Color(0xffB46BE9);
Color kPrimaryLightColor = const Color(0xffDDD9FA);
Color kPurpleColor = const Color(0xff8D80ED);
Color kSecondaryColor = const Color(0xffFF6D99);
Color kSecondary2Color = const Color(0xffFFC0D3);
Color kWhiteColor = const Color(0xffFFFFFF);
Color kBlackColor = const Color(0xff000000);
Color kGreyColor = const Color(0xff7E7E7E);
Color kLightGreyColor = const Color(0xffEBEBEB);
Color kGreenColor = const Color(0xff29CB9E);
Color kRedColor = const Color.fromARGB(255, 243, 57, 113);
Color kTextColor = const Color(0xff524A4E);

TextStyle blackTextStyle = GoogleFonts.poppins(
  color: kBlackColor,
);

TextStyle whiteTextStyle = GoogleFonts.poppins(
  color: kWhiteColor,
);

TextStyle greyTextStyle = GoogleFonts.poppins(
  color: kGreyColor,
);

TextStyle greenTextStyle = GoogleFonts.poppins(
  color: kGreenColor,
);

TextStyle redTextStyle = GoogleFonts.poppins(
  color: kRedColor,
);

TextStyle purpleTextStyle = GoogleFonts.poppins(
  color: kPrimaryColor,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;

var preloader = Center(child: CircularProgressIndicator(color: kPrimaryColor));
