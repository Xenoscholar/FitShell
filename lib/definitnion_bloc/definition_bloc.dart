import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class DefinitionBloc extends Bloc<DefinitionEvent, DefinitionState> {
  @override
  DefinitionState get initialState => FalseDefinition();


  @override
  Stream<DefinitionState> mapEventToState(DefinitionEvent event,) async* {
    // TODO: Add Logic


    // Branching the executed logic by checking the event type
    if (event is GetDefinition) {
      yield TrueDefinition();
      // Emit either Loaded or Error
    } else if (event is RemoveDefinition) {
      yield FalseDefinition();
    }
  }


}
