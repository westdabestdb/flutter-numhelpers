import 'package:flutter_test/flutter_test.dart';

import 'package:numhelpers/numhelpers.dart';

void main() {
  group('abbreviate tests', () {
    test('Should abbreviate 1000 to 1K', () {
      expect(1000.abbreviate(), '1K');
    });

    test('Should abbreviate 1500 to 1.5K', () {
      expect(1500.abbreviate(), '1.5K');
    });

    test('Should not abbreviate 500', () {
      expect(500.abbreviate(), '500');
    });
  });

  group('forHumans tests', () {
    test('Should format 1000 as 1 thousand', () {
      expect(1000.forHumans(), '1 thousand');
    });

    test('Should format 2000000 as 2 million', () {
      expect(2000000.forHumans(), '2 million');
    });

    test('Should format 123456789 as 123 million', () {
      expect(123456789.forHumans(), '123 million');
    });
  });

  group('format tests', () {
    test('Should format 1234.56 correctly with no precision', () {
      expect(1234.56.format(), closeTo(1234.56, 0.01));
    });

    test('Should format 1234.56 with precision 1', () {
      expect(1234.56.format(precision: 1), closeTo(1234.6, 0.1));
    });

    test('Should format 1234 with maxPrecision 2', () {
      expect(1234.0.format(maxPrecision: 2), closeTo(1234.00, 0.01));
    });
  });

  group('percentage tests', () {
    test('Should format 10 as 10%', () {
      expect(10.percentage(), '10%');
    });

    test('Should format 10 with precision 2 as 10.00%', () {
      expect(10.percentage(precision: 2), '10.00%');
    });

    test('Should format 10.123 with maxPrecision 2 as 10.12%', () {
      expect(10.123.percentage(maxPrecision: 2), '10.12%');
    });
  });

  group('Currency tests', () {
    test('Should format 1000 as \$1,000 with default settings', () {
      expect(1000.0.currency(), '\$1,000');
    });

    test('Should format 1000 as €1,000 for EUR', () {
      expect(1000.0.currency(currencyCode: 'EUR'), '€1,000');
    });

    test('Should format 1234.56 as \$1,234.56 with USD and default precision',
        () {
      expect(1234.56.currency(currencyCode: 'USD'), '\$1,234.56');
    });

    test(
        'Should format 1234.5 as 1,234.50 USD without symbol and specified precision',
        () {
      expect(
          1234.5.currency(currencyCode: 'USD', useSymbol: false, precision: 2),
          'USD 1,234.50');
    });

    test(
        'Should format 1234 as 1.234,00 € for EUR in German locale without symbol',
        () {
      expect(
          1234.0.currency(
              currencyCode: 'EUR',
              locale: 'de',
              useSymbol: false,
              precision: 2),
          '1.234,00 EUR');
    });
  });

  group('File size tests', () {
    test('Should format 1024 bytes as 1 KB', () {
      expect(1024.fileSize(), '1 KB');
    });

    test('Should format 1048576 bytes as 1 MB', () {
      expect(1048576.fileSize(), '1 MB');
    });

    test('Should format 1073741824 bytes as 1 GB', () {
      expect(1073741824.fileSize(), '1 GB');
    });

    test('Should format 1099511627776 bytes as 1 TB', () {
      expect(1099511627776.fileSize(), '1 TB');
    });
  });
}
