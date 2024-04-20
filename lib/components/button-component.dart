import 'package:flutter/material.dart';

class ButtonIconComponent extends StatelessWidget {


final String texto;
final Icon icon;
final Function()? onPressed;

ButtonIconComponent({
  Key? key, 
  required this.texto, 
  required this.icon,
  required this.onPressed}): 
  super(key: key);


final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  padding: EdgeInsets.all(16),
  backgroundColor: Colors.blue,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30)),
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton.icon(
            onPressed: onPressed,
            icon: icon,
            label: Text(texto, style: TextStyle(color: Colors.white),),
            style: raisedButtonStyle,
            ),
          );
  }
}