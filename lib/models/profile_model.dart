import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class ProfileModel extends Equatable {
  final bool isMale;
  final int age;
  final int weight;
  final int height;

  ProfileModel({
    @required this.isMale,
    @required this.age,
    @required this.weight,
    @required this.height
  });

  @override
  List<Object> get props => [
    isMale,
    age,
    weight,
    height
  ];
}