import 'package:equatable/equatable.dart';

abstract class SystemState extends Equatable {
  const SystemState();
}

class InitialSystemState extends SystemState {
  @override
  List<Object> get props => [];
}

class MetricSystem extends SystemState {
  const MetricSystem();
  @override
  List<Object> get props => [];
}

class LoadingSystem extends SystemState {
  const LoadingSystem();
  @override
  List<Object> get props => [];
}

class ImperialSystem extends SystemState {
  const ImperialSystem();
  @override
  List<Object> get props => [];
}

class LoadedSystem extends SystemState {
  const LoadedSystem();
  @override
  List<Object> get props => [];
}

