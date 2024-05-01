import 'package:appjobsflutter/components/circle-button-component.dart';
import 'package:appjobsflutter/components/field-component.dart';
import 'package:appjobsflutter/models/people.dart';
import 'package:appjobsflutter/service/people-service.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;

class PeoplesOnLocalPage extends StatefulWidget {
  @override
  _PeoplesOnLocalPageState createState() => _PeoplesOnLocalPageState();
}

class _PeoplesOnLocalPageState extends State<PeoplesOnLocalPage> {
  final searchController = TextEditingController();
  bool showSearchReturn = false;
  bool notResult = false;

  Future<List<People>> getAll() async {
    var response = await peopleService.peoplesOnLocal(searchController.text);
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);
      json as List;
      setState(() {
        showSearchReturn = true;
      });
      return json.map((e) => People.fromJson(e)).toList();
    } else {
      throw Exception('Failed on load data');
    }
  }

  FutureBuilder<List<People>> viewAll() {
    return FutureBuilder(
        future: getAll(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<People>? views = snapshot.data;
            return Column(
              children: views!
                  .map((e) => Column(
                        children: <Widget>[
                          ListTile(
                            leading: CircleAvatar(
                              child: Text(e.name.characters.first),
                              radius: 30,
                              backgroundColor: Colors.grey[200],
                            ),
                            title: Text("Name: " + e.name),
                            subtitle: Text("E-Mail:" + e.email),
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
          "Peoples on Local",
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
                        labelText: "Enter code local",
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
