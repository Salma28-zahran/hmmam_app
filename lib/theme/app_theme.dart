import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColor {
  static const Color floatButtonbackgroundColor = Color(0xff0F9585); // Pink
  static const Color backgroundIcon = Color(0xFFFFFFFF); // White
  // static const Color textColor = Color(0xFF333333); // Dark gray
  static const Color backgroundcolor = Color(0xFFF8F9FA); // Light gray
  static const Color textColorheadline1 = Color(0xFF000000); // Black
  static const Color textColorheadline2 = Color(0xFF424242); // Gray
  static const Color textColorbodyText1 = Color(0xFF666666); // Light gray
  static const Color textColorbodyText2 = Color(0xFF757575); // Medium gray

  static const Color primary = Color(0xff24CAEF);
  static const Color primary2 = Color(0xffE8FFFC);
  static const Color primary3 = Color(0xff61f18f);




  // You can define more colors as per your requirement
  static const ButtonThemeData buttonTheme = ButtonThemeData(
    buttonColor: primary, // Button color
    textTheme: ButtonTextTheme.primary, // Use primary color for text
  );

  /// Old Data

  static const Color grey = Color(0xff666666);
  static const Color grey2 = Color.fromARGB(255, 66, 66, 66);
  static const Color grey3 = Color(0xffdcd4d4);

  static const Color greylite200 = Color(0xFFEEEEEE);
  static const Color black = Color(0xff000000);
  static const Color white = Color(0xffF8F9FD);
  static const Color blue = Color(0xFF90CAF9);
  static const Color blue2 = Color(0xFF0059A1); //Color(0xFF42A5F5);


  static const Color purple = Color(0xFFF5F3FF);
  static const Color purple2 = Color(0xFF8B5CF6);
  static const Color pink = Color(0xffFDF2F8);
  static const Color pink2 = Color(0xffEC4899);
  static const Color orange = Color(0xffFFF1E6);
  static const Color orange2 = Color(0xffFF9B4D);
  static const Color yellow = Color(0xffFFC154);
  static const Color green = Color(0xff3DC26F);














  static const Color primaryColor = Color(0xFF0059A1); //Color(0xff5DB1DF);

  static Color backgroundcardcolor = const Color(0xFF0059A1).withOpacity(0.5);

  //static const Color primaryColor = Color(0xffe74c3c);
  //static const Color secondColor = Color(0xffc0392b);
  static const Color secondColor = Color(0xFF90CAF9);
  static const Color fourthColor = Color(0xff0d3056);
  static const Color thirdColor = Color.fromARGB(52, 255, 179, 170);
  static const Color textcolor = Colors.white;

  static const Color mainColor = Color(0xff006533);
  static const Color secondMainColor = Color(0xff93BF1E);
  static const Color mainColorWhite = Colors.white;
  static const Color mainColorBlack = Colors.black87;
  static const Color kLightGoldColor1 = Color(0xffF3E184);
  static const Color kLightGoldColor = Color(0xfff5b324);
  static const Color kBGColor = Color(0xfff4f4f4);

  static const Color kPrimaryColor = Color(0xFF0059A1); //Color(0xFF1492E6);
  static Color kAccentColor = const Color(0xFF1492E6).withOpacity(0.3);
  static const Color kLightGreyColor = Color(0xFFB5B5B5);
  static const Color kGreyColor = Color(0xFFF2F2F2);
  static const Color kDarkGreyColor = Color(0xFF555555);
  static const Color kBackgroundColor = Colors.white;
///////////////////mine
  static const Color backgroundbox = AppColor.blue2;
  static const Color backgroundbox2 = AppColor.blue;
  static const Color backgroundboxlite = AppColor.white;
  static const Color listviewbackground = AppColor.white;

  static const MaterialColor primarySwatchbackgroundColor = Colors.deepPurple;

  static const Color titleColor = AppColor.white;

  static const Color textColorAppbar = AppColor.blue2;
  static const Color textColorDisabled = AppColor.grey;

  static const Color appBarBackground = AppColor.white;

  static const Color buttonBackground = AppColor.blue2;

  static const Color buttonBackgroundDisable = AppColor.grey;
  static const Color buttontitle = AppColor.primaryColor;
  static const Color buttontextColor = AppColor.white;

  static Gradient kBlackGradient =
  const RadialGradient(colors: [mainColor, secondMainColor], radius: 4);
  static Gradient kGoldGradient =
  const RadialGradient(colors: [kLightGoldColor, mainColor], radius: 4);

  static const TextStyle titleStyle = TextStyle(
      fontSize: 14, color: AppColor.titleColor, fontWeight: FontWeight.w400);
  static const TextStyle titleStyle2 = TextStyle(
      fontSize: 20, color: AppColor.black, fontWeight: FontWeight.bold);
  static const TextStyle titleStyle3 =
  TextStyle(color: AppColor.primaryColor, fontWeight: FontWeight.bold);



  static TextStyle appBar =GoogleFonts.inter(
      fontSize: 20, color: AppColor.black, fontWeight: FontWeight.w600);

  static TextStyle textgrey =GoogleFonts.inter(
      fontSize: 14, color: AppColor.grey, fontWeight: FontWeight.w400);

  static TextStyle textblack =GoogleFonts.inter(
      fontSize: 16, color: AppColor.black, fontWeight: FontWeight.w600);

  static TextStyle textprimary =GoogleFonts.inter(
      fontSize: 12, color: AppColor.primary, fontWeight: FontWeight.w400);

  static TextStyle textwhite =GoogleFonts.plusJakartaSans(
      fontSize: 16, color: AppColor.white, fontWeight: FontWeight.w800);










  static const TextStyle titleStyle4 =TextStyle(
      fontSize: 20, color: AppColor.black, fontWeight: FontWeight.w400);

  static const TextStyle textStylesmall =
  TextStyle(color: AppColor.primaryColor, fontWeight: FontWeight.bold);

  static const TextStyle textStyleMeduim = TextStyle(
      fontSize: 20, color: AppColor.primaryColor, fontWeight: FontWeight.bold);
  static const TextStyle textStyleLarge = TextStyle(
      fontSize: 30, color: AppColor.primaryColor, fontWeight: FontWeight.bold);
}

ThemeData themeEnglish = ThemeData();
ThemeData themeArabic = ThemeData();

BoxDecoration kBoxDecoration = BoxDecoration(
  border: Border.all(color: Colors.grey),
  borderRadius: BorderRadius.circular(10),
);
final containerDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.white,
    border: Border.all(color: Colors.black54, width: 0.2));

double sizeFromHeight(
    {bool removeAppBarSize = true,
      required double fraction,
      required BuildContext context}) {
  MediaQueryData mediaQuery = MediaQuery.of(context);
  fraction = (removeAppBarSize
      ? (mediaQuery.size.height -
      AppBar().preferredSize.height -
      mediaQuery.padding.top)
      : (mediaQuery.size.height)) /
      (fraction == 0 ? 1 : fraction);
  return fraction;
}

double sizeFromWidth(
    {required double fraction, required BuildContext context}) {
  fraction = MediaQuery.of(context).size.width / (fraction == 0 ? 1 : fraction);
  return fraction;
}

class ColorManager {
  static Color lightGolden = HexaColor.fromHexa("#F3E184");
  static Color golden = HexaColor.fromHexa("#BA8B31");
}

extension HexaColor on Color {
  static Color fromHexa(hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString";
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
