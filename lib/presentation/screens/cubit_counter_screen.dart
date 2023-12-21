import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    // // Way 2 to print state data
    // final counterState = context.watch<CounterCubit>().state;

    return Scaffold(
      appBar: AppBar(
        // 3rd way to consume state data
        title: context.select((CounterCubit value) =>
            Text('Cubit Counter: ${value.state.transactionCount}')),
        actions: [
          IconButton(
            onPressed: () => context.read<CounterCubit>().reset(),
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: Center(
        // Way 1 to print state data
        child: BlocBuilder<CounterCubit, CounterState>(
          // buildWhen: (previous, current) => current.counter != previous.counter,
          builder: (context, state) {
            return Text('Counter Value ${state.counter}');
          },
        ),
      ),
      floatingActionButton: Wrap(
        alignment: WrapAlignment.end,
        direction: Axis.vertical,
        spacing: 15,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().increaseBy(3),
            heroTag: '1',
            child: const Text('+3'),
          ),
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().increaseBy(2),
            heroTag: '2',
            child: const Text('+2'),
          ),
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().increaseBy(1),
            heroTag: '3',
            child: const Text('+1'),
          ),
        ],
      ),
    );
  }
}
