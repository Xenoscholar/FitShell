import 'package:equatable/equatable.dart';

abstract class CalculationState extends Equatable {
  const CalculationState();
}

class InitialCalculationState extends CalculationState {
  const InitialCalculationState();
  @override
  List<Object> get props => [];
}

class BmrCalculation extends CalculationState {
  const BmrCalculation();
  @override
  List<Object> get props => [];
}

class LoadingCalculation extends CalculationState {
  const LoadingCalculation();
  @override
  List<Object> get props => [];
}

class LeanBodyMassCalculation extends CalculationState {
  const LeanBodyMassCalculation();
  @override
  List<Object> get props => [];
}

class MacronutrientsCalculation extends CalculationState {
  const MacronutrientsCalculation();
  @override
  List<Object> get props => [];
}

class CaloricMaintenanceCalculation extends CalculationState {
  const CaloricMaintenanceCalculation();
  @override
  List<Object> get props => [];
}

class IdealWeightCalculation extends CalculationState {
  const IdealWeightCalculation();
  @override
  List<Object> get props => [];
}

class BodyFatCalculation extends CalculationState {
  const BodyFatCalculation();
  @override
  List<Object> get props => [];
}

class BmiCalculation extends CalculationState {
  const BmiCalculation();
  @override
  List<Object> get props => [];
}


//These are the extra calculations


class OneRepMaxCalculation extends CalculationState {
  const OneRepMaxCalculation();
  @override
  List<Object> get props => [];
}

class ProteinIntakeCalculation extends CalculationState {
  const ProteinIntakeCalculation();
  @override
  List<Object> get props => [];
}

class CreatineIntakeCalculation extends CalculationState {
  const CreatineIntakeCalculation();
  @override
  List<Object> get props => [];
}

class CalorieDeficitCalculation extends CalculationState {
  const CalorieDeficitCalculation();
  @override
  List<Object> get props => [];
}

class MacroSplitCalculation extends CalculationState {
  const MacroSplitCalculation();
  @override
  List<Object> get props => [];
}

class MaxHeartRateCalculation extends CalculationState {
  const MaxHeartRateCalculation();
  @override
  List<Object> get props => [];
}

class TargetHeartRateCalculation extends CalculationState {
  const TargetHeartRateCalculation();
  @override
  List<Object> get props => [];
}
