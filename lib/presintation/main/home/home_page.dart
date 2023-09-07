import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 250,
            backgroundColor: Colors.black,
            actions: [
              ClipOval(
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.white,
                )
              ),
            ],
          ),
        ],
      ),
    );
  }
}
