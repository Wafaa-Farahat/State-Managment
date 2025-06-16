sealed class CounterState {
  final int count;
  const CounterState(this.count);
} //parent state

final class CounterInitial extends CounterState {
  // CounterInitial(super.count);
  const CounterInitial() : super(0);
}

final class CounterUpdate extends CounterState {
  // const CounterUpdate(int count) : super(count); // X-> we can use the shorthand syntax
  const CounterUpdate(
    super.count,
  ); //passing the count directly to the parent constructor
}
