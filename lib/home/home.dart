import 'package:appjobsflutter/home/cadastros/add-enterprise.dart';
import 'package:appjobsflutter/home/cadastros/add-location.dart';
import 'package:appjobsflutter/home/lists/all-enterprises.dart';
import 'package:appjobsflutter/home/lists/all-jobs.dart';
import 'package:appjobsflutter/home/lists/all-locations.dart';
import 'package:appjobsflutter/home/lists/all-peoples.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  goToEnterpriseAdd() {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => EnterpriseAdd()));
  }

  goToLocationAdd() {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LocationAdd()));
  }

  goToJobsAll() {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => AllJobs()));
  }

  goToEnterpriseAll() {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AllEntreprises()));
  }

  goToLocationAll() {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LocationsAll()));
  }

   goToPeoplesAll() {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => AllPeoples()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "App Jobs - Flutter",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
          iconTheme: IconThemeData(color: Colors.white)),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(
                Icons.location_city,
                color: Colors.blue,
              ),
              title: Text(
                "Enterprises",
                style: TextStyle(color: Colors.blue),
              ),
              onTap: () => goToEnterpriseAll(),
            ),
            ListTile(
              leading: Icon(
                Icons.pin_drop,
                color: Colors.blue,
              ),
              title: Text(
                "Locations",
                style: TextStyle(color: Colors.blue),
              ),
              onTap: () {
                goToLocationAll();
              },
            ),
            ListTile(
              leading: Icon(
                Icons.work,
                color: Colors.blue,
              ),
              title: Text(
                "Jobs",
                style: TextStyle(color: Colors.blue),
              ),
              onTap: () {
                goToJobsAll();
              },
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.blue,
              ),
              title: Text(
                "Peoples",
                style: TextStyle(color: Colors.blue),
              ),
              onTap: (){
                goToPeoplesAll();
              },
            ),
          ],
        ),
      ),
    );
  }
}
