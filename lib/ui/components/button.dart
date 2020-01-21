import 'package:flutter/material.dart';
import 'package:login_flow/services/screen_ratio.dart';
import 'package:login_flow/ui/components/loader.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final double textFontSize;
  final double borderRadius;
  final double borderWidth;
  final bool showLoader;
  final String buttonText;
  final Color borderColor;
  final Color bgColor;
  final Color textColor;
  final Function onTapFunction;

  CustomButton({
    @required this.buttonText,
    @required this.height,
    @required this.onTapFunction,
    this.bgColor = Colors.white,
    this.textColor = Colors.black,
    this.showLoader = false,
    this.borderWidth = 0,
    this.textFontSize,
    this.borderColor,
    this.width,
    this.borderRadius,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: !showLoader ? onTapFunction : null,
      child: Container(
        height: height,
        width: width ?? SizeConfig.screenWidth,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          border: Border.all(
              color: borderColor ?? bgColor,
              width: SizeConfig.getWidthRatio(borderWidth)),
        ),
        child: Center(
          child: !showLoader
              ? Text(
                  buttonText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textColor,
                    fontSize: textFontSize ?? SizeConfig.getFontRatio(12),
                  ),
                )
              : SizedBox(
                  height: height - SizeConfig.getHeightRatio(10),
                  width: height - SizeConfig.getWidthRatio(10),
                  child: CustomLoader(),
                ),
        ),
      ),
    );
  }
}
