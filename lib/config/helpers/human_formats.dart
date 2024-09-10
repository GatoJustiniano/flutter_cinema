import 'package:intl/intl.dart';

class HumanFormats {
  static String number(double number, [int decimals = 0]) {
    final formattedNumber = NumberFormat.compactCurrency(
            decimalDigits: decimals, symbol: '', locale: 'en')
        .format(number);
    return formattedNumber;
  }

  static String numberWith2decimal(double number) {
    final formatterNumber = NumberFormat.compactCurrency(
      decimalDigits: 2,
      symbol: '',
      locale: 'en',
    ).format(number);

    return formatterNumber;
  }
}
