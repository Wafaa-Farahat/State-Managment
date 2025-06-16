part of 'counter_bloc.dart';

sealed class CounterEvent {}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}

//test case to know the use of event
class ResetEvent extends CounterEvent {
  final int resetValue;
  ResetEvent(
    this.resetValue,
  ); // constructor to reset the counter to a specific value
}
