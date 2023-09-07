import 'package:banking_app/core/utils/app_icons.dart';
import 'package:banking_app/core/widgets/elevatedbottom.dart';
import 'package:banking_app/core/widgets/textformfield.dart';
import 'package:banking_app/core/widgets/textstyle.dart';
import 'package:banking_app/presintation/auth/login/bloc/login_bloc.dart';
import 'package:banking_app/presintation/auth/login/widget/change_signup_page.dart';
import 'package:banking_app/presintation/auth/signup/widgets/change_login_bottom.dart';
import 'package:banking_app/presintation/main/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _SignupPageState();
}

TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _SignupPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapshot) {
            if(snapshot.hasData){
              return MainPage();
            }else{
              return Scaffold(
                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                  child: Form(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          SizedBox(
                            height: media.size.height * 56 / 812,
                          ),
                          SvgPicture.asset('assets/svg_icons/appbars_icon.svg'),
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
                            onPressed: () {},
                            child: StyleTextModel.items(text: 'Login', size: 15),
                          ),
                          SizedBox(
                            height: media.size.height * 35 / 812,
                          ),
                          const ChangeSignupBottom(),
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
