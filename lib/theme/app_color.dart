import 'package:flutter/cupertino.dart';

class AppColor {
  //convert color type from hex to type flutter
  static Color _colorfromHex(String hexcolor) {
    final _color = hexcolor.replaceAll('#', ''); //#ffffv -> ffff
    return Color(int.parse('ff$_color', radix: 16));
  }

  static Color bluedatelis = _colorfromHex('#a2e7f5');
  static Color darkmode = _colorfromHex('#3A3B3C');
  static Color darkmodecarddetails = _colorfromHex('#484848');
  static Color darkmodebodydetails = _colorfromHex('#303030');
  static Color lightmode = _colorfromHex('#456369');
  static Color maincolor = _colorfromHex('#ff992246');
  static Color blueDetailsBG = _colorfromHex('#a2e7f5');
  static Color darkMode = _colorfromHex('#3A3B3C');
  static Color darkModeCardDetails = _colorfromHex('#484848');
  static Color darkModeBodyDetails = _colorfromHex('#303030');
  static Color lightModeInstallBtn = _colorfromHex('#456369');
  static Color darkModeInstallBtn = _colorfromHex('#BB86FC');
  static Color lightModeUnInstallBtn = _colorfromHex('#e95f44');
  static Color darkModeUnInstallBtn = _colorfromHex('#FF0266');
  static Color lightModeToast = _colorfromHex('#90ee02');
  static Color darkModeToast = _colorfromHex('#BB86FC');
  static Color mb = _colorfromHex('#FF0266');

  /////////
  static const Color lightmodeloading = Color(0xff46b5f6);
  static const Color darkmodeloading = Color(0xffBB86FC);
}
