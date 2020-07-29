import 'package:equatable/equatable.dart';

abstract class SystemEvent extends Equatable {
  const SystemEvent();
}

class GetMetric extends SystemEvent {
  const GetMetric();
  @override
  List<Object> get props => [];
}


class GetImperial extends SystemEvent {
  const GetImperial();
  @override
  List<Object> get props => [];
}