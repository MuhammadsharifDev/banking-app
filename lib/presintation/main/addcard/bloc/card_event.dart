part of 'card_bloc.dart';

@immutable
abstract class CardEvent {}
class AddCardEvent extends CardEvent{
  final CardModel cardModel;
  AddCardEvent({required this.cardModel});
  @override
  List<Object?> get props=>[cardModel];
}


class UpdateCardEvent extends CardEvent{
  final CardModel cardModel;
  UpdateCardEvent({required this.cardModel});
  @override
  List<Object?> get props=>[cardModel];
}

class DeleteEvent extends CardEvent{
  final String cardId;
  DeleteEvent({required this.cardId});
  @override
  List<Object?> get props=>[cardId];
}