import 'package:flutter/material.dart';

class RowComponent extends StatelessWidget {
  final String label;
  final String label2;
  final String label3;
  final Icon icon;
  final Icon icon2;
  final Icon icon3;
  final Function() onpressed1;
  final Function() onpressed2;
  final Function() onpressed3;

  RowComponent(
      {Key? key,
      required this.label,
      required this.label2,
      required this.label3,
      required this.icon,
      required this.icon2,
      required this.icon3,
      required this.onpressed1,
      required this.onpressed2,
      required this.onpressed3})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: ListTile(
          title: Center(
            child: CircleAvatar(
              radius: 38,
              child: IconButton(
                icon: icon,
                onPressed: onpressed1,
              ),
            ),
          ),
          subtitle: Center(
            child: Text(label,maxLines: 2, textAlign: TextAlign.center,),
          ),
        )),
        Expanded(
            child: ListTile(
          title: Center(
            child: CircleAvatar(
              radius: 38,
              child: IconButton(
                icon: icon2,
                onPressed: onpressed2,
              ),
            ),
          ),
          subtitle: Center(
            child: Text(label2, maxLines: 2, textAlign: TextAlign.center,),
          ),
        )),
        Expanded(
            child: ListTile(
          title: Center(
            child: CircleAvatar(
              radius: 38,
              child: IconButton(
                icon: icon3,
                onPressed: onpressed3,
              ),
            ),
          ),
          subtitle: Center(
            child: Text(label3, maxLines: 2,textAlign: TextAlign.center),
          ),
        ))
      ],
    );
  }
}
