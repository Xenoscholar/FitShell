import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class DietBloc extends Bloc<DietEvent, DietState> {
  @override
  DietState get initialState => BalancedDietState();

  @override
  Stream<DietState> mapEventToState(
    DietEvent event,
  ) async* {
    // TODO: Add Logic

    if (event is GetBalancedDiet) {
      yield BalancedDietState();
      // Emit either Loaded or Error
    } else if (event is GetLowCarbDiet) {
      yield LowCarbDietState();
    } else if (event is GetLowFatDiet) {
      yield LowFatDietState();
    } else if (event is GetHighProteinDiet) {
      yield HighProteinDietState();
    }


  }
}
