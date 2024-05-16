import 'package:appjobsflutter/components/circle-button-component.dart';
import 'package:appjobsflutter/components/field-component.dart';
import 'package:appjobsflutter/models/reports/report-visualizer.dart';
import 'package:appjobsflutter/service/report-service.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;

class ReportDescriblePage extends StatefulWidget {
  @override
  _ReportDescriblePageState createState() => _ReportDescriblePageState();
}

class _ReportDescriblePageState extends State<ReportDescriblePage> {
  final searchController = TextEditingController();
  bool showSearchReturn = false;
  bool notResult = false;

  Future<List<ReportVisualizer>> composeReport() async {
    var response = await reportService.reportVisualizer(searchController.text);
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);
      json as List;
      setState(() {
        showSearchReturn = true;
      });
      return json.map((e) => ReportVisualizer.fromJson(e)).toList();
    } else {
      throw Exception('Failed on load data');
    }
  }

  FutureBuilder<List<ReportVisualizer>> viewAll() {
    return FutureBuilder(
        future: composeReport(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ReportVisualizer>? views = snapshot.data;
            return Column(
              children: views!
                  .map((e) => Column(
                        children: <Widget>[
                          Card(
                            child: ListTile(
                              title: Text(e.title),
                              subtitle: Row(
                                children: [
                                  Expanded(
                                      child: ListTile(
                                    title: CircleAvatar(
                                      child: Text(e.mans.toString()),
                                      radius: 30,
                                      backgroundColor: Colors.grey[200],
                                    ),
                                    subtitle: Center(
                                      child: Text("Mans"),
                                    ),
                                  )),
                                  Expanded(
                                      child: ListTile(
                                    title: CircleAvatar(
                                      child: Text(e.mans.toString()),
                                      radius: 30,
                                      backgroundColor: Colors.grey[200],
                                    ),
                                    subtitle: Center(
                                      child: Text("Womans"),
                                    ),
                                  ))
                                ],
                              ),
                              onTap: () {
                                // openDialogDetails(e);
                              },
                            ),
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
          "Reports Job Describle",
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
                      composeReport();
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
