# NumHelpers Extension for Dart/Flutter

`NumHelpers` is a Dart extension that is highly influenced by [https://laravel.com/docs/10.x/helpers#numbers](https://laravel.com/docs/10.x/helpers#numbers) provides convenient methods for formatting numbers in various ways, including abbreviations, human-readable formats, currency formatting, percentage formatting, and file size conversion. This extension is particularly useful in Flutter applications where such number formatting is a common requirement.

## Features

- `abbreviate`: Shortens large numbers into abbreviated forms (e.g., 1K, 1M, 1B).
- `forHumans`: Converts numbers into a human-readable format (e.g., '1 thousand', '2 million').
- `format`: Formats a number with specified precision and locale.
- `percentage`: Converts a number to a percentage string, with optional precision.
- `currency`: Formats numbers as currency, with options for different currency codes, locales, and symbol usage.
- `fileSize`: Converts byte counts into a human-readable file size format (e.g., KB, MB, GB).

## Installation

To use `NumHelpers` in your Dart/Flutter project, add it as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  numhelpers: ^1.0.0 # Use the latest version
```

## Usage

Import the `NumHelpers` extension in your Dart/Flutter file:

```dart
import 'package:numhelpers/numhelpers.dart';
```

### Abbreviate

The `abbreviate` method shortens large numbers into abbreviated forms (e.g., 1K, 1M, 1B).

```dart
print(1000.abbreviate()); // Outputs: 1K
print(1500.abbreviate()); // Outputs: 1.5K
print(500.abbreviate());  // Outputs: 500
```

### For Humans

The `forHumans` method converts numbers into a human-readable format (e.g., '1 thousand', '2 million').

```dart
print(1000.forHumans());       // Outputs: 1 thousand
print(2000000.forHumans());    // Outputs: 2 million
print(123456789.forHumans());  // Outputs: 123 million
```

### Format

The `format` method formats a number with specified precision and locale.

```dart
print(1234.56.format());               // Outputs: 1,234.56
print(1234.56.format(precision: 1));   // Outputs: 1,234.6
print(1234.0.format(maxPrecision: 2)); // Outputs: 1,234.00
```

### Percentage

The `percentage` method converts a number to a percentage string, with optional precision.

```dart
print(10.percentage());               // Outputs: 10%
print(10.percentage(precision: 2));   // Outputs: 10.00%
print(10.123.percentage(maxPrecision: 2)); // Outputs: 10.12%
```

### Currency

The `currency` method formats numbers as currency, with options for different currency codes, locales, and symbol usage.

```dart
print(1000.0.currency()); // Outputs: $1,000
print(1000.0.currency(currencyCode: 'EUR')); // Outputs: €1,000
print(1234.56.currency(currencyCode: 'USD')); // Outputs: $1,234.56
print(1234.5.currency(currencyCode: 'USD', useSymbol: false, precision: 2)); // Outputs: USD 1,234.50
print(1234.0.currency(currencyCode: 'EUR', locale: 'de', useSymbol: false, precision: 2)); // Outputs: 1.234,00 EUR
```

### File Size

The `fileSize` method converts byte counts into a human-readable file size format (e.g., KB, MB, GB).

```dart
print(1024.fileSize());          // Outputs: 1 KB
print(1048576.fileSize());       // Outputs: 1 MB
print(1073741824.fileSize());    // Outputs: 1 GB
print(1099511627776.fileSize()); // Outputs: 1 TB
```
