import 'package:appjobsflutter/components/circle-button-component.dart';
import 'package:appjobsflutter/components/field-component.dart';
import 'package:appjobsflutter/models/job.dart';
import 'package:appjobsflutter/service/job-service.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;

class SearchJobPage extends StatefulWidget {
  @override
  _SearchJobPageState createState() => _SearchJobPageState();
}

class _SearchJobPageState extends State<SearchJobPage> {
  final searchController = TextEditingController();
  bool showSearchReturn = false;
  bool notResult = false;

  Future<Job> getJob() async {
    var response = await jobService.findOne(searchController.text);
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);
      json as Map<String, dynamic>;
      setState(() {
        showSearchReturn = true;
      });
      return Job.fromJson(json);
    } else {
      throw Exception('Failed on load data');
    }
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
              subtitle: Text(views.description + "/" + views.salary.toString()),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Search Job",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(children: <Widget>[
            Row(
              children: [
                Expanded(
                    flex: 12,
                    child: FieldComponent(
                        controller: searchController,
                        labelText: "Enter title Job",
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
              visible: showSearchReturn,
            ),
          ])),
    );
  }
}
