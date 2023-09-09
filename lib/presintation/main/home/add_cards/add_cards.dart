import 'package:banking_app/core/widgets/elevatedbottom.dart';
import 'package:banking_app/core/widgets/textformfield.dart';
import 'package:banking_app/core/widgets/textstyle.dart';
import 'package:banking_app/core/widgets/toast_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: media.size.height*20/812,),
          Container(
            height: media.size.height * 220 / 812,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                  color: Colors.white.withOpacity(0.5),),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26, blurRadius: 10),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.account_balance,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: SvgPicture.asset(
                            'assets/svg_icons/wifi.svg'),
                      ),
                    ],
                  ),
                    TextFormField(
                      controller: numberController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  TextFormField(
                    controller: validityController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  ),
                  SizedBox(
                    height: media.size.height * 50 / 812,
                  ),
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                          'assets/svg_icons/master_card.svg'),
                    ],
                  )
                ],
              ),
            ),
          ),
              SizedBox(height: media.size.height*20/812,),
              TextFormField(
                controller: numberController,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value!.isNotEmpty) {
                    "Invalid Value";
                  }
                },
              maxLength: 16,
                decoration: InputDecorationModel.items(
                  hintext: '0000 0000 0000 0000',
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.qr_code_scanner_outlined),
                  ),
                ),
              ),
              SizedBox(height: media.size.height*20/812,),
               SizedBox(
                height: 80,width: 150,
               child:   TextFormField(
                 controller: validityController,
                 maxLength: 4,
                 keyboardType: TextInputType.phone,
                 validator: (value) {
                   if (value!.isNotEmpty) {
                     "Invalid Value";
                   }
                 },
                 decoration: InputDecorationModel.items(
                   hintext: '  OO/YY  ',
                 ),
               ),
              ),
              const SizedBox(height: 15,),
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
      ),
    );
  }
}
