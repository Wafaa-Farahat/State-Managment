import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  //cubit provide getter is called state
  // it will return the current state of the cubit
  //Cubit<T> takes state as a generic type
  // CounterCubit(super.initialState); X-> bc we are using CounterState as the initial state
  CounterCubit()
    : super(
        const CounterInitial(),
      ); //once creat cubit ,it will take the initial value of the state
  void increment() {
    // CounterUpdate(state.count + 1); // X-> this is just creating a new instance of CounterUpdate but not emitting it
    // emit is a method that will update the state of the cubit
    // it will notify the listeners or the UI that the state has been updated
    // so we can use emit to update the state of the cubit

    // emit(state); // X-> this will not update the state, it will just emit the same state
    // so we need to create a new instance of CounterUpdate and pass the new count value
    emit(
      CounterUpdate(state.count + 1),
    ); //emit -> emit is observer , listeners or stream
  }

  void decrement() {
    emit(CounterUpdate(state.count - 1));
  }
}
