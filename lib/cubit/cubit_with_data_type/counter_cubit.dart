import 'package:flutter_bloc/flutter_bloc.dart';

//1-DT is int
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
  void increment() {
    emit(state + 1);
  }

  void decrement() {
    emit(state - 1);
  }
}

//2-DT is string
class CounterCubitS extends Cubit<String?> {
  CounterCubitS() : super(null);
  void increment() {
    emit("wafaa");
  }

  void decrement() {
    emit('farahat');
  }
}

//3-DT is string
class CounterCubitSL extends Cubit<List<String>?> {
  CounterCubitSL() : super(null);
  void increment() {
    emit(["wafaa", "farahat"]);
  }

  void decrement() {
    emit(['darwish']);
  }
}

//4-handle visibility of textField
class CounterCubitBool extends Cubit<bool> {
  CounterCubitBool() : super(false);

  // void visible() {
  //   emit(true);
  // }
  // void invisible() {
  //   emit(false);
  // }

  void toggle() {
    emit(!state);
    // it returns the opposite of the current state
  } //this is better syntax than visible and invisible methods

  //we can use it in the onPressed of the button
}
