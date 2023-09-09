import 'package:banking_app/core/widgets/textstyle.dart';
import 'package:banking_app/presintation/main/home/widget/stream_builder_widget.dart';
import 'package:banking_app/route/routes_name.dart';
import 'package:flutter/material.dart';


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
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white
                        ),
                        child: IconButton(onPressed: () {
                          Navigator.pushNamed(context, RoutesName.addcard);
                        }, icon: const Icon(Icons.add)),
                      ),
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
                const StreamBuilderWidget(),
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
                      ),
                      ),
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
