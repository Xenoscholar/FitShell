import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class CalculationBloc extends Bloc<CalculationEvent, CalculationState> {
  @override
  CalculationState get initialState => BmiCalculation();

  @override
  Stream<CalculationState> mapEventToState(
    CalculationEvent event,
  ) async* {
    // TODO: Add Logic

    yield LoadingCalculation();
    // Branching the executed logic by checking the event type
    if (event is GetBodyFat) {
      yield BodyFatCalculation();
      // Emit either Loaded or Error


    } else if (event is GetBmr) {
      yield BmrCalculation();
    }else if (event is GetBmi) {
      yield BmiCalculation();
    }else if (event is GetIdealWeight) {
      yield IdealWeightCalculation();

    }else if (event is GetLeanBodyMass) {
      yield LeanBodyMassCalculation();

    }else if (event is GetMacronutrients) {
      yield MacronutrientsCalculation();

    }else if (event is GetCaloricMaintanence) {
      yield CaloricMaintenanceCalculation();

    }





  }
}
