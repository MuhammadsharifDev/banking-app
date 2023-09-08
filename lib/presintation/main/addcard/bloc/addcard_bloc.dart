import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'addcard_event.dart';
part 'addcard_state.dart';

class AddcardBloc extends Bloc<AddcardEvent, AddcardState> {
  AddcardBloc() : super(AddcardInitial()) {
    on<AddcardEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
