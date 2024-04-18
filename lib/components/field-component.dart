import 'package:flutter/material.dart';

class FieldComponent extends StatelessWidget {

final TextEditingController controller;
final String labelText;
final Icon icon;
final bool obscureText;
final TextInputType tipoEntrada;

FieldComponent({
  Key? key,
  required this.controller,
  required this.labelText,
  required this.icon,
  required this.obscureText,
  required this.tipoEntrada,
}): super (key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: tipoEntrada,
      decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(60),
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 10.0,
                  )
              ),
              labelText: labelText,
              prefixIcon: icon
            ),
            style: TextStyle(color: Colors.blue),
            cursorColor: Colors.blue,
    );
  }
}