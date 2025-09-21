import 'package:action_labs/data/model/exchange_rate_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/exchange_api.dart';

part 'exchange_state.dart';

class ExchangeCubit extends Cubit<ExchangeState> {
  final ExchangeApi api;

  ExchangeCubit(this.api) : super(ExchangeInitial());

  Future<void> fetchExchange(String currency) async {
    emit(ExchangeLoading());
    try {
      final data = await api.getExchangeData(currency);
      emit(ExchangeLoaded(data));
    } catch (e) {
      emit(ExchangeError(e.toString()));
    }
  }
}
