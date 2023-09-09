part of 'cards_bloc.dart';

@immutable
abstract class CardsEvent {}
class IsLikeEvent extends CardsEvent{
  final bool isLike;
  IsLikeEvent({required this.isLike});

}

class DeleteDataEvent extends CardsEvent{

}