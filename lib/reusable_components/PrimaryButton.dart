import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final Function() onPressedFunction;
  const PrimaryButton({Key? key, required this.label, required this.onPressedFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //todo: make the button more responsive
      width: 350,
      height: 60,
      child: ElevatedButton(onPressed: onPressedFunction, child: Text(label,style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).buttonColor),
          foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).backgroundColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            )
          )
        ),

      ),
    );
  }
}
