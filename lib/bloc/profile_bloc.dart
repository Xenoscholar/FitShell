import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutterapp2/data/moor_database.dart';
import 'bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AppDatabase appDatabase = AppDatabase();

  @override
  ProfileState get initialState => InitialProfileState();

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    // TODO: Add Logic

    final profile = appDatabase.getProfile(); 
    
    appDatabase.select()

  }
}
