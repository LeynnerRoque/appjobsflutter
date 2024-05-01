import 'package:appjobsflutter/components/circle-button-component.dart';
import 'package:appjobsflutter/components/field-component.dart';
import 'package:appjobsflutter/models/enterprise.dart';
import 'package:appjobsflutter/service/enterprise-service.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;

class SearchEnterprisePage extends StatefulWidget {
  @override
  _SearchEnterprisePage createState() => _SearchEnterprisePage();
}

class _SearchEnterprisePage extends State<SearchEnterprisePage> {
  final searchController = TextEditingController();
  bool showSearchReturn = false;
  bool notResult = false;

  Future<Enterprises> getAll() async {
    var response =
        await enterpriseService.findEnterprises(searchController.text);
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);
      json as Map<String, dynamic>;
      setState(() {
        showSearchReturn = true;
      });
      return Enterprises.fromJson(json);
    } else {
      throw Exception('Failed on load data');
    }
  }

  FutureBuilder<Enterprises> viewAll() {
    return FutureBuilder(
        future: getAll(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Enterprises? views = snapshot.data;
            return ListTile(
              leading: CircleAvatar(
                child: Text(views!.foundationName.characters.first),
                radius: 30,
              ),
              title: Text(views.foundationName),
              subtitle: Text(views.email + "/" + views.phoneNumber),
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
          "Search",
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
