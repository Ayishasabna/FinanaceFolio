import 'package:flutter/material.dart';

/* button(
  BuildContext context,
  double widthRatio,
  double heightRatio,
  String text,
  double fontsize,
) {
  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      gradient: const LinearGradient(colors: [
        Color.fromRGBO(247, 22, 22, 0.878),
        Color.fromRGBO(255, 67, 40, 0.88),
        Color.fromRGBO(255, 152, 100, 0.88),
      ]),
    ),
    width: MediaQuery.of(context).size.width * widthRatio,
    height: MediaQuery.of(context).size.height * heightRatio,
    child: Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    ),
  );
}
 */

button(
  double width,
  double height,
  String text,
  double fontsize,
) {
  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      gradient: const LinearGradient(colors: [
        Color.fromRGBO(247, 22, 22, 0.878),
        Color.fromRGBO(255, 67, 40, 0.88),
        Color.fromRGBO(255, 152, 100, 0.88),
      ]),
    ),
    width: width,
    height: height,
    child: Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    ),
  );
}
