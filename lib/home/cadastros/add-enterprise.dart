import 'dart:io';

import 'package:appjobsflutter/components/button-component.dart';
import 'package:appjobsflutter/components/dialog-component.dart';
import 'package:appjobsflutter/components/field-component.dart';
import 'package:appjobsflutter/home/cadastros/all-enterprises.dart';
import 'package:appjobsflutter/models/enterprise.dart';
import 'package:appjobsflutter/service/enterprise-service.dart';
import 'package:flutter/material.dart';

class EnterpriseAdd extends StatefulWidget {
  @override
  _EnterpriseAddState createState() => _EnterpriseAddState();
}

class _EnterpriseAddState extends State<EnterpriseAdd> {
  final foundationName = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();

  //todo
  //Validations

  clean() {
    foundationName.clear();
    email.clear();
    phone.clear();
  }

  goToViewAll() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AllEntreprises()));
  }

  openCallsDialogSucess(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return SucessInfoAlert(
            labelText: 'view all',
            onPressed: () {
              goToViewAll();
            },
          );
        });
  }

  addEnterprise() async {
    try {
      Enterprises enterprises = new Enterprises(
          foundationName: foundationName.text,
          email: email.text,
          phoneNumber: phone.text);
      enterpriseService.addEnterprise(enterprises.toJson());
      openCallsDialogSucess(context);
      clean();
    } on HttpException catch (e) {
      print(e.uri);
      //dialog erro
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Add Enterprise",
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
                          controller: foundationName,
                          labelText: "Foundation Name",
                          icon: Icon(Icons.location_city),
                          obscureText: false,
                          tipoEntrada: TextInputType.text),
                      SizedBox(
                        height: 10,
                      ),
                      FieldComponent(
                          controller: email,
                          labelText: "Foundation Mail",
                          icon: Icon(Icons.mail_outline),
                          obscureText: false,
                          tipoEntrada: TextInputType.text),
                      SizedBox(
                        height: 10,
                      ),
                      FieldComponent(
                          controller: phone,
                          labelText: "Foundation Phone",
                          icon: Icon(Icons.phone),
                          obscureText: false,
                          tipoEntrada: TextInputType.text),
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
                            addEnterprise();
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
            ])));
  }
}
