import 'package:flutter/material.dart';

class NewButton extends StatelessWidget {

  final String text;
  final VoidCallback onPress;
  final Color buttonColor;

  const NewButton(this.text, this.onPress, this.buttonColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: buttonColor,
      ),
      child: MaterialButton(
        onPressed: onPress,
        child: Text(
          text,
          style: const TextStyle(color: Colors.black, fontSize: 28.0),
        ),
      ),
    );
  }
}
