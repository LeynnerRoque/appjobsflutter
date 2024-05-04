import 'package:appjobsflutter/home/lists/all-enterprises.dart';
import 'package:appjobsflutter/home/lists/all-jobs.dart';
import 'package:appjobsflutter/home/lists/all-locations.dart';
import 'package:appjobsflutter/home/lists/all-peoples.dart';
import 'package:flutter/material.dart';

class RowHeaderComponent extends StatelessWidget {

 goToEnterpriseAll(BuildContext context) {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AllEntreprises()));
  }

  goToLocationAll(BuildContext context) {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LocationsAll()));
  }

  goToPeoplesAll(BuildContext context) {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AllPeoples()));
  }

goToJobsAll(BuildContext context) {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => AllJobs()));
  }
 


  @override
  Widget build(BuildContext context) {
    return Row(
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
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  onTap: (){
                    goToEnterpriseAll(context);
                  },
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
                          icon:
                              Icon(Icons.work, size: 40, color: Colors.white)),
                      subtitle: Center(
                        child:
                            Text("Jobs", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  onTap: (){
                    goToJobsAll(context);
                  },
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
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  onTap: (){
                    goToLocationAll(context);
                  },
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
                  onTap: (){
                    goToPeoplesAll(context);
                  },
                ),
              )
            ],
          ),
        ))
      ],
    );
  }
}
