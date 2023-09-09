import 'package:banking_app/core/widgets/textstyle.dart';
import 'package:banking_app/presintation/main/home/widget/listview_widget.dart';
import 'package:banking_app/route/routes_name.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: media.size.height * 10 / 812,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: () {
                        Navigator.pushNamed(context, RoutesName.cards);
                      }, icon: Icon(Icons.add)),
                      StyleTextModel.items(text: 'Home', size: 15),
                      const CircleAvatar(
                        radius: 20,
                        foregroundImage:
                        AssetImage('assets/png_images/myself.jpg'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: media.size.height * 50 / 812,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: StyleTextModel.items(
                      text: 'Your Current Balance',
                      size: 20,
                      color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: StyleTextModel.items(
                      text: '\$1857,56', size: 60, color: Colors.white),
                ),
                SizedBox(
                  height: media.size.height * 25 / 812,
                ),
                StreamBuilder(
                    stream: FirebaseFirestore.instance.collection('cards')
                        .snapshots(),
                    builder: (context, snapshot) {
                      List<ListTile> cardWidgets = [];
                      if(snapshot.hasData){
                        final cards=snapshot.data?.docs.reversed.toList();
                        for(var card in cards!){
                          final cardsWidget=ListTile(
                            title:StyleTextModel.items(text: card['cardnumber'], size: 10,color: Colors.white),
                            subtitle: StyleTextModel.items(text: card['validitycard'], size: 10,color: Colors.white),
                          );
                          cardWidgets.add(cardsWidget);
                        }
                      }
                      return  SizedBox(
                          height: media.size.height * 250 / 812,
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: cardWidgets.length,
                            itemBuilder: (context, index) =>
                                Container(
                                  width: 200,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.black26,
                                    borderRadius: BorderRadius.circular(15),
                                    border:
                                    Border.all(color: Colors.white.withOpacity(0.5)),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black26, blurRadius: 10),
                                    ],),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 10,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            const Icon(Icons.account_balance,
                                              color: Colors.white,),
                                            SizedBox(
                                                height: 30,
                                                width: 30,
                                                child: SvgPicture.asset(
                                                    'assets/svg_icons/wifi.svg')),

                                          ],
                                        ),
                                        SizedBox(
                                          height: media.size.height * 20 / 812,),
                                       cardWidgets[index],
                                        SizedBox(
                                          height: media.size.height * 50 / 812,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            SvgPicture.asset(
                                                'assets/svg_icons/master_card.svg'),
                                          ],
                                        )
                                      ],
                                    ),

                                  ),
                                ),
                            separatorBuilder: (context, index) =>
                                SizedBox(
                                  width: media.size.width * 15 / 375,
                                ),
                          )
                      );
                    }
                ),

                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StyleTextModel.items(
                          text: 'Transaction History',
                          size: 15,
                          color: Colors.white),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RoutesName.history);
                        },
                        child: StyleTextModel.items(
                            text: 'View all', size: 13, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: StyleTextModel.items(
                    text: 'Google Courses', size: 20,),
                ),
                const SizedBox(height: 10,),
                const Padding(
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('App Design Basics', style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontFamily: (''),
                      )),
                      Text('-\$149', style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: (''),
                      )),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Divider(),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: StyleTextModel.items(text: 'Microsoft', size: 20,),
                ),
                const SizedBox(height: 10,),
                const Padding(
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('App Design Basics', style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontFamily: (''),
                      )),
                      Text('-\$149', style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: (''),
                      )),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Divider(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
