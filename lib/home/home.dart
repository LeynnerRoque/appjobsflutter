import 'package:appjobsflutter/components/row-component.dart';
import 'package:appjobsflutter/components/row-header-component.dart';
import 'package:appjobsflutter/home/cadastros/add-location.dart';
import 'package:appjobsflutter/home/lists/all-enterprises.dart';
import 'package:appjobsflutter/home/lists/all-jobs.dart';
import 'package:appjobsflutter/home/lists/all-locations.dart';
import 'package:appjobsflutter/home/lists/all-peoples.dart';
import 'package:appjobsflutter/home/operations/search.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AllPeoples()));
  }

  goToSearchPage(){
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SearchPage()));
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
              onTap: () {
                goToPeoplesAll();
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Container(
            child: Container(
              height: 800,
              width: double.infinity,
              child: Column(
                children: [
                  //Menu Header
                  RowHeaderComponent(),

                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.all(10),
                        child: Container(
                         // height: 800,
                          width: 500,
                          child: Column(
                            children: [
                              RowComponent(
                                  label: "Search",
                                  label2: "Manage",
                                  label3: "Jobs",
                                  icon: Icon(Icons.search),
                                  icon2: Icon(Icons.settings),
                                  icon3: Icon(Icons.workspaces_filled),
                                  onpressed1: () {
                                    goToSearchPage();
                                  },
                                  onpressed2: () {},
                                  onpressed3: () {}),

                              //Line Middle Menu
                              RowComponent(
                                  label: "Changes",
                                  label2: "People",
                                  label3: "Locations",
                                  icon: Icon(Icons.local_activity),
                                  icon2: Icon(Icons.person),
                                  icon3: Icon(Icons.pin_drop),
                                  onpressed1: () {},
                                  onpressed2: () {},
                                  onpressed3: () {}),

                              //Line Down Menu
                              RowComponent(
                                  label: "Report",
                                  label2: "File",
                                  label3: "General",
                                  icon: Icon(Icons.repeat_on),
                                  icon2: Icon(Icons.file_copy),
                                  icon3: Icon(Icons.tab_unselected),
                                  onpressed1: () {},
                                  onpressed2: () {},
                                  onpressed3: () {})
                            ],
                          ),
                        ),
                      ))
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
