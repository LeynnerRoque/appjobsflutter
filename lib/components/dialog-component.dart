import 'package:flutter/material.dart';

class SucessInfoAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: ListTile(
          leading: Icon(
            Icons.info,
            size: 40,
            color: Colors.blue,
          ),
          title: Text(
            "Registro Adicionado!",
            style: TextStyle(color: Colors.teal),
          ),
        ),
        content: Container(
          height: 60,
          child: Center(
            child: Column(
              children: [
                Text(
                  "Registro Adicionado com Sucesso.",
                  maxLines: 4,
                  style: TextStyle(color: Colors.teal),
                ),
              ],
            ),
          ),
        ));
  }
}
//
