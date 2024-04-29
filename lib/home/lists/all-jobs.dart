import 'package:appjobsflutter/home/cadastros/add-job.dart';
import 'package:appjobsflutter/home/home.dart';
import 'package:appjobsflutter/models/job.dart';
import 'package:appjobsflutter/service/job-service.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;

class AllJobs extends StatefulWidget {
  @override
  _AllJobsState createState() => _AllJobsState();
}

class _AllJobsState extends State<AllJobs> {
  goToAdd() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  goToUpdate(item) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => JobAdd(
          id: item.id, 
          title: item.title, 
          description: item.description, 
          salary: item.salary, 
          enterprise: item.enterprise)));
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
                      child: Text(item.title.toString().characters.first),
                      radius: 50,
                    ),
                    Text(item.title),
                    Text(
                      item.description,
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
                        IconButton(onPressed: () {}, icon: Icon(Icons.check)),
                        IconButton(onPressed: () {}, icon: Icon(Icons.work)),
                      ],
                    ),
                  ]),
                )),
          );
        });
  }

  Future<List<Job>> getAll() async {
    var response = await jobService.listAll();
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);
      json as List;
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
                            ),
                            title: Text(e.title),
                            subtitle: Text(e.description),
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
