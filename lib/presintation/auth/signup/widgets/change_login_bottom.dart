import 'package:banking_app/core/widgets/textstyle.dart';
import 'package:banking_app/route/routes_name.dart';
import 'package:flutter/material.dart';

class ChangeLoginBottom extends StatelessWidget {
  const ChangeLoginBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        StyleTextModel.items(
            text: 'Login',
            size: 25,
            color: Colors.black,
            fontWeight: FontWeight.w600),
        const SizedBox(
          width: 15,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, RoutesName.login);
          },
          child: const CircleAvatar(
            backgroundColor: Colors.black,
            child: Icon(
              Icons.arrow_circle_right,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
