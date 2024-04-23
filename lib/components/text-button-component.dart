import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextButtonComponent extends StatelessWidget {

  final String labelText;
  final Function()? onPressed;

  TextButtonComponent({
    Key? key,
    required this.labelText,
    required this.onPressed
  }): super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(labelText),
      onPressed: onPressed,
    );
  }
}