import 'package:flutter/material.dart';

class BottomStyle{
  static ButtonStyle items(){
    return ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 55),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        )
    );
  }
}