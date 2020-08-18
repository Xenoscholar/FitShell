import 'package:equatable/equatable.dart';

abstract class DietState extends Equatable {
  const DietState();
}

class InitialDietState extends DietState {
  @override
  List<Object> get props => [];
}

class BalancedDietState extends DietState {
  const BalancedDietState();
  @override
  List<Object> get props => [];
}

class LoadingDiet extends DietState {
  const LoadingDiet();
  @override
  List<Object> get props => [];
}

class LowFatDietState extends DietState {
  const LowFatDietState();
  @override
  List<Object> get props => [];
}

class LowCarbDietState extends DietState {
  const LowCarbDietState();
  @override
  List<Object> get props => [];
}

class HighProteinDietState extends DietState {
  const HighProteinDietState();
  @override
  List<Object> get props => [];
}
