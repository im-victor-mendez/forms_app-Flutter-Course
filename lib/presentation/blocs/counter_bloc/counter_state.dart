part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counter;
  final int transactionCounter;

  const CounterState({
    this.counter = 10,
    this.transactionCounter = 0,
  });

  @override
  List<Object> get props => [counter, transactionCounter];

  CounterState copyWith({
    int? counter,
    int? transactionCounter,
  }) =>
      CounterState(
        counter: counter ?? this.counter,
        transactionCounter: transactionCounter ?? this.transactionCounter,
      );
}
