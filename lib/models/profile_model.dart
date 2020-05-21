import 'package:equatable/equatable.dart';
import 'package:flutterapp2/data/moor_database.dart';
import 'package:meta/meta.dart';

class ProfileModel extends Equatable {
  /*final bool isMale;
  final int age;
  final int weight;
  final int height;
*/
  final List<Profile> profileAttributes;

  ProfileModel({
    @required this.profileAttributes
  });

  @override
  List<Object> get props => [
    profileAttributes
  ];
}