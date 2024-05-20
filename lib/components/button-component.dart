import 'package:flutter/material.dart';

class ButtonIconComponent extends StatelessWidget {
  final String texto;
  final Icon icon;
  final Function()? onPressed;
  final Color color;

  ButtonIconComponent(
      {Key? key,
      required this.texto,
      required this.icon,
      required this.onPressed,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon,
        label: Text(
          texto,
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(16),
          backgroundColor: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}
