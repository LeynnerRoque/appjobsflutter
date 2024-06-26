import 'package:appjobsflutter/components/row-component.dart';
import 'package:appjobsflutter/components/row-header-component.dart';
import 'package:appjobsflutter/home/cadastros/add-location.dart';
import 'package:appjobsflutter/home/lists/all-enterprises.dart';
import 'package:appjobsflutter/home/lists/all-jobs.dart';
import 'package:appjobsflutter/home/lists/all-locations.dart';
import 'package:appjobsflutter/home/lists/all-peoples.dart';
import 'package:appjobsflutter/home/operations/management/about.dart';
import 'package:appjobsflutter/home/operations/management/report.dart';
import 'package:appjobsflutter/home/operations/management/transfer-job.dart';
import 'package:appjobsflutter/home/operations/reports/jobs-on-enterprise-report.dart';
import 'package:appjobsflutter/home/operations/reports/peoples-on-job-report.dart';
import 'package:appjobsflutter/home/operations/reports/peoples-on-local-report.dart';
import 'package:appjobsflutter/home/operations/searchs/search-enterprise.dart';
import 'package:appjobsflutter/home/operations/searchs/search-job.dart';
import 'package:appjobsflutter/home/operations/searchs/search-people.dart';
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

  goToSearchPage() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => SearchEnterprisePage()));
  }

  goToSearchJobPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SearchJobPage()));
  }

  goToSearchPeoplePage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SearchPeoplePage()));
  }

  goToReportPeoplesOnJob() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PeoplesOnJobsPage()));
  }

  goToReportPeoplesOnLocal() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PeoplesOnLocalPage()));
  }

  goToReportJobsOnEnterprise() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => JobsOnEnterprisePage()));
  }

  goToTransferJob() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => TransferJobPage(idPeople: 0,)));
  }

    goToReportDescrible() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ReportDescriblePage()));
  }

  goToAboutPage() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => AboutPage()));
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
                                  label: "Search Enterprises",
                                  label2: "Search Jobs title",
                                  label3: "Search Peoples",
                                  icon: Icon(Icons.search),
                                  icon2: Icon(Icons.search_sharp),
                                  icon3: Icon(Icons.search_rounded),
                                  onpressed1: () {
                                    goToSearchPage();
                                  },
                                  onpressed2: () {
                                    goToSearchJobPage();
                                  },
                                  onpressed3: () {
                                    goToSearchPeoplePage();
                                  }),

                              //Line Middle Menu
                              RowComponent(
                                  label: "Peoples on Job",
                                  label2: "Peoples on Local",
                                  label3: "Jobs on Enterprises",
                                  icon: Icon(Icons.person_search),
                                  icon2: Icon(Icons.person_pin),
                                  icon3: Icon(Icons.work),
                                  onpressed1: () {
                                    goToReportPeoplesOnJob();
                                  },
                                  onpressed2: () {
                                    goToReportPeoplesOnLocal();
                                  },
                                  onpressed3: () {
                                    goToReportJobsOnEnterprise();
                                  }),

                              //Line Down Menu
                              RowComponent(
                                  label: "Transfer",
                                  label2: "Files",
                                  label3: "About",
                                  icon: Icon(Icons.repeat_on),
                                  icon2: Icon(Icons.file_copy),
                                  icon3: Icon(Icons.info_outline),
                                  onpressed1: () {
                                    goToTransferJob();
                                  },
                                  onpressed2: () {
                                    goToReportDescrible();
                                  },
                                  onpressed3: () {
                                    goToAboutPage();
                                  })
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
