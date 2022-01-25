import 'package:flutter/material.dart';

class NewButton extends StatelessWidget {
  String text;



  buttonPressed(String text){
    print(text);
  }

  NewButton(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.orange,
      ),
      child: MaterialButton(
        onPressed: () {
          buttonPressed(text);
        },
        child: Text(
          text,
          style: const TextStyle(color: Colors.black, fontSize: 28.0),
        ),
      ),
    );
  }
}
