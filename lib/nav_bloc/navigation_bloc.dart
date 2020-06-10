import 'package:bloc/bloc.dart';
import 'package:flutterapp2/pages/BmiNavPage.dart';
import 'package:flutterapp2/pages/bmrNavPage.dart';
import 'package:flutterapp2/pages/bodyFatNavPage.dart';
import 'package:flutterapp2/pages/calorieNavPage.dart';
import 'package:flutterapp2/pages/homeNavPage.dart';
import 'package:flutterapp2/pages/idealWeightNavPage.dart';
import 'package:flutterapp2/pages/profileNavPage.dart';
import 'package:flutterapp2/pages/weightNavPage.dart';



enum NavigationEvents {
  HomePageClickedEvent,
  ProfileClickedEvent,
  BmiClickedEvent,
  CalorieClickedEvent,
  BmrClickedEvent,
  IdealWeightClickedEvent,
  WeightClickedEvent,
  BodyFatClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => HomeNavPage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {

    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield HomeNavPage();
        break;
      case NavigationEvents.ProfileClickedEvent:
        yield ProfileNavPage();
        break;
      case NavigationEvents.BmiClickedEvent:
        yield BmiNavPage();
        break;
      case NavigationEvents.CalorieClickedEvent:
        yield CalorieNavPage();
        break;
      case NavigationEvents.BmrClickedEvent:
        yield BmrNavPage();
        break;
      case NavigationEvents.IdealWeightClickedEvent:
        yield IdealWeightNavPage();
        break;
      case NavigationEvents.WeightClickedEvent:
        yield WeightNavPage();
        break;
      case NavigationEvents.BodyFatClickedEvent:
        yield BodyFatNavPage();
        break;
    }
  }
}