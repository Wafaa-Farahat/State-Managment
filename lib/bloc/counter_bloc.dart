import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<IncrementEvent>((event, emit) {
      emit(CounterUpdate(state.count + 1));
    });

    on<DecrementEvent>(_decrement);

    on<ResetEvent>((event, emit) {
      event.resetValue; // Accessing the reset value from the event
      // Resetting the counter to the specified value
      emit(CounterUpdate(event.resetValue));
    });
  }

  FutureOr<void> _decrement(DecrementEvent event, Emitter<CounterState> emit) {
    emit(CounterUpdate(state.count - 1));
  }
}
