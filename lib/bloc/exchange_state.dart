part of 'exchange_cubit.dart';

abstract class ExchangeState extends Equatable {
  const ExchangeState();

  @override
  List<Object?> get props => [];
}

class ExchangeInitial extends ExchangeState {}

class ExchangeLoading extends ExchangeState {}

class ExchangeLoaded extends ExchangeState {
  final ExchangeData data;
  const ExchangeLoaded(this.data);

  @override
  List<Object?> get props => [data];
}

class ExchangeError extends ExchangeState {
  final String message;
  const ExchangeError(this.message);

  @override
  List<Object?> get props => [message];
}
