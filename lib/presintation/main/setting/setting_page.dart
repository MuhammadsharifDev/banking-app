import 'package:banking_app/core/widgets/elevatedbottom.dart';
import 'package:banking_app/core/widgets/textstyle.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  List languages=[
    'English',
    'Uzbek',
    'France',
  ];
  String lang='English';
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        elevation: 0,
        actions: [
          DropdownButton(
            value: lang,
            onChanged:(value) {
              setState(() {
                lang!=value;
              });
            },
            items: languages.map((value){
              return DropdownMenuItem(
                  value: value,
                  child: Text(value,style: const TextStyle(color: Colors.black),));
            }).toList(),
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: SweepGradient(
            colors: [
              Color(0xff3C382D),
              Colors.black,
              Colors.black,
              Colors.red,
              Colors.orangeAccent,
              Color(0xffECD670),
              Color(0xffECD670),
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: media.size.height * 150 / 812,
            ),
            GestureDetector(
              onTap: () {},
              child: SizedBox(
                height: 150,
                width: 150,
                child: ClipOval(
                  child: Image.asset(
                    'assets/png_images/myself.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            IconButton(onPressed: (){
              ImagePicker imagePicker=ImagePicker();
              imagePicker.pickImage(source: ImageSource.camera);
            }, icon: const Icon(Icons.camera_alt_outlined),),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: BottomStyle.items(),
              onPressed: () {},
              child: StyleTextModel.items(text: 'Select file', size: 15),
            ),
          ],
        ),
      ),
    );
  }
}
