import 'package:appjobsflutter/home/cadastros/add-enterprise.dart';
import 'package:appjobsflutter/home/edits/edit-enterprise.dart';
import 'package:appjobsflutter/models/enterprise.dart';
import 'package:appjobsflutter/service/enterprise-service.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;

class AllEntreprises extends StatefulWidget {
  @override
  _AllEntreprisesState createState() => _AllEntreprisesState();
}

class _AllEntreprisesState extends State<AllEntreprises> {
  goToAdd() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => EnterpriseAdd()));
  }

  gotoEdit(item){
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => EditEnterprise(
          id: item.id,
          foundationName: item.foundationName,
          email: item.email,
          phoneNumber: item.phoneNumber,
        )));
  }

  removeItem(id){
    enterpriseService.deleteEnterprise(id);
  }


  openRemoveItem(id){
    return showDialog(
      context: context, 
      builder: (builder){
        return AlertDialog(
          title: Text('Remove Enterprises', style: TextStyle(color: Colors.blue),),
          backgroundColor: Colors.white,
          content: Container(
            height: 200,
            child: Center(
              child: Column(
                children: [
                  Text('Remover Enterprise?')
                ],
              ),
            ),
          ),
          actions: [
            TextButton(onPressed: (){
              removeItem(id);
              Navigator.of(context).pop();
            }, child: Text('Sim')),

            TextButton(onPressed: (){
               Navigator.of(context).pop();
            }, child: Text('Não'))
          ],
        );
      });
  }

  openDialogDetails(item) {
    return showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Center(child: Text('Details',style: TextStyle(color: Colors.blue,),)),
            content: Container(
                height: 200,
                child: Center(
              child: Column(
                children: [
                  CircleAvatar(
                    child: Text(item.foundationName.toString().characters.first),
                    radius: 50,
                  ),
                  Text(item.foundationName),
                  Text(item.email+"/"+item.phoneNumber, 
                  style: TextStyle(color: Colors.grey[400], fontSize: 12),),
                  SizedBox(height: 4,),
                   Row(
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.favorite_outline)),
                      IconButton(onPressed: (){
                        gotoEdit(item);
                      }, icon: Icon(Icons.edit)),
                      IconButton(onPressed: (){
                        openRemoveItem(item.id);
                      }, icon: Icon(Icons.delete)),
                      IconButton(onPressed: (){}, icon: Icon(Icons.check)),
                      IconButton(onPressed: (){}, icon: Icon(Icons.work)),
                    ],
                  ),
                  
                  ]),
            )),
          );
        });
  }


  Future<List<Enterprises>> getAll() async {
    var response = await enterpriseService.listEnterprises();
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);
      json as List;
      return json.map((e) => Enterprises.fromJson(e)).toList();
    } else {
      throw Exception('Failed on load data');
    }
  }

  FutureBuilder<List<Enterprises>> viewAll() {
    return FutureBuilder(
        future: getAll(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Enterprises>? views = snapshot.data;
            return Column(
              children: views!
                  .map((e) => new Column(
                        children: <Widget>[
                          new ListTile(
                            leading: CircleAvatar(
                              child: Text(e.foundationName.characters.first),
                              radius: 30,
                            ),
                            title: Text(e.foundationName),
                            subtitle: Text(e.email + "/" + e.phoneNumber),
                            onTap: () {
                              openDialogDetails(e);
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
  void initState() {
    getAll();
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
            viewAll(),
          ])),
      floatingActionButton: FloatingActionButton.small(
        child: Icon(
          Icons.add,
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
