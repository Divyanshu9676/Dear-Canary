import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  String? answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: selectHandler,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6.5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Colors.black,
            width: 5
          ),
          color: Colors.black.withOpacity(0.3)
        ),
        width: double.infinity,
        child: Text(
          answerText!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 30,
            fontFamily: "Dongle",
            color: Colors.white
          ),
        ),
      )
    );
    // return Container(
    //   width: double.infinity,
    //   child: ElevatedButton(
    //     style: ElevatedButton.styleFrom(
    //       onPrimary: const Color(0xFF00E676),
    //     ),
    //     child: Text(answerText!),
    //     onPressed: selectHandler,
    //   ), //RaisedButton
    // ); //Container
  }
}