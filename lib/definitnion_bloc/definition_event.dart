import 'package:equatable/equatable.dart';

abstract class DefinitionEvent extends Equatable {
  const DefinitionEvent();
}


class GetDefinition extends DefinitionEvent {
  const GetDefinition();
  @override
  List<Object> get props => [];
}


class RemoveDefinition extends DefinitionEvent {
  const RemoveDefinition();
  @override
  List<Object> get props => [];
}