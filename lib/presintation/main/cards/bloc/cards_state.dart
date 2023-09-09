part of 'cards_bloc.dart';

@immutable

class CardsState extends Equatable{
  final bool isLike;
  const CardsState({this.isLike=false});
  CardsState copyWith({bool? isLike}){
    return CardsState(isLike:isLike??this.isLike);
  }

  @override
  List<Object?> get props => [isLike];

}
