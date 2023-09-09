part of 'getcard_cubit.dart';


abstract class GetCardState {}

class GetCardInitial extends GetCardState {}

class GetCardInLoading extends GetCardState {}

class GetCardInSuccess extends GetCardState {
  GetCardInSuccess({required this.card});

  final List<CardModel> card;
}