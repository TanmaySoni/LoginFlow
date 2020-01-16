import 'package:flutter/material.dart';

/// Call the following at app start
///
/// `SizeConfig sizeConfig = SizeConfig();`
///
/// inside 1st build method call the following 2 lines
/// `sizeConfig.init(context)`
/// `sizeConfig.setReferenceWidthAndHeight(375,812)`
///
/// After calling the above init method then you can use width and height as follows
///
/// `width = 100;` for dynamic behaviour use as follows
/// `width = SizeConfig.getWidthRatio(100);`
///
/// `height = 127;`
/// `height = SizeConfig.getHeightRatio(127);`
///
/// `fontSize = 18;`
/// `fontSize = SizeConfig.getFontRatio(18);`
///
class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;
  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;
  static double profileDrawerWidth;
  static double _refWidth;
  static double _refHeight;
  setReferenceWidthAndHeight(double w, double h) {
    _refWidth = w;
    _refHeight = h;
  }

  static double getWidthRatio(double val) {
    double res = (val / _refWidth) * 100;
    double temp = res * blockSizeHorizontal;
    return temp;
  }

  static double getHeightRatio(double val) {
    double res = (val / _refHeight) * 100;
    double temp = res * blockSizeVertical;
    return temp;
  }

  static double getFontRatio(double val) {
    double res = (val / _refWidth) * 100;
    double temp = 0.0;
    if (screenWidth < screenHeight) {
      temp = res * safeBlockHorizontal;
    } else {
      temp = res * safeBlockVertical;
    }
    return temp;
  }

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    if (screenHeight < 1000) {
      blockSizeHorizontal = screenWidth / 100;
      blockSizeVertical = screenHeight / 100;
      _safeAreaHorizontal =
          _mediaQueryData.padding.left + _mediaQueryData.padding.right;
      _safeAreaVertical =
          _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
      safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
      safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
    } else {
      blockSizeHorizontal = screenWidth / 120;
      blockSizeVertical = screenHeight / 120;
      _safeAreaHorizontal =
          _mediaQueryData.padding.left + _mediaQueryData.padding.right;
      _safeAreaVertical =
          _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
      safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 120;
      safeBlockVertical = (screenHeight - _safeAreaVertical) / 120;
    }
  }
}
