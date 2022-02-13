import 'package:flutter/material.dart';

class RoundedTextButton extends StatelessWidget {
  const RoundedTextButton(
      {Key? key,
      required this.text,
      required this.onPress,
      required this.color})
      : super(key: key);

  final String text;
  final Function onPress;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      onPressed: () => onPress(),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      fillColor: color,
      child: Container(
        height: 70,
        width: 150,
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
