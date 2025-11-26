import 'package:intl/intl.dart';

class CurrencyFormatter {
  CurrencyFormatter(this.currencyCode)
      : _format = NumberFormat.currency(
          name: currencyCode,
          locale: 'tr_TR',
          symbol: _currencySymbol(currencyCode),
        );

  final String currencyCode;
  final NumberFormat _format;

  String format(num value) => _format.format(value);

  static String _currencySymbol(String code) {
    switch (code) {
      case 'TRY':
        return '₺';
      case 'USD':
        return '\$';
      case 'EUR':
        return '€';
      case 'GBP':
        return '£';
      default:
        return code;
    }
  }
}





