import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:action_labs/data/model/exchange_history_model.dart';
import 'package:action_labs/data/model/exchange_rate_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ExchangeApi {
  static const String _baseUrl =
      "https://api-brl-exchange.actionlabs.com.br/api/1.0/open";
  static final String _apiKey = dotenv.env['API_KEY'] ?? '';
  Future<ExchangeData> getExchangeData(String currency) async {
    late String from;
    late String to;
    late double rate;
    late DateTime updatedAt;
    List<ExchangeHistory> history = [];

    final currentUrl = Uri.parse(
      "$_baseUrl/currentExchangeRate?apiKey=$_apiKey&from_symbol=BRL&to_symbol=$currency",
    );

    final currentResponse = await http.get(currentUrl);
    if (currentResponse.statusCode != 200) {
      throw Exception(
        "Erro ao buscar taxa atual: ${currentResponse.statusCode}",
      );
    }

    final Map<String, dynamic> currentData =
        jsonDecode(currentResponse.body) as Map<String, dynamic>;
    if (currentData["success"] != true) {
      throw Exception("Resposta inválida da API (taxa atual)");
    }

    rate = (currentData["exchangeRate"] as num).toDouble();
    from = currentData["fromSymbol"] as String;
    to = currentData["toSymbol"] as String;
    updatedAt = DateTime.parse(currentData["lastUpdatedAt"] as String);

    final historyUrl = Uri.parse(
      "$_baseUrl/dailyExchangeRate?apiKey=$_apiKey&from_symbol=BRL&to_symbol=$currency&days=30",
    );

    final historyResponse = await http.get(historyUrl);
    if (historyResponse.statusCode == 200) {
      final historyDataRaw = jsonDecode(historyResponse.body);
      if (historyDataRaw is Map<String, dynamic> &&
          historyDataRaw["success"] == true) {
        final List<dynamic>? rawList = historyDataRaw["data"] as List<dynamic>?;
        if (rawList != null) {
          history = rawList
              .map((e) => ExchangeHistory.fromJson(e as Map<String, dynamic>))
              .toList();
          _calculateCloseDiff(history);
        }
      }
    }

    return ExchangeData(
      from: from,
      to: to,
      rate: rate,
      updatedAt: updatedAt,
      history: history,
    );
  }

  void _calculateCloseDiff(List<ExchangeHistory> list) {
    for (int i = 1; i < list.length; i++) {
      final prev = list[i - 1].close;
      final curr = list[i].close;
      list[i].closeDiff = prev != 0 ? ((curr - prev) / prev) * 100 : 0.0;
    }
  }
}
