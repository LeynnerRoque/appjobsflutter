import 'package:appjobsflutter/home/cadastros/add-enterprise.dart';
import 'package:appjobsflutter/models/enterprise.dart';
import 'package:appjobsflutter/service/enterprise-service.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;

class AllEntreprises extends StatefulWidget {
  @override
  _AllEntreprisesState createState() => _AllEntreprisesState();
}

class _AllEntreprisesState extends State<AllEntreprises> {

  Future<List<Enterprises>> getAll() async {
    var response = await enterpriseService.listEnterprises();
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);
      json as List;
      print(json);
      return json.map((e) => Enterprises.fromJson(e)).toList();
    } else {
      throw Exception('Failed on load data');
    }
  }

  goToAdd() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => EnterpriseAdd()));
  }

  FutureBuilder<List<Enterprises>> viewAll() {
    return FutureBuilder(
        future: getAll(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Enterprises>? views = snapshot.data;
            return Column(
              children: views!.map((e) => new Column(
                children: <Widget>[
                  new Text(e.foundationName)
                ],
              )).toList(),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        });
  }

  @override
  void initState() {
    //getAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All Enterprises",
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
                       viewAll()
                      ],
                    )
                      
                    )
                    )
          ])),
      floatingActionButton: FloatingActionButton.small(
        child: Icon(
          Icons.location_city,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
        onPressed: () {
          goToAdd();
        },
      ),
    );
  }
}
