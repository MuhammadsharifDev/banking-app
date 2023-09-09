import 'package:banking_app/core/widgets/elevatedbottom.dart';
import 'package:banking_app/core/widgets/textformfield.dart';
import 'package:banking_app/core/widgets/textstyle.dart';
import 'package:banking_app/core/widgets/toast_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddCardPage extends StatefulWidget {
  const AddCardPage({super.key});

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  TextEditingController numberController = TextEditingController();
  TextEditingController validityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: StyleTextModel.items(text: 'Add Card', size: 30),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: media.size.height * 30 / 812,
            ),
            StyleTextModel.items(
                text: "Enter your card's information,", size: 12),
            SizedBox(
              height: media.size.height * 30 / 812,
            ),
            Container(
              height: 240,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: media.size.height * 20 / 812,
                    ),
                    StyleTextModel.items(
                        text: 'Card Number', size: 10, color: Colors.white),
                    TextFormField(
                      controller: numberController,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isNotEmpty) {
                          "Invalid Value";
                        }
                      },
                      decoration: InputDecorationModel.items(
                        hintext: '0000 0000 0000 0000',
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.qr_code_scanner_outlined),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: media.size.height * 20 / 812,
                    ),
                    StyleTextModel.items(
                        text: 'Validity period', size: 10, color: Colors.white),
                    SizedBox(
                      height: 60,
                      width: 150,
                      child: TextFormField(
                        controller: validityController,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            "Invalid Value";
                          }
                        },
                        decoration:
                            InputDecorationModel.items(hintext: ' OO/YY '),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: media.size.height * 20 / 812,
            ),
            ElevatedButton(
              onPressed: () {
                if (numberController.text.isNotEmpty &&
                    validityController.text.isNotEmpty) {
                  CollectionReference collRef =
                      FirebaseFirestore.instance.collection('cards');
                  collRef.add({
                    'cardnumber': numberController.text,
                    'validitycard': validityController.text,
                  });
                  Navigator.pop(context);
                  getMyToast(message: "Success to save");
                  numberController.clear();
                  validityController.clear();
                } else {
                  getMyToast(message: "not enought information");
                }
              },
              style: BottomStyle.items(),
              child: StyleTextModel.items(text: 'Continue', size: 15),
            ),
          ],
        ),
      ),
    );
  }
}
