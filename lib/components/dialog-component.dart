import 'package:appjobsflutter/components/text-button-component.dart';
import 'package:flutter/material.dart';

class SucessInfoAlert extends StatelessWidget {

  final String labelText;
  final Function()? onPressed;

  SucessInfoAlert({
    Key? key,
    required this.labelText,
    required this.onPressed
  }): super(key: key);

closeDialog(BuildContext context){
  Navigator.of(context).pop();
}


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
        ),
        actions: <Widget>[
          TextButtonComponent(
            labelText: "Fechar", 
            onPressed: (){
              closeDialog(context);
            }),

          TextButtonComponent(
            labelText: labelText, 
            onPressed: onPressed),
        ],
        );
  }
}
//
