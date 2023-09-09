import 'package:banking_app/core/widgets/elevatedbottom.dart';
import 'package:banking_app/core/widgets/textformfield.dart';
import 'package:banking_app/core/widgets/textstyle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 82,
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
        title: StyleTextModel.items(text: 'New Message', size: 18),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
      ),
      body: Column(
        children: [
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection('users').snapshots(),
            builder: (context, snapshot) {
              List<ListTile> userWidgets = [];
              if (snapshot.hasData) {
                final users = snapshot.data?.docs.reversed.toList();
                for (var user in users!) {
                  final userWidget = ListTile(
                    title: Text(user['name']),
                    subtitle: Text(user['email']),
                  );
                  userWidgets.add(userWidget);
                }
              }
              return SizedBox(
                  height: 300,
                  width: 250,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: userWidgets.length,
                    itemBuilder: (context, index) => Container(
                      height: 80,
                      width: 150,
                      color: Colors.deepOrange,
                      child: Column(children: [
                        userWidgets[index],

                      ],
                      ),
                    ),
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 10,
                      );
                    },
                  ),
              );
            },
          ),
          SizedBox(height: 20,),
          Text('sdnsannkjk'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isDismissible: true,
            isScrollControlled: true,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 20,
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: SizedBox(
                  height: 300,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecorationModel.items(hintext: 'name'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecorationModel.items(hintext: 'name'),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        style: BottomStyle.items(),
                        onPressed: () {
                          CollectionReference collRef =
                              FirebaseFirestore.instance.collection('users');
                          collRef.add({
                            'name': nameController.text,
                            'email': emailController.text,
                          });
                          nameController.clear();
                          emailController.clear();
                        },
                        child: const Text('Add User'),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
