import 'package:flutter/material.dart';
import 'package:revive/core/utils/size_utils.dart';
import 'package:revive/theme/theme_helper.dart';
import '../core/app_export.dart';

extension on TextStyle {
  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get lexend {
    return copyWith(
      fontFamily: 'Lexend',
    );
  }
}

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.
class CustomTextStyles {
  // Body text style
  static get bodySmall11 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 11.fSize,
      );
  static get bodySmall12 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 12.fSize,
      );
  static get bodySmallBlack900 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black900.withOpacity(0.61),
        fontSize: 11.fSize,
      );
  static get bodySmallBlack90011 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black900.withOpacity(0.85),
        fontSize: 11.fSize,
      );
  static get bodySmallBlack90011_1 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black900,
        fontSize: 11.fSize,
      );
  static get bodySmallBlack900_1 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black900.withOpacity(0.76),
      );
  static get bodySmallGray400 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray400,
        fontSize: 11.fSize,
      );
  static get bodySmallPrimary => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 11.fSize,
      );

  static get bodySmallGreen600 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.green600,
        fontSize: 10.fSize,
      );
// Label text style

  static get labelLarge => theme.textTheme.labelLarge!.copyWith(
        fontSize: 13.fSize,
      );

  static get labelLargeLexend => theme.textTheme.labelLarge!.lexend.copyWith(
        fontSize: 13.fSize,
        fontWeight: FontWeight.w600,
      );

  static get labelLargeLexendGray600 =>
      theme.textTheme.labelLarge!.lexend.copyWith(
        color: appTheme.gray600,
        fontSize: 13.fSize,
      );
  static get labelLargePrimary => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeSemiBold => theme.textTheme.labelLarge!.copyWith(
        fontSize: 13.fSize,
        fontWeight: FontWeight.w600,
      );
// Title text style
  static get titleMedium => theme.textTheme.titleMedium!;

  static get titleLargePrimary => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 21.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallSemiBold => theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get titleMediumPoppins => theme.textTheme.titleMedium!.poppins;

  static get titleSmallWhiteA700 => theme.textTheme.titleSmall!.copyWith(
        color: Colors.white,
      );

// Lexend text style
  static get lexendBlack900 => TextStyle(
        color: appTheme.black900,
        fontSize: 7.fSize,
        fontWeight: FontWeight.w400,
      ).lexend;
}
