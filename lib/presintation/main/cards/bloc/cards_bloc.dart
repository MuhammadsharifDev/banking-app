import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/widgets/toast_widget.dart';

part 'cards_event.dart';
part 'cards_state.dart';

class CardsBloc extends Bloc<CardsEvent, CardsState> {
  CardsBloc() : super(CardsState()) {
    on<IsLikeEvent>((event, emit) {
      emit(state.copyWith(isLike: event.isLike),);
    });
    on<DeleteDataEvent>((event, emit) async {
      await FirebaseFirestore.instance.collection('cards').doc().delete();
      getMyToast(message: 'Success Delete');
    });
  }

}
