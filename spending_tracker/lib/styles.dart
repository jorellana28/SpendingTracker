import 'package:flutter/material.dart';

class Styles {
  static const _defaultFontFamily = "Open Sans Condensed";
  static const bool useCustomColors = false; // This will be edited per project
  static const _defaultColor = Colors.black;
  static const _defaultColorLight = Colors.black87;
  static const _defaultColorPrimaryColor = Colors.blueGrey;
  static const _defaultHeaderLrgFontSize = 29.0;
  static const _defaultHeaderSmallFontSize = 26.0;
  static const _defaultSubHeaderLrgFontSize = 24.0;
  static const _defaultSubHeaderSmallFontSize = 22.0;
  static const _defaultSectionTitleFontSize = 22.0;
  static const _defaultSectionSubTitleFontSize = 22.0;
  static const _defaultBodyTextFontSize = 21.0;
  static const _defaultFontWeight = FontWeight.normal;
  static const _defaultFontWeightLight = FontWeight.w100;
  static const _defaultFontWeightBold = FontWeight.bold;

  static const TextStyle headerLrgText = TextStyle(
    fontFamily: _defaultFontFamily,
    color: useCustomColors ? _defaultColor : null,
    fontSize: _defaultHeaderLrgFontSize,
    fontWeight: _defaultFontWeight,
  );

  static const TextStyle headerSmallText = TextStyle(
      fontFamily: _defaultFontFamily,
      color: useCustomColors ? _defaultColor : null,
      fontSize: _defaultHeaderSmallFontSize,
      fontWeight: _defaultFontWeightBold);

  static const TextStyle subHeaderLrgText = TextStyle(
      fontFamily: _defaultFontFamily,
      color: useCustomColors ? _defaultColorLight : null,
      fontSize: _defaultSubHeaderLrgFontSize,
      fontWeight: _defaultFontWeight);

  static const TextStyle subHeaderSmallText = TextStyle(
      fontFamily: _defaultFontFamily,
      color: useCustomColors ? _defaultColorPrimaryColor : null,
      fontSize: _defaultSubHeaderSmallFontSize,
      fontWeight: _defaultFontWeightLight);

  static const TextStyle sectionTitleText = TextStyle(
      fontFamily: _defaultFontFamily,
      color: useCustomColors ? _defaultColor : null,
      fontSize: _defaultSectionTitleFontSize,
      fontWeight: _defaultFontWeight);

  static const TextStyle sectionSubTitleText = TextStyle(
      fontFamily: _defaultFontFamily,
      color: useCustomColors ? _defaultColorPrimaryColor : null,
      fontSize: _defaultSectionSubTitleFontSize,
      fontWeight: _defaultFontWeight);

  static const TextStyle bodyText = TextStyle(
      fontFamily: _defaultFontFamily,
      color: useCustomColors ? _defaultColorLight : null,
      fontSize: _defaultBodyTextFontSize,
      fontWeight: _defaultFontWeight);
}
