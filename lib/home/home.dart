import 'package:appjobsflutter/home/cadastros/add-enterprise.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    goToEnterpriseAdd(){
       Navigator.pop(context);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => EnterpriseAdd()));
    }



    return Scaffold(

      appBar: AppBar(
        title: Text("App Jobs - Flutter", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white)
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.location_city, color: Colors.blue,),
              title: Text("Enterprises", style: TextStyle(color: Colors.blue),),
              onTap: () => goToEnterpriseAdd(),
            ),

            ListTile(
              leading: Icon(Icons.pin_drop,color: Colors.blue,),
              title: Text("Locations", style: TextStyle(color: Colors.blue),),
            ),

            ListTile(
              leading: Icon(Icons.work, color: Colors.blue,),
              title: Text("Jobs", style: TextStyle(color: Colors.blue),),
            ),

            ListTile(
              leading: Icon(Icons.person, color: Colors.blue,),
              title: Text("Peoples", style: TextStyle(color: Colors.blue),),
            ),
          ],
        ),
      ),
      
    );
  }
}