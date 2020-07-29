import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class SystemBloc extends Bloc<SystemEvent, SystemState> {
  @override
  SystemState get initialState => InitialSystemState();

  @override
  Stream<SystemState> mapEventToState(
    SystemEvent event,
  ) async* {
    // TODO: Add Logic

    yield MetricSystem();

    if (event is GetMetric) {
      yield MetricSystem();
      // Emit either Loaded or Error
    } else if (event is GetImperial) {
      yield ImperialSystem();
    }

  }
}
