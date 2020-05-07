import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutterapp2/data/moor_database.dart';
import 'package:flutterapp2/models/profile_model.dart';
import 'bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AppDatabase appDatabase;

  ProfileBloc(this.appDatabase);

  @override
  ProfileState get initialState => ProfileInitial();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event,) async* {
    // TODO: Add Logic

    /*final profile = appDatabase.getAllProfiles();

    final myFuture = Future.value(appDatabase.getAllProfiles());*/

    yield ProfileLoading();
    // Branching the executed logic by checking the event type
    if (event is GetProfile) {
      // Emit either Loaded or Error
      try {
        final ProfileModel profileModel = ProfileModel(
            profileAttributes: appDatabase.getAllProfiles());
        yield ProfileLoaded(profileModel);
      } on Error {
        yield ProfileError(
            "Couldn't fetch profile data. Did you complete your profile?");
      }
    }
  }

}
