import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managment/bloc/counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    print("---------Build Parent---------");
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('You have pushed the button this many times:'),
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  return Text(
                    state.count
                        .toString(), // Accessing the count from the state
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () =>
                      context.read<CounterBloc>().add(IncrementEvent()),
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                const SizedBox(height: 10), // Add some space between buttons
                FloatingActionButton(
                  onPressed: () =>
                      context.read<CounterBloc>().add(DecrementEvent()),
                  child: const Icon(Icons.remove),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
