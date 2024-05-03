import 'package:appjobsflutter/home/cadastros/add-people.dart';
import 'package:appjobsflutter/home/operations/management/transfer-job.dart';
import 'package:appjobsflutter/models/people.dart';
import 'package:appjobsflutter/service/people-service.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;

class AllPeoples extends StatefulWidget {
  @override
  _AllPeoplesState createState() => _AllPeoplesState();
}

class _AllPeoplesState extends State<AllPeoples> {

  goToAdd(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => AddPeople(
      id: 0, 
      name: "", 
      gender: "", 
      age: 0, 
      regionName: "", 
      email: "", 
      phone: "", 
      job: 0, 
      location: 0)));
  }

goToUpdate(item) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddPeople(
          id: item.id, 
          name: item.name, 
          gender: item.gender, 
          age: item.age, 
          regionName: item.regionName, 
          email: item.email, 
          phone: item.phone, 
          job: item.job, 
          location: item.location)));
  }

  goToTransferJob(peopleCode) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => TransferJobPage(idPeople: peopleCode,)));
  }

  openDialogDetails(item) {
    return showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Center(
                child: Text(
              'Details',
              style: TextStyle(
                color: Colors.blue,
              ),
            )),
            content: Container(
                height: 200,
                child: Center(
                  child: Column(children: [
                    CircleAvatar(
                      child: Text(item.name.toString().characters.first),
                      radius: 50,
                    ),
                    Text(item.name),
                    Text(
                      item.email+"/"+item.phone,
                      style: TextStyle(color: Colors.grey[400], fontSize: 12),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite_outline)),
                        IconButton(
                            onPressed: () {
                             goToUpdate(item);
                            },
                            icon: Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              // openRemoveItem(item.id);
                            },
                            icon: Icon(Icons.delete)),
                        IconButton(
                          onPressed: () {
                            goToTransferJob(item.id);
                        }, icon: Icon(Icons.repeat_on)),
                        IconButton(onPressed: () {}, icon: Icon(Icons.mail)),
                      ],
                    ),
                  ]),
                )),
          );
        });
  }

  Future<List<People>> getAll() async {
    var response = await peopleService.listAll();
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);
      json as List;
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
                  .map((e) => new Column(
                        children: <Widget>[
                          new ListTile(
                            leading: CircleAvatar(
                              child: Text(e.name.characters.first),
                              radius: 30,
                            ),
                            title: Text(e.name),
                            subtitle: Text(e.email+"/"+e.phone),
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All Jobs",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body:SingleChildScrollView(
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