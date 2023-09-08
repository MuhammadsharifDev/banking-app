import 'package:flutter/material.dart';

class InputDecorationModel{
  static InputDecoration items({required String hintext,Color?color}){
    return InputDecoration(
      fillColor: color,
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