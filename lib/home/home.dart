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
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: 180,
                        width: double.infinity,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                child: Container(
                                  width: 140,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.blue),
                                  child: ListTile(
                                    title: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.location_city,
                                          size: 40,
                                          color: Colors.white,
                                        )),
                                    subtitle: Center(
                                      child: Text("Enterprises",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                child: Container(
                                  width: 140,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.blue),
                                  child: ListTile(
                                    title: IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.work,
                                            size: 40, color: Colors.white)),
                                    subtitle: Center(
                                      child: Text("Jobs",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                child: Container(
                                  width: 140,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.blue),
                                  child: ListTile(
                                    title: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.map,
                                          size: 40,
                                          color: Colors.white,
                                        )),
                                    subtitle: Center(
                                      child: Text("Locations",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                child: Container(
                                  width: 140,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.blue),
                                  child: ListTile(
                                    title: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.people,
                                          size: 40,
                                          color: Colors.white,
                                        )),
                                    subtitle: Center(
                                      child: Text(
                                        "Peoples",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: Container(
                        child: Text("Orders"),
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
