import 'package:banking_app/core/widgets/textstyle.dart';
import 'package:banking_app/presintation/main/cards/widget/title_listview_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 200,
        backgroundColor: Colors.grey,
        title: SizedBox(
          height: media.size.height * 150 / 812,
          child: const TitleListViewWidget(),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: SweepGradient(
            colors: [
              Colors.deepOrange,
              Colors.redAccent,
              Colors.black,
              Colors.indigo,
              Colors.grey,
              Colors.orange,
            ],
          ),
        ),
        child: Column(
          children: [
            StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('cards').snapshots(),
              builder: (context, snapshot) => Column(),
            )
          ],
        ),
      ),
    );
  }
}
