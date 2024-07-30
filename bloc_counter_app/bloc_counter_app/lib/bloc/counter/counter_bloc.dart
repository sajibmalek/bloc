import 'package:bloc/bloc.dart';
import 'package:bloc_counter_app/bloc/counter/counter_events.dart';
import 'package:bloc_counter_app/bloc/counter/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<IncrementCounter>(_increment);
    on<DecrementCounter>(_decrement);
  }

  void _increment(IncrementCounter event, Emitter<CounterState> emit) {
    emit(state.copyWith(value: state.value + 1));
  }

  void _decrement(DecrementCounter event, Emitter<CounterState> emit) {

    emit(state.copyWith(value: state.value - 1));
  }
}
