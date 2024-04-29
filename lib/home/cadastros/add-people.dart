import 'dart:io';

import 'package:appjobsflutter/components/button-component.dart';
import 'package:appjobsflutter/components/dialog-component.dart';
import 'package:appjobsflutter/components/field-component.dart';
import 'package:appjobsflutter/home/lists/all-peoples.dart';
import 'package:appjobsflutter/models/people.dart';
import 'package:appjobsflutter/service/people-service.dart';
import 'package:flutter/material.dart';

class AddPeople extends StatefulWidget {
  final int id;
  final String name;
  final String gender;
  final int age;
  final String regionName;
  final String email;
  final String phone;
  final int job;
  final int location;

  AddPeople(
      {Key? key,
      required this.id,
      required this.name,
      required this.gender,
      required this.age,
      required this.regionName,
      required this.email,
      required this.phone,
      required this.job,
      required this.location})
      : super(key: key);

  @override
  _AddPeopleState createState() => _AddPeopleState();
}

class _AddPeopleState extends State<AddPeople> {
  final name = TextEditingController();
  final gender = TextEditingController();
  final age = TextEditingController();
  final regionName = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final job = TextEditingController();
  final location = TextEditingController();

  clean() {
    name.clear();
    gender.clear();
    age.clear();
    regionName.clear();
    email.clear();
    phone.clear();
    job.clear();
    location.clear();
  }

  goToViewAll() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AllPeoples()));
  }

  openCallsDialogSucess(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return SucessInfoAlert(
            labelText: 'view all',
            onPressed: () {
              goToViewAll();
              Navigator.pop(context);
            },
            title: "Save Item",
            message: "Success item save",
          );
        });
  }

  add() async {
    try {
      People people = new People(
          id: 0,
          name: name.text,
          gender: gender.text,
          age: int.parse(age.text),
          regionName: regionName.text,
          email: email.text,
          phone: phone.text,
          job: int.parse(job.text),
          location: int.parse(location.text));
      peopleService.add(people.toJson());
      openCallsDialogSucess(context);
      clean();
    } on HttpException catch (e) {
      print(e.message);
    }
  }

  update(){
    try {
      People people = new People(
          id: widget.id,
          name: name.text,
          gender: gender.text,
          age: int.parse(age.text),
          regionName: regionName.text,
          email: email.text,
          phone: phone.text,
          job: int.parse(job.text),
          location: int.parse(location.text));
      peopleService.update(people.toJson());
      openCallsDialogSucess(context);
      clean();
    } on HttpException catch (e) {
      print(e.message);
    }
  }

  @override
  void initState() {
    if(widget.id != 0){
      name.text = widget.name;
      gender.text = widget.gender;
      age.text = widget.age.toString();
      regionName.text = widget.regionName;
      email.text = widget.email;
      phone.text = widget.phone;
      job.text = widget.job.toString();
      location.text = widget.location.toString();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add People",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Column(children: <Widget>[
              Center(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      FieldComponent(
                          controller: name,
                          labelText: "Name",
                          icon: Icon(Icons.text_fields),
                          obscureText: false,
                          tipoEntrada: TextInputType.text),
                      SizedBox(
                        height: 10,
                      ),
                      FieldComponent(
                          controller: gender,
                          labelText: "Gender",
                          icon: Icon(Icons.text_fields),
                          obscureText: false,
                          tipoEntrada: TextInputType.text),
                      SizedBox(
                        height: 10,
                      ),
                      FieldComponent(
                          controller: age,
                          labelText: "Age",
                          icon: Icon(Icons.cake),
                          obscureText: false,
                          tipoEntrada: TextInputType.number),
                      SizedBox(
                        height: 10,
                      ),
                      FieldComponent(
                          controller: regionName,
                          labelText: "Region Name",
                          icon: Icon(Icons.location_city),
                          obscureText: false,
                          tipoEntrada: TextInputType.text),
                      SizedBox(
                        height: 10,
                      ),
                      FieldComponent(
                          controller: email,
                          labelText: "e-mail",
                          icon: Icon(Icons.mail),
                          obscureText: false,
                          tipoEntrada: TextInputType.text),
                      SizedBox(
                        height: 10,
                      ),
                      FieldComponent(
                          controller: phone,
                          labelText: "Phone",
                          icon: Icon(Icons.location_city),
                          obscureText: false,
                          tipoEntrada: TextInputType.text),
                      SizedBox(
                        height: 10,
                      ),
                      FieldComponent(
                          controller: job,
                          labelText: "Job Code",
                          icon: Icon(Icons.location_city),
                          obscureText: false,
                          tipoEntrada: TextInputType.number),
                      SizedBox(
                        height: 10,
                      ),
                      FieldComponent(
                          controller: location,
                          labelText: "Location Code",
                          icon: Icon(Icons.location_city),
                          obscureText: false,
                          tipoEntrada: TextInputType.number),
                      SizedBox(
                        height: 10,
                      ),
                      ButtonIconComponent(
                          texto: "salvar",
                          icon: Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            if(widget.id != 0){
                               update();
                            }else{
                              add();
                            }
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      ButtonIconComponent(
                          texto: "limpar",
                          icon: Icon(
                            Icons.cleaning_services,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            clean();
                          })
                    ],
                  ),
                ),
              ),
            ]),
    ));
  }
}
