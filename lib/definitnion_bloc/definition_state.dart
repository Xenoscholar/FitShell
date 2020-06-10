import 'package:equatable/equatable.dart';

abstract class DefinitionState extends Equatable {
  const DefinitionState();
}

class InitialDefinitionState extends DefinitionState {
  @override
  List<Object> get props => [];
}

class TrueDefinition extends DefinitionState {
  const TrueDefinition();
  @override
  List<Object> get props => [];
}

class LoadingDefinition extends DefinitionState {
  const LoadingDefinition();
  @override
  List<Object> get props => [];
}

class FalseDefinition extends DefinitionState {
  const FalseDefinition();
  @override
  List<Object> get props => [];
}
