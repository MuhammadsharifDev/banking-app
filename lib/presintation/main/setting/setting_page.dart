import 'package:banking_app/core/widgets/textstyle.dart';
import 'package:banking_app/route/routes_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var media=MediaQuery.of(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration:  const BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Color(0xff3C382D),
              Colors.black,
              Colors.red,
              Colors.white,
              Colors.orangeAccent,
              Color(0xffECD670),
              Color(0xffECD670),
            ],
            radius: 4,
          ),
        ),
        child: Column(
          children: [
             SizedBox(height: media.size.height*100/812,),
            ClipOval(
              child: Image.asset(
                'assets/png_images/myself.jpg',
                width: 200.0,
                height: 200.0,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: media.size.height*50/812,),
            ListTile(
              leading: const Icon(Icons.edit,color: Colors.white,),
              title: StyleTextModel.items(text: 'Edit Profile', size: 15,color: Colors.white),
              trailing: const Icon(Icons.arrow_forward_rounded,color: Colors.white,),
            ),
            ListTile(
              leading: const Icon(Icons.delete_sharp,color: Colors.white,),
              title: StyleTextModel.items(text: 'Delete', size: 15,color: Colors.white),
              trailing: const Icon(Icons.arrow_forward_rounded,color: Colors.white,),
            ),
            ListTile(
              onTap: ()  {
                 FirebaseAuth.instance.signOut();
              Navigator.pushNamedAndRemoveUntil(context, RoutesName.signup, (route) => false);
              },
              leading: const Icon(Icons.logout,color: Colors.white,),
              title: StyleTextModel.items(text: 'Delete', size: 15,color: Colors.white),
              trailing: const Icon(Icons.arrow_forward_rounded,color: Colors.white,),
            ),
          ],
        ),
      ),
    );
  }
}
