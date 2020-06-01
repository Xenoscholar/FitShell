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
