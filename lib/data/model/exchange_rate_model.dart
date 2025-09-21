import 'package:action_labs/data/model/exchange_history_model.dart';
class ExchangeData {
  final String from;
  final String to;
  final double rate;
  final DateTime updatedAt;
  final List<ExchangeHistory> history;

  ExchangeData({
    required this.from,
    required this.to,
    required this.rate,
    required this.updatedAt,
    required this.history,
  });
}
