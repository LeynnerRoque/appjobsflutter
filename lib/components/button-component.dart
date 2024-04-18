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
  onPrimary: Colors.blue,
  primary: Colors.blue[600],
  padding: EdgeInsets.all(16),
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