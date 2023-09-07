import 'package:banking_app/core/widgets/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Color(0xff3C382D),
              Colors.black,
              Colors.black,
              Colors.red,
              Colors.orangeAccent,
              Color(0xffECD670),
              Color(0xffECD670),
            ],
            radius: 1.4,
          ),
        ),
        child:Padding(
          padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: media.size.height*10/812,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.add),
                  StyleTextModel.items(text: 'Home', size: 15),
                  const CircleAvatar(
                    radius: 20,
                    foregroundImage: AssetImage('assets/png_images/myself.jpg'),
                  ),
                ],
              ),
              SizedBox(
                height:media.size.height* 50/812,
              ),
              StyleTextModel.items(text: 'Your Current Balance', size: 20,color: Colors.white),
              StyleTextModel.items(text: '\$1857,56', size: 60,color: Colors.white),
              SizedBox(
                height:media.size.height* 50/812,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
