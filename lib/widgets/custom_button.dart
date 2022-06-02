import 'package:flutter/material.dart';
import 'package:lets_study/utils/colors.dart';
import 'package:lets_study/utils/hexcolor.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final String? color;
  CustomButton({Key? key, required this.text, this.color,required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(fontSize: 17),
      ),
      style: ElevatedButton.styleFrom(
          // shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(18.0),
          //     side: BorderSide(color: Colors.red)),
          shape: StadiumBorder(side: BorderSide(color: buttonBorderColor)),
          minimumSize: Size(size.width * 0.3, size.height * 0.05),
          primary: HexColor(color ?? blueColor)),
    );
  }
}