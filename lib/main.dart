import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:counter/state/counter_state.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: StateNotifierProvider<CounterStateNotifier, CounterState>(
      create: (_) => CounterStateNotifier(),
      child: MainPage(),
    ));
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CounterApp'),
      ),
      body: Center(
        child: Text(
          context.select<CounterState, int>((state) => state.count).toString(),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.read<CounterStateNotifier>().increment(),
        label: Text('Add'),
        icon: Icon(Icons.add),
      ),
    );
  }
}
