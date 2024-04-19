import 'dart:io';

import 'package:appjobsflutter/components/button-component.dart';
import 'package:appjobsflutter/components/field-component.dart';
import 'package:appjobsflutter/models/enterprise.dart';
import 'package:appjobsflutter/service/enterprise-service.dart';
import 'package:flutter/material.dart';

class EnterpriseAdd extends StatefulWidget {
  @override
  _EnterpriseAddState createState() => _EnterpriseAddState();
}

class _EnterpriseAddState extends State<EnterpriseAdd> {
  @override
  Widget build(BuildContext context) {

    final foundationName = TextEditingController();
    final email = TextEditingController();
    final phone = TextEditingController();

    addEnterprise() async{
      try{
        Enterprises enterprises = new Enterprises(
          foundationName: foundationName.text, 
          email: email.text, 
          phoneNumber: phone.text);
          print(enterprises.toJson());
          enterpriseService.addEnterprise(enterprises.toJson());
      }on HttpException catch (e){
        print(e.uri);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Enterprise", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: 
            Container(
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
              labelText: "Foundation Name", 
              icon: Icon(Icons.phone), 
              obscureText: false, 
              tipoEntrada: TextInputType.text),

              SizedBox(
                height: 10,
              ),

              ButtonIconComponent(
                texto: "salvar", 
                icon: Icon(Icons.check,color: Colors.white,), 
                onPressed: (){
                  addEnterprise();
                })

                ],
              ),
            ),
      ),
    );
  }
}