import 'package:banking_app/core/utils/app_icons.dart';
import 'package:banking_app/core/widgets/elevatedbottom.dart';
import 'package:banking_app/core/widgets/textformfield.dart';
import 'package:banking_app/core/widgets/textstyle.dart';
import 'package:banking_app/presintation/auth/signup/bloc/signup_bloc.dart';
import 'package:banking_app/presintation/auth/signup/widgets/change_login_bottom.dart';
import 'package:banking_app/presintation/main/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return MainPage();
              } else {
                return Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.black,
                    toolbarHeight: 200,
                    shape: const OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(100),
                        bottomRight: Radius.circular(100),
                      ),
                    ),
                    title: StyleTextModel.items(
                        text: 'Creat\naccaunt', size: 30, color: Colors.white),
                    actions: [
                      SvgPicture.asset(AppIcons.appbar_icons),
                    ],
                  ),
                  body: SingleChildScrollView(
                    child: Form(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            SizedBox(
                              height: media.size.height * 56 / 812,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.name,
                              controller: nameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Ma'lumotingizni kiriting";
                                }
                                return null;
                              },
                              decoration: InputDecorationModel.items(
                                hintext: 'Enter your name',
                              ),
                            ),
                            SizedBox(
                              height: media.size.height * 16 / 812,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Ma'lumotingizni kiriting";
                                }
                                return null;
                              },
                              decoration: InputDecorationModel.items(
                                hintext: 'Enter your email',
                              ),
                            ),
                            SizedBox(
                              height: media.size.height * 16 / 812,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: passwordController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Ma'lumotingizni kiriting";
                                }
                                return null;
                              },
                              decoration: InputDecorationModel.items(
                                hintext: 'Enter your password',
                              ),
                            ),
                            SizedBox(
                              height: media.size.height * 25 / 812,
                            ),
                            ElevatedButton(
                              style: BottomStyle.items(),
                              onPressed: () {
                                if (nameController.text.isNotEmpty &&
                                    emailController.text.isNotEmpty &&
                                    passwordController.text.isNotEmpty) {
                                  context.read<SignupBloc>().add(RegstrEvent(
                                      password: passwordController.text,
                                      email: emailController.text),);
                                } else {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) =>
                                        StyleTextModel.items(
                                            text: "Malumotlar xato!!",
                                            size: 15,
                                            color: Colors.red),
                                  );
                                }
                              },
                              child: StyleTextModel.items(
                                  text: 'Create accaunt', size: 15),
                            ),
                            SizedBox(
                              height: media.size.height * 35 / 812,
                            ),
                            const ChangeLoginBottom(),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
            }
        );
      },
    );
  }
}
