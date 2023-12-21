import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  void increaseCounterBy(BuildContext context, [int value = 1]) =>
      context.read<CounterBloc>().add(CounterIncreased(value));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterBloc counterBloc) =>
            Text('BloC Counter: ${counterBloc.state.transactionCounter}')),
        actions: [
          IconButton(
            onPressed: () => context.read<CounterBloc>().add(CounterReset()),
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: Center(
        child: context.select((CounterBloc counterBloc) =>
            Text('Counter Value ${counterBloc.state.counter}')),
      ),
      floatingActionButton: Wrap(
        alignment: WrapAlignment.end,
        direction: Axis.vertical,
        spacing: 15,
        children: [
          FloatingActionButton(
            onPressed: () => increaseCounterBy(context, 3),
            heroTag: '1',
            child: const Text('+3'),
          ),
          FloatingActionButton(
            onPressed: () => increaseCounterBy(context, 3),
            heroTag: '2',
            child: const Text('+2'),
          ),
          FloatingActionButton(
            onPressed: () => increaseCounterBy(context),
            heroTag: '3',
            child: const Text('+1'),
          ),
        ],
      ),
    );
  }
}
