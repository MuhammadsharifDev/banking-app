import 'package:banking_app/core/widgets/textstyle.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff25242B),
         appBar: AppBar(
           backgroundColor: Color(0xff25242B),
           elevation: 10,
           title: StyleTextModel.items(text: 'History', size: 20,color: Colors.white),
           centerTitle: true,
         ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
        child: Column(
          children: [
            Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey
              ),
              child: ListTile(
                leading: CircleAvatar(),
                title: Text('458755556655'),
                subtitle: Text('13:08'),
                trailing: Column(
                  children: [
                    Container(
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(child: Text("O'tlazma",style: TextStyle(color: Colors.white),)),
                    ),
                    Text('-120000',style: TextStyle(color: Colors.red,fontSize: 15),),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
