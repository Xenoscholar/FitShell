import 'package:equatable/equatable.dart';
import 'package:flutterapp2/data/moor_database.dart';
import 'package:flutterapp2/models/profile_model.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  const ProfileInitial();
  @override
  List<Object> get props => [];
}

class ProfileLoading extends ProfileState {
  const ProfileLoading();
  @override
  List<Object> get props => [];
}

class ProfileLoaded extends ProfileState {
  final  ProfileModel profileModel;
  const ProfileLoaded(this.profileModel);
  @override
  List<Object> get props => [profileModel];
}

class ProfileError extends ProfileState {
  final String message;
  const ProfileError(this.message);
  @override
  List<Object> get props => [message];
}