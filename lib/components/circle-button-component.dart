import 'package:flutter/material.dart';

class CircleButtonComponent extends StatelessWidget {

  final Function() onPressed;

  CircleButtonComponent({
    Key? key,
    required this.onPressed,
  }): super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.blue,
      radius: 30,
      child: IconButton(onPressed: onPressed, icon: Icon(Icons.search, color: Colors.white,)),
    );
  }
}