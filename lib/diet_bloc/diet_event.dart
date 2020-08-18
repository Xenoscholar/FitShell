import 'package:equatable/equatable.dart';

abstract class DietEvent extends Equatable {
  const DietEvent();
}

class GetBalancedDiet extends DietEvent {
  const GetBalancedDiet();
  @override
  List<Object> get props => [];
}


class GetLowFatDiet extends DietEvent {
  const GetLowFatDiet();
  @override
  List<Object> get props => [];
}

class GetLowCarbDiet extends DietEvent {
  const GetLowCarbDiet();
  @override
  List<Object> get props => [];
}


class GetHighProteinDiet extends DietEvent {
  const GetHighProteinDiet();
  @override
  List<Object> get props => [];
}