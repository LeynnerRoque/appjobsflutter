import 'package:appjobsflutter/components/button-component.dart';
import 'package:appjobsflutter/components/circle-button-component.dart';
import 'package:appjobsflutter/components/dialog-component.dart';
import 'package:appjobsflutter/components/field-component.dart';
import 'package:appjobsflutter/home/operations/reports/peoples-on-job-report.dart';
import 'package:appjobsflutter/models/job.dart';
import 'package:appjobsflutter/models/people.dart';
import 'package:appjobsflutter/models/transfers/transfers-new-job.dart';
import 'package:appjobsflutter/service/job-service.dart';
import 'package:appjobsflutter/service/people-service.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;

class TransferJobPage extends StatefulWidget {
  final int idPeople;

  TransferJobPage({Key? key, required this.idPeople}) : super(key: key);

  @override
  _TransferJobPageState createState() => _TransferJobPageState();
}

class _TransferJobPageState extends State<TransferJobPage> {
  final idJob = TextEditingController();
  final idPeopleSearch = TextEditingController();
  bool showSearchReturn = false;
  bool showJobSearchReturn = false;
  bool notResult = false;

  @override
  void initState() {
    if (widget.idPeople != 0) {
      idPeopleSearch.text = widget.idPeople.toString();
    }
    super.initState();
  }

  Future<People> getPeople() async {
    var response = await peopleService.findById(idPeopleSearch.text);
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);
      json as Map<String, dynamic>;
      var resposta = People.fromJson(json);
      setState(() {
        showSearchReturn = true;
      });
      return resposta;
    } else {
      throw Exception('Failed on load data');
    }
  }

  Future<Job> getJob() async {
    var response = await jobService.findById(idJob.text);
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);
      json as Map<String, dynamic>;
      setState(() {
        showJobSearchReturn = true;
      });
      return Job.fromJson(json);
    } else {
      throw Exception('Failed on load data');
    }
  }

  FutureBuilder<People> viewPeople() {
    return FutureBuilder(
        future: getPeople(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            People? views = snapshot.data;
            return ListTile(
              leading: CircleAvatar(
                child: Text(views!.name.characters.first),
                radius: 30,
              ),
              title: Text(views.name),
              subtitle: Text("Job Code: " + views.job.toString()),
              onTap: () {
                //openDialogDetails(e);
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  FutureBuilder<Job> viewJob() {
    return FutureBuilder(
        future: getJob(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Job? views = snapshot.data;
            return ListTile(
              leading: CircleAvatar(
                child: Text(views!.title.characters.first),
                radius: 30,
              ),
              title: Text(views.title),
              subtitle: Text(views.description),
              onTap: () {
                //openDialogDetails(e);
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  openCallsDialogSucess(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return SucessInfoAlert(
            labelText: 'view all',
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PeoplesOnJobsPage()));
            },
            title: "Transfer Item",
            message: "Success item transfer",
          );
        });
  }


    openCallsDialogError(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return SucessInfoAlert(
            labelText: 'view all',
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PeoplesOnJobsPage()));
            },
            title: "Transfer Item Fail",
            message: "Error item transfer",
          );
        });
  }

  transferJob() async {
    var idPeopleOrigin = int.parse(idPeopleSearch.text);
    var idJobDestiny = int.parse(idJob.text);
    TransferNewJob newJob =
        new TransferNewJob(idPeople: idPeopleOrigin, idNewJob: idJobDestiny);
    var response = await peopleService.changeJob(newJob.toJson());
    if (response.statusCode == 200) {
      openCallsDialogSucess(context);
    } else {
      if (response.statusCode == 404) {
        openCallsDialogError(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Transfer new Job",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    flex: 12,
                    child: FieldComponent(
                        controller: idPeopleSearch,
                        labelText: "People Code",
                        icon: Icon(Icons.search),
                        obscureText: false,
                        tipoEntrada: TextInputType.text)),
                Expanded(
                    flex: 3,
                    child: CircleButtonComponent(onPressed: () {
                      getPeople();
                    }))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Visibility(
              child: viewPeople(),
              visible: showSearchReturn,
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              color: Colors.blue,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    flex: 12,
                    child: FieldComponent(
                        controller: idJob,
                        labelText: "New Job Destiny Code",
                        icon: Icon(Icons.search),
                        obscureText: false,
                        tipoEntrada: TextInputType.text)),
                Expanded(
                    flex: 3,
                    child: CircleButtonComponent(onPressed: () {
                      getJob();
                    }))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Visibility(
              child: viewJob(),
              visible: showJobSearchReturn,
            ),
            SizedBox(
              height: 20,
            ),
            ButtonIconComponent(
                texto: "Transfer",
                icon: Icon(
                  Icons.repeat_on,
                  color: Colors.white,
                ),
                onPressed: () {
                  transferJob();
                },
                color: Colors.blue,)
          ])),
    );
  }
}
