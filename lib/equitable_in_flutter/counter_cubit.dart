import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterInitial());
  void increment() {
    emit(CounterUpdate(5));
  }

  void decrement() {
    emit(CounterUpdate(5));
  }
}
