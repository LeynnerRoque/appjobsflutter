import 'package:appjobsflutter/components/circle-button-component.dart';
import 'package:appjobsflutter/components/field-component.dart';
import 'package:appjobsflutter/models/people.dart';
import 'package:appjobsflutter/service/people-service.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;

class SearchPeoplePage extends StatefulWidget {
  @override
  _SearchPeoplePageState createState() => _SearchPeoplePageState();
}

class _SearchPeoplePageState extends State<SearchPeoplePage> {
  final searchController = TextEditingController();
  bool showSearchReturn = false;
  bool notResult = false;

  Future<People> getPeople() async {
    var response = await peopleService.findOne(searchController.text);
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);
      json as Map<String, dynamic>;
      setState(() {
        showSearchReturn = true;
      });
      return People.fromJson(json);
    } else {
      throw Exception('Failed on load data');
    }
  }

  FutureBuilder<People> view() {
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
              subtitle: Text(views.email + "/" + views.phone),
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
          "Search People",
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
                        labelText: "Busca",
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
              child: view(),
              visible: showSearchReturn,
            ),
          ])),
    );
  }
}
