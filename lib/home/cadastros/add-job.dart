import 'dart:io';

import 'package:appjobsflutter/components/button-component.dart';
import 'package:appjobsflutter/components/dialog-component.dart';
import 'package:appjobsflutter/components/field-component.dart';
import 'package:appjobsflutter/home/lists/all-jobs.dart';
import 'package:appjobsflutter/models/job.dart';
import 'package:appjobsflutter/service/job-service.dart';
import 'package:flutter/material.dart';

class JobAdd extends StatefulWidget {


final int id;
final String title;
final String description;
final double salary;
final int enterprise;


JobAdd({
Key? key,
required this.id,
required this.title,
required this.description,
required this.salary,
required this.enterprise,
}): super(key: key);

  @override
  _JobAddState createState() => _JobAddState();
}

class _JobAddState extends State<JobAdd> {

final title = TextEditingController();
final description = TextEditingController();
final salary = TextEditingController();
final enterprise = TextEditingController();


 clean() {
    title.clear();
    description.clear();
    salary.clear();
    enterprise.clear();
  }

  goToViewAll() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AllJobs()));
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
            title: "Save Item",
            message: "Success item save",
          );
        });
  }

  
 add() async {
    try {
      Job job = new Job(
        id: 0, 
        title: title.text, 
        description: description.text, 
        salary: double.parse(salary.text),
        enterprise: int.parse(enterprise.text));
      jobService.add(job.toJson());
      openCallsDialogSucess(context);
      clean();
    } on HttpException catch (e) {
      print(e.uri);
      //dialog erro
    }
  }


   update() async {
    try {
      Job job = new Job(
        id: widget.id, 
        title: title.text, 
        description: description.text, 
        salary: double.parse(salary.text),
        enterprise: int.parse(enterprise.text));
      jobService.update(job.toJson());
      openCallsDialogSucess(context);
      clean();
    } on HttpException catch (e) {
      print(e.uri);
      //dialog erro
    }
  }

  @override
  void initState() {
    if(widget.id != 0){
      title.text = widget.title;
      description.text = widget.description;
      salary.text = widget.salary.toString();
      enterprise.text = widget.enterprise.toString();
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          title: Text(
            "Add Job",
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
                          controller: title,
                          labelText: "Title",
                          icon: Icon(Icons.text_fields),
                          obscureText: false,
                          tipoEntrada: TextInputType.text),
                      SizedBox(
                        height: 10,
                      ),
                      FieldComponent(
                          controller: description,
                          labelText: "Description",
                          icon: Icon(Icons.text_fields),
                          obscureText: false,
                          tipoEntrada: TextInputType.text),
                      SizedBox(
                        height: 10,
                      ),
                      FieldComponent(
                          controller: salary,
                          labelText: "Salary",
                          icon: Icon(Icons.attach_money),
                          obscureText: false,
                          tipoEntrada: TextInputType.text),
                      SizedBox(
                        height: 10,
                      ),
                      FieldComponent(
                          controller: enterprise,
                          labelText: "Enterprise Code",
                          icon: Icon(Icons.location_city),
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
            ])),
    );
  }
}