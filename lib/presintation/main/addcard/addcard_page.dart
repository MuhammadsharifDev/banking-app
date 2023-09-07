import 'package:banking_app/core/widgets/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddCardPage extends StatelessWidget {
  const AddCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    var media=MediaQuery.of(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration:  const BoxDecoration(
         gradient:SweepGradient(
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
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
            children: [
              SizedBox(height: media.size.height*80/812,),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(20),
                   border: Border.all(color: Colors.brown),
                  gradient: const LinearGradient(
                    colors:[
                      Colors.black26,
                      Colors.deepPurpleAccent,
                      Colors.deepOrangeAccent,
                      Colors.lightGreen,
                    ],
                  ),
                ),
                child:  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.account_balance,color: Colors.white,),
                          SizedBox(
                              height: 30,
                              width: 30,
                              child: SvgPicture.asset('assets/svg_icons/wifi.svg')),

                        ],
                      ),
                      SizedBox(height: media.size.height*10/812,),
                      StyleTextModel.items(text: 'Debit Card', size: 20,color: Colors.white.withOpacity(0.5)),
                      SizedBox(height: media.size.height*10/812,),
                      StyleTextModel.items(text: '8600060445054530', size: 15,color: Colors.white),
                      StyleTextModel.items(text: 'Adom Shaefi   12/24', size: 10,color: Colors.white),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height:40,
                              width: 40,
                              child: SvgPicture.asset('assets/svg_icons/master_card.svg')),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
