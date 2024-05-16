import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "About",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(children: <Widget>[
            Center(
              child: Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Icon(
                        Icons.code,
                        color: Colors.deepPurple[400],
                      ),
                      subtitle: Text(
                          "AppJob is a simple app that uses various Flutter resources" +
                              "access to a REST API, reusable architecture with easy readability and" +
                              " maintainability, componentization of elements and visual construction of the app." +
                              " Developed by Leynner Roque.",
                          maxLines: 8,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16)),
                    )
                  ],
                ),
              ),
            ),
            Center(
              child: Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        radius: 24,
                        child: Icon(
                          Icons.code,
                          color: Colors.deepPurple[400],
                        ),
                      ),
                      title: Text(
                        "Access the code appjobs flutter for study",
                        maxLines: 8,
                        textAlign: TextAlign.justify,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Center(
              child: Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        radius: 24,
                        child: Icon(
                          Icons.code,
                          color: Colors.deepPurple[400],
                        ),
                      ),
                      title: Text("Access the code appjobs API for study",
                          maxLines: 8, textAlign: TextAlign.justify),
                    )
                  ],
                ),
              ),
            ),
            Center(
              child: Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        radius: 24,
                        child: Icon(
                          Icons.code,
                          color: Colors.deepPurple[400],
                        ),
                      ),
                      title: Text("Access developer GIT profile",
                          maxLines: 8, textAlign: TextAlign.justify),
                    )
                  ],
                ),
              ),
            )
          ])),
    );
  }
}
