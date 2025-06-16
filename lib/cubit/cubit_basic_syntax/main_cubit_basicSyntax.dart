import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managment/cubit/cubit_basic_syntax/counter_cubit.dart';
import 'package:state_managment/cubit/cubit_basic_syntax/counter_state.dart';

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
      create: (context) =>
          CounterCubit(), // create a new instance of CounterCubit
      // BlocProvider is a widget that provides a cubit to its children
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
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  //builder generate new build context that will be used to build the widget tree
                  print("---------Build child---------");

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
        floatingActionButton: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () => context.read<CounterCubit>().increment(),

                  //this will refresh the state and rebuild the widget
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                const SizedBox(height: 10), // Add some space between buttons
                FloatingActionButton(
                  onPressed: () => context
                      .read<CounterCubit>()
                      .decrement(), //using context.read to access the cubit and read is used to access the cubit without listening to the state changes
                  // context.watch<CounterCubit>().decrement(), // X-> this will listen to the state changes and rebuild the widget
                  tooltip: 'Decrement',
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
