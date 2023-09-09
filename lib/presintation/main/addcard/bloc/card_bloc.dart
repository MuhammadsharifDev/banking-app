import 'dart:async';

import 'package:banking_app/data/model/card_model.dart';
import 'package:banking_app/data/repository/card_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'card_event.dart';
part 'card_state.dart';

class AddcardBloc extends Bloc<CardEvent, CardState> {
  AddcardBloc({required this.cardRepository}) : super(CardState()) {
    on<AddCardEvent>(_addCard);
    on<UpdateCardEvent>(_updateCard);
    on<DeleteEvent>(_deleteContact);

  }
  final CardRepository cardRepository;

  _addCard(AddCardEvent event,Emitter<CardState> emit)async{
    emit(state.copyWith(status: CardStateStatus.loading));
    cardRepository.addCard(cardModel: event.cardModel);
    emit(state.copyWith(status: CardStateStatus.cardAdded));
  }


  _updateCard(UpdateCardEvent event,Emitter<CardState>emit){
    emit(state.copyWith(status: CardStateStatus.loading));
    cardRepository.updateCard(cardModel: event.cardModel);
    emit(state.copyWith(status: CardStateStatus.cardUpdated));
  }

  _deleteContact(DeleteEvent event, Emitter<CardState> emit) async {
    emit(state.copyWith(status: CardStateStatus.loading));
    cardRepository.deleteCard(docId: event.cardId);
    emit(state.copyWith(status: CardStateStatus.cardDeleted));
  }

}
