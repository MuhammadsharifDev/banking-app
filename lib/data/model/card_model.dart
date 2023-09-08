class CardModel {
  final String cardId;
  final String name;
  final String cardNumber;
  final String validityCard;

  CardModel({required this.name,
    required this.cardNumber,
    required this.cardId,
    required this.validityCard});

  factory CardModel.fromJson(Map<String, dynamic> json){
    return CardModel(name: json['name'],
        cardId: json['cardId'],
        cardNumber: json['cardNumber'],

        validityCard: json['validityCard']);
  }
  Map<String,dynamic> toJson(){
    return{
      name:"name",
      cardId:'cardId',
      cardNumber:"cardNumber",
      validityCard:"validityCard",
    };
  }
}
