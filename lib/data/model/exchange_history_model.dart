class ExchangeHistory {
  final DateTime date;
  final double open;
  final double close;
  final double high;
  final double low;
  double? closeDiff;

  ExchangeHistory({
    required this.date,
    required this.open,
    required this.close,
    required this.high,
    required this.low,
    this.closeDiff,
  });

  factory ExchangeHistory.fromJson(Map<String, dynamic> json) {
    return ExchangeHistory(
      date: json["date"] != null
          ? DateTime.parse(json["date"] as String)
          : DateTime.now(),
      open: (json["open"] as num?)?.toDouble() ?? 0.0,
      close: (json["close"] as num?)?.toDouble() ?? 0.0,
      high: (json["high"] as num?)?.toDouble() ?? 0.0,
      low: (json["low"] as num?)?.toDouble() ?? 0.0,
    );
  }

}
