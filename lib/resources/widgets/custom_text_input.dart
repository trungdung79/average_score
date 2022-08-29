import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  //final icon;
  const CustomTextInput({Key? key,
    required this.hintText,
    required this.obscureText,
    required this.controller
    //required this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        //border: Border.all(color: Colors.red, width: 2.0),
        borderRadius: BorderRadius.circular(16),

        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 2),),
        ],

      ),
      child: TextField(
        //keyboardType: keyboardType,
        //textAlignVertical: TextAlignVertical(y: 1.0),
        obscureText: obscureText,
        style: const TextStyle(
          color: Colors.black,
          //fontFamily: 'Blinker-SemiBold.ttf',
          fontSize: 16,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(left: 24,),
          //prefixIcon: Icon(icon, size: 22, color: Colors.brown[400],),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.brown),
        ),
        controller: controller,
      ),
    );
  }
}
