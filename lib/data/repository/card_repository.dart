import 'package:banking_app/core/widgets/toast_widget.dart';
import 'package:banking_app/data/model/card_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CardRepository {
  final FirebaseFirestore firestore;

  CardRepository({required this.firestore});

  ///_________________CREATE CARD________________

  Future<void> addCard({required CardModel cardModel}) async {
    try {
      DocumentReference newCard =
          await firestore.collection('cards').add(cardModel.toJson());
      firestore
          .collection('cards')
          .doc(newCard.id)
          .update({'cardId': newCard.id});
      getMyToast(message: "Contact Muavaffaqiyatli saqlandi");
    } on FirebaseException catch (e) {
      getMyToast(message: e.message.toString());
    }
  }

  ///________________READ CARD___________________________

  Stream<List<CardModel>> getAllContacts() =>
      firestore.collection("cards").snapshots().map((querySnapshot) =>
          querySnapshot.docs.map((e) => CardModel.fromJson(e.data())).toList());

  /// ------------------------- UPDATE CARD -------------------------

  Future<void> updateCard({required CardModel cardModel}) async {
    try {
      await firestore
          .collection("cards")
          .doc(cardModel.cardId)
          .update(cardModel.toJson());
      getMyToast(message: "Contact muvaffaqiyatli yangilandi!");
    } on FirebaseException catch (e) {
      getMyToast(message: e.message.toString());
    }
  }

  ///_____________________DELETE CARD_______________________

  Future<void> deleteCard({required String docId}) async {
    try {
      await firestore.collection("cards").doc(docId).delete();
      getMyToast(message: "Carta muvaffaqiyatli o'chirildi");
    } on FirebaseException catch (e) {
      getMyToast(message: e.message.toString());
    }
  }
}
