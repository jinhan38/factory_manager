import 'package:flutter/material.dart';

class CustomButton {
  static Widget textButton({
    required Widget child,
    required VoidCallback? onPressed,
    EdgeInsets? padding = const EdgeInsets.all(0),
    double elevation = 0,
    Color backgroundColor = Colors.white,
    double roundedBorder = 5,
    Color? overlayColor,
    AlignmentGeometry? alignment,
    double radiusTopLeft = 0,
    double radiusTopRight = 0,
    double radiusBottomLeft = 0,
    double radiusBottomRight = 0,
    BorderSide? borderSide,
  }) {
    BorderRadius? borderRadius;

    if (radiusTopLeft > 0 ||
        radiusTopRight > 0 ||
        radiusBottomLeft > 0 ||
        radiusBottomRight > 0) {
      borderRadius = BorderRadius.only(
          topLeft: Radius.circular(radiusTopLeft),
          topRight: Radius.circular(radiusTopRight),
          bottomLeft: Radius.circular(radiusBottomLeft),
          bottomRight: Radius.circular(radiusBottomRight));
    }
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: overlayColor ?? Colors.grey.shade800,
        padding: padding,
        elevation: elevation,
        alignment: alignment,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: backgroundColor,
        side: borderSide ?? BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(roundedBorder),
        ),
      ),
      child: child,
    );
  }
}
