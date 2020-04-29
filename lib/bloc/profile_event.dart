import 'package:equatable/equatable.dart';


abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class GetProfile extends ProfileEvent {
  final bool isMale;
  final int age;
  final int weight;
  final int height;

  const GetProfile(this.isMale,this.age,this.weight,this.height);

  @override
  List<Object> get props => [isMale,age,weight,height];
}
