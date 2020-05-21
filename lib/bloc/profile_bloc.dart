import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterapp2/data/moor_database.dart';
import 'package:flutterapp2/models/profile_model.dart';
import 'bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AppDatabase appDatabase;
  ProfileLoaded profileLoaded;
  int teller;

  ProfileBloc(this.appDatabase);

  @override
  ProfileState get initialState => ProfileInitial();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event,) async* {
    // TODO: Add Logic

    /*final profile = appDatabase.getAllProfiles();

    final myFuture = Future.value(appDatabase.getAllProfiles());*/
/*

    yield ProfileLoading();
    // Branching the executed logic by checking the event type
    if (event is GetProfile) {
      // Emit either Loaded or Error
      */
/*try {
        final ProfileModel profileModel = ProfileModel(
            profileAttributes: appDatabase.getAllProfiles());*//*


        */
/*try {*//*

          FutureBuilder(
              future: appDatabase.getAllProfiles(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  */
/*throw Error();*//*

                  teller = 1;
                } else {
                  teller = 2;
                  final ProfileModel profileModel = ProfileModel(
                      profileAttributes: appDatabase.getAllProfiles());
                  profileLoaded = ProfileLoaded(profileModel);
                }
              }
          );
          */
/*if (profileLoaded == null) {

          } else {
            yield profileLoaded;
          }*//*


          try {

          if(teller == 1) {
             throw Error();
          } else if (teller == 2) {
            yield profileLoaded;
          }


          */
/*switch(profileLoaded == null) {
            case true: {

            }
            break;
            case false: {
              yield profileLoaded;
            }
            break;
          }*//*



        }on Error {
              yield ProfileError(
                  "Couldn't fetch profile data. Did you complete your profile?");

          }



      */
/*  yield ProfileLoaded(profileModel);
      } on Error {
        yield ProfileError(
            "Couldn't fetch profile data. Did you complete your profile?");
      }*//*

    }




*/





    yield ProfileLoading();
    // Branching the executed logic by checking the event type
    if (event is GetProfile) {
      // Emit either Loaded or Error
      try {
        final ProfileModel profileModel = ProfileModel(
            profileAttributes: await appDatabase.getAllProfiles());
        yield ProfileLoaded(profileModel);
      } on Error {
        yield ProfileError(
            "Couldn't fetch profile data. Did you complete your profile?");
      }
    }


  }


}
