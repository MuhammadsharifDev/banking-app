import 'package:banking_app/core/widgets/elevatedbottom.dart';
import 'package:banking_app/core/widgets/textformfield.dart';
import 'package:banking_app/core/widgets/textstyle.dart';
import 'package:banking_app/core/widgets/toast_widget.dart';
import 'package:banking_app/presintation/main/addcard/widget/card_ui_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddCardPage extends StatefulWidget {
  AddCardPage({super.key});

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  TextEditingController CardNumberController = TextEditingController();

  TextEditingController CardUserController = TextEditingController();

  TextEditingController ValidityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: SweepGradient(
            colors: [
              Color(0xff3C382D),
              Colors.red,
              Colors.amber,
              Colors.deepOrange,
              Colors.black,
              Colors.brown,
              Colors.redAccent
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: media.size.height * 80 / 812,
                ),
                const CardUIWidget(),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: CardUserController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      getMyToast(message: 'Malumot yetarli emas');
                    }
                  },
                  decoration: InputDecorationModel.items(
                      hintext: 'Name', color: Colors.black26),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: CardNumberController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      getMyToast(message: 'Malumot yetarli emas');
                    }
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecorationModel.items(
                      hintext: 'Card Number', color: Colors.black26),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 100,
                  height: 50,
                  child: TextFormField(
                    controller: ValidityController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        getMyToast(message: 'Malumot yetarli emas');
                      }
                    },
                    keyboardType: TextInputType.phone,
                    decoration: InputDecorationModel.items(hintext: '  00/00  ' )
                  ),
                ),
                SizedBox(
                  height: media.size.height * 50 / 812,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.5),
                    minimumSize: const Size(double.infinity, 55),
                  ),
                  child: StyleTextModel.items(text: 'Add Card', size: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
