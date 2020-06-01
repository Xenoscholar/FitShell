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



