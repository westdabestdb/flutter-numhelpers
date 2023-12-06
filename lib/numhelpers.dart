library numhelpers;

import 'package:intl/intl.dart';

extension NumHelpers on num {
  String abbreviate() {
    if (this < 1000) {
      return '$this';
    } else if (this < 1e6) {
      // 1 million
      return '${(this / 1e3).toStringAsFixed(this % 1e3 == 0 ? 0 : 1)}K';
    } else if (this < 1e9) {
      // 1 billion
      return '${(this / 1e6).toStringAsFixed(this % 1e6 == 0 ? 0 : 1)}M';
    } else if (this < 1e12) {
      // 1 trillion
      return '${(this / 1e9).toStringAsFixed(this % 1e9 == 0 ? 0 : 1)}B';
    } else if (this < 1e15) {
      // 1 quadrillion
      return '${(this / 1e12).toStringAsFixed(this % 1e12 == 0 ? 0 : 1)}T';
    } else if (this < 1e18) {
      // 1 quintillion
      return '${(this / 1e15).toStringAsFixed(this % 1e15 == 0 ? 0 : 1)}Q';
    } else {
      return '${(this / 1e18).toStringAsFixed(this % 1e18 == 0 ? 0 : 1)}S';
    }
  }

  String forHumans({int precision = 0}) {
    if (this < 1000) {
      return '$this';
    } else if (this < 1e6) {
      // 1 million
      return '${(this / 1e3).toStringAsFixed(precision)} thousand';
    } else if (this < 1e9) {
      // 1 billion
      return '${(this / 1e6).toStringAsFixed(precision)} million';
    } else if (this < 1e12) {
      // 1 trillion
      return '${(this / 1e9).toStringAsFixed(precision)} billion';
    } else if (this < 1e15) {
      // 1 quadrillion
      return '${(this / 1e12).toStringAsFixed(precision)} trillion';
    } else if (this < 1e18) {
      // 1 quintillion
      return '${(this / 1e15).toStringAsFixed(precision)} quadrillion';
    } else {
      return '${(this / 1e18).toStringAsFixed(precision)} quintillion';
    }
  }

  num format({int? precision, int? maxPrecision, String? locale}) {
    NumberFormat numberFormat = NumberFormat.decimalPattern(locale ?? 'en');

    if (precision != null) {
      numberFormat.minimumFractionDigits = precision;
      numberFormat.maximumFractionDigits = precision;
    } else if (maxPrecision != null) {
      numberFormat.maximumFractionDigits = maxPrecision;
    }

    return double.tryParse(numberFormat.format(this)) ?? this;
  }

  String percentage({int? precision, int? maxPrecision, String? locale}) {
    NumberFormat numberFormat;
    if (locale != null) {
      numberFormat = NumberFormat.percentPattern(locale);
    } else {
      numberFormat = NumberFormat.percentPattern();
    }

    if (precision != null) {
      numberFormat.minimumFractionDigits = precision;
      numberFormat.maximumFractionDigits = precision;
    } else if (maxPrecision != null) {
      numberFormat.maximumFractionDigits = maxPrecision;
    }

    return numberFormat.format(this / 100);
  }

  String currency(
      {String currencyCode = 'USD',
      String? locale,
      bool useSymbol = true,
      int? precision}) {
    NumberFormat numberFormat;

    // Determine the locale for formatting
    String effectiveLocale = locale ?? Intl.defaultLocale ?? 'en_US';

    if (useSymbol) {
      // Use currency format with symbol
      numberFormat = NumberFormat.simpleCurrency(
          locale: effectiveLocale, name: currencyCode);
    } else {
      // Use decimal format without the currency symbol
      numberFormat = NumberFormat.decimalPattern(effectiveLocale);
    }

    // Apply precision settings if specified
    if (precision != null) {
      numberFormat.minimumFractionDigits = precision;
      numberFormat.maximumFractionDigits = precision;
    } else {
      // Adjust precision based on whether the number is a whole number
      numberFormat.minimumFractionDigits = 0;
      numberFormat.maximumFractionDigits = this % 1 == 0 ? 0 : 2;
    }

    String formatted = numberFormat.format(this);

    // Handling currency code placement based on locale
    if (!useSymbol) {
      if (effectiveLocale.startsWith('en_')) {
        formatted = '$currencyCode $formatted';
      } else {
        formatted = '$formatted $currencyCode';
      }
    }

    return formatted;
  }

  String fileSize({int precision = 0}) {
    const int scale = 1024;
    const List<String> units = [
      'B',
      'KB',
      'MB',
      'GB',
      'TB',
      'PB',
      'EB',
      'ZB',
      'YB'
    ];

    double size = toDouble();
    int unitIndex = 0;

    while (size >= scale && unitIndex < units.length - 1) {
      size /= scale;
      unitIndex++;
    }

    return '${size.toStringAsFixed(precision)} ${units[unitIndex]}';
  }
}
