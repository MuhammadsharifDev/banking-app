import 'package:banking_app/core/widgets/textstyle.dart';
import 'package:banking_app/presintation/main/cards/bloc/cards_bloc.dart';
import 'package:banking_app/presintation/main/cards/widget/title_listview_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardsPage extends StatefulWidget {
  const CardsPage({super.key});

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

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
        child: BlocProvider(
          create: (context) => CardsBloc(),
          child: BlocBuilder<CardsBloc, CardsState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: [
                    StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('cards')
                          .snapshots(),
                      builder: (context, snapshot){
                        List<ListTile> allcards = [];
                        if (snapshot.hasData) {
                          final cards = snapshot.data?.docs.reversed.toList();
                          for (var card in cards!) {
                            final allcard = ListTile(
                              title: StyleTextModel.items(
                                  text: card['cardnumber'],
                                  size: 15,
                                  color: Colors.white),
                              subtitle: StyleTextModel.items(
                                  text: card['validitycard'],
                                  size: 15,
                                  color: Colors.white),
                            );
                            allcards.add(allcard);
                          }
                        }
                        return Expanded(
                          child: ListView.separated(
                            scrollDirection: Axis.vertical,
                            itemCount: allcards.length,
                            itemBuilder: (context, index) {
                              return Container(
                                height: media.size.height * 250 / 812,
                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: Colors.white.withOpacity(0.5)),
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
                                      SizedBox(
                                        height: media.size.height * 20 / 812,
                                      ),
                                      allcards[index],
                                      SizedBox(
                                        height: media.size.height * 20 / 812,
                                      ),
                                      Stack(
                                        children: [
                                        IconButton(onPressed: (){
                                          setState(() {

                                          });
                                        }, icon: const Icon(Icons.delete,color: Colors.red,),),
                                        ],
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
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 10,
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
