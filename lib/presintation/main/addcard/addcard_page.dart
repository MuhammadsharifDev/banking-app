import 'package:banking_app/core/widgets/elevatedbottom.dart';
import 'package:banking_app/core/widgets/textformfield.dart';
import 'package:banking_app/core/widgets/textstyle.dart';
import 'package:banking_app/core/widgets/toast_widget.dart';
import 'package:banking_app/data/model/card_model.dart';
import 'package:banking_app/presintation/auth/login/login_page.dart';
import 'package:banking_app/presintation/main/addcard/bloc/card_bloc.dart';
import 'package:banking_app/presintation/main/addcard/widget/card_ui_widget.dart';
import 'package:banking_app/route/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddCardPage extends StatefulWidget {
  AddCardPage({super.key});

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  TextEditingController cardNumberController = TextEditingController();

  TextEditingController cardUserController = TextEditingController();

  TextEditingController validityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return BlocListener<AddcardBloc, CardState>(
      listener: (context, state) {
      if(state.status==CardStateStatus.cardAdded){
        Navigator.pushNamed(context, RoutesName.home);
      }
      },
      child: Scaffold(
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
                    controller: cardUserController,
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
                    controller: cardNumberController,
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
                        controller: validityController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            getMyToast(message: 'Malumot yetarli emas');
                          }
                        },
                        keyboardType: TextInputType.phone,
                        decoration: InputDecorationModel.items(
                            hintext: '  00/00  ')
                    ),
                  ),
                  SizedBox(
                    height: media.size.height * 50 / 812,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (cardUserController.text.isNotEmpty &&
                          cardNumberController.text.isNotEmpty &&
                          validityController.text.isNotEmpty) {
                        context
                            .read<AddcardBloc>()
                            .add(AddCardEvent(cardModel: CardModel(
                          name: nameController.text,
                          cardNumber: cardNumberController.text,
                          validityCard: validityController.text,
                          cardId: '',
                        ),),);
                      }else{
                        getMyToast(message: "Ma'lumotlaringizni to'liq to'ldiring");
                      }
                    },
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
      ),
    );
  }
}
