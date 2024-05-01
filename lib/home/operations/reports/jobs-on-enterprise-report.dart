import 'package:appjobsflutter/components/circle-button-component.dart';
import 'package:appjobsflutter/components/field-component.dart';
import 'package:flutter/material.dart';
import 'package:appjobsflutter/models/job.dart';
import 'package:appjobsflutter/service/job-service.dart';
import 'dart:convert' as convert;

class JobsOnEnterprisePage extends StatefulWidget {
  @override
  _JobsOnEnterprisePageState createState() => _JobsOnEnterprisePageState();
}

class _JobsOnEnterprisePageState extends State<JobsOnEnterprisePage> {
  final searchController = TextEditingController();
  bool showSearchReturn = false;
  bool notResult = false;

  Future<List<Job>> getAll() async {
    var response = await jobService.findJobOnEnterprise(searchController.text);
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);
      json as List;
      setState(() {
        showSearchReturn = true;
      });
      return json.map((e) => Job.fromJson(e)).toList();
    } else {
      throw Exception('Failed on load data');
    }
  }

  FutureBuilder<List<Job>> viewAll() {
    return FutureBuilder(
        future: getAll(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Job>? views = snapshot.data;
            return Column(
              children: views!
                  .map((e) => new Column(
                        children: <Widget>[
                          new ListTile(
                            leading: CircleAvatar(
                              child: Text(e.title.characters.first),
                              radius: 30,
                              backgroundColor: Colors.grey[200],
                            ),
                            title: Text(e.title),
                            subtitle: Text(e.description),
                            onTap: () {
                              // openDialogDetails(e);
                            },
                          )
                        ],
                      ))
                  .toList(),
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
          "Peoples on Job",
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
                        labelText: "Enter Foundation Name",
                        icon: Icon(Icons.search),
                        obscureText: false,
                        tipoEntrada: TextInputType.text)),
                Expanded(
                    flex: 3,
                    child: CircleButtonComponent(onPressed: () {
                      getAll();
                    }))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Visibility(
              child: viewAll(),
              visible: showSearchReturn,
            ),
          ])),
    );
  }
}
