import 'package:appjobsflutter/home/cadastros/add-location.dart';
import 'package:appjobsflutter/models/location.dart';
import 'package:appjobsflutter/service/location-service.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;

class LocationsAll extends StatefulWidget {
  @override
  _LocationsAllState createState() => _LocationsAllState();
}

class _LocationsAllState extends State<LocationsAll> {
  goToAdd() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LocationAdd()));
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
                    child: Text(item.city.toString().characters.first),
                    radius: 50,
                  ),
                  Text(item.streetAddress),
                  Text(item.stateProvince+"/"+item.postalCode, 
                  style: TextStyle(color: Colors.grey[400], fontSize: 12),),
                  SizedBox(height: 4,),
                   Row(
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.favorite_outline)),
                      IconButton(onPressed: (){
                       // gotoEdit(item);
                      }, icon: Icon(Icons.edit)),
                      IconButton(onPressed: (){
                       // openRemoveItem(item.id);
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


  Future<List<Location>> getAll() async {
    var response = await locationService.listAll();
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);
      json as List;
      return json.map((e) => Location.fromJson(e)).toList();
    } else {
      throw Exception('Failed on load data');
    }
  }

  FutureBuilder<List<Location>> viewAll() {
    return FutureBuilder(
        future: getAll(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Location>? views = snapshot.data;
            return Column(
              children: views!
                  .map((e) => new Column(
                        children: <Widget>[
                          new ListTile(
                            leading: CircleAvatar(
                              child: Text(e.city.characters.first),
                              radius: 30,
                            ),
                           title: Text(e.streetAddress),
                           subtitle: Text(e.stateProvince + "/" + e.postalCode),
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
          "All Locations",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
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