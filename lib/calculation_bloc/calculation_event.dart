import 'package:equatable/equatable.dart';

abstract class CalculationEvent extends Equatable {
  const CalculationEvent();
}

class GetMacronutrients extends CalculationEvent {
  const GetMacronutrients();
  @override
  List<Object> get props => [];
}


class GetLeanBodyMass extends CalculationEvent {
  const GetLeanBodyMass();
  @override
  List<Object> get props => [];
}


class GetBodyFat extends CalculationEvent {
  const GetBodyFat();
  @override
  List<Object> get props => [];
}


class GetIdealWeight extends CalculationEvent {
  const GetIdealWeight();
  @override
  List<Object> get props => [];
}


class GetBmr extends CalculationEvent {
  const GetBmr();
  @override
  List<Object> get props => [];
}


class GetBmi extends CalculationEvent {
  const GetBmi();
  @override
  List<Object> get props => [];
}

class GetCaloricMaintanence extends CalculationEvent {
  const GetCaloricMaintanence();
  @override
  List<Object> get props => [];
}

//These are the extra calculations

class GetOneRepMax extends CalculationEvent {
  const GetOneRepMax();
  @override
  List<Object> get props => [];
}


class GetProteinIntake extends CalculationEvent {
  const GetProteinIntake();
  @override
  List<Object> get props => [];
}


class GetCreatineIntake extends CalculationEvent {
  const GetCreatineIntake();
  @override
  List<Object> get props => [];
}


class GetCaloricDeficit extends CalculationEvent {
  const GetCaloricDeficit();
  @override
  List<Object> get props => [];
}


class GetMacroSplit extends CalculationEvent {
  const GetMacroSplit();
  @override
  List<Object> get props => [];
}


class GetMaxHeartRate extends CalculationEvent {
  const GetMaxHeartRate();
  @override
  List<Object> get props => [];
}

class GetTargetHeartRate extends CalculationEvent {
  const GetTargetHeartRate();
  @override
  List<Object> get props => [];
}



