part of 'card_bloc.dart';

@immutable
class CardState extends Equatable {
  final CardStateStatus status;

  const CardState({this.status = CardStateStatus.initial});

  CardState copyWith({CardStateStatus? status}) {
    return CardState(status: status ?? this.status);
  }

  @override
  List<Object?> get props => [status];
}

enum CardStateStatus {
  loading,
  initial,
  cardAdded,
  cardUpdated,
  cardDeleted,
  cardFetched,
}
