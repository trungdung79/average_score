import 'package:flutter/material.dart';

class CustomTextLineButton extends StatelessWidget {
  final onPressed;
  final String text;
  final color;
  final double fontSize;
  final String lineImageStr;
  final double lineLength;
  const CustomTextLineButton({Key? key,
    required this.onPressed,
    required this.text,
    required this.color,
    required this.fontSize,
    required this.lineImageStr,
    required this.lineLength}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onPressed,
      child: SizedBox(
        width: lineLength,
        height: 35,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: lineLength,
                height: 5,
                child: Image.asset(lineImageStr, fit: BoxFit.fill,),
              ),
            ),
            Container(
              width: lineLength,
              height: 50,
              alignment: Alignment.bottomCenter,
              child: Text(text,
                style: TextStyle(
                  fontSize: fontSize,
                  color: color,
                  //fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
