import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'cards_event.dart';
part 'cards_state.dart';

class CardsBloc extends Bloc<CardsEvent, CardsState> {
  CardsBloc() : super(CardsState()) {
    on<IsLikeEvent>((event, emit) {
      emit(state.copyWith(isLike: event.isLike),);
    });
  }
}
