import 'package:flutter/material.dart';

class InputDecorationModel{
  static InputDecoration items({required String hintext,}){
    return InputDecoration(
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
        filled: true,
        hintText: hintext,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        )
    );
  }
}