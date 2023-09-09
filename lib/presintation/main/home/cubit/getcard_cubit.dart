import 'package:banking_app/data/model/card_model.dart';
import 'package:banking_app/data/repository/card_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'getcard_state.dart';

class GetCardCubit extends Cubit<GetCardState>{

  final CardRepository cardRepository;
  GetCardCubit({required this.cardRepository}):super(GetCardInitial()){

  }
  fetchAllCard(){
    emit(GetCardInLoading());
    cardRepository.getAllCard().listen((List<CardModel>cards) {
      emit(GetCardInSuccess(card: cards),);
    });
  }

}
