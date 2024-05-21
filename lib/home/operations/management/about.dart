import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {


openGitProfile() async{
  const url = 'https://github.com/LeynnerRoque/';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
}

openLinkedinProfile() async{
  const url = 'https://br.linkedin.com › leynner-roque-59994847';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
}


openAPIGit() async{
  const url = 'https://github.com/LeynnerRoque/appjobsapi';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
}


openAPPGit() async{
  const url = 'https://github.com/LeynnerRoque/appjobsflutter';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
}


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
                        child: new Image(image: new AssetImage("images/code.png")),
                      ),
                      title: Text(
                        "Access the code appjobs flutter for study",
                        maxLines: 8,
                        textAlign: TextAlign.justify,
                      ),
                      onTap: (){
                        openAPPGit();
                      },
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
                        child: new Image(image: new AssetImage("images/code.png")),
                      ),
                      title: Text("Access the code appjobs API for study",
                          maxLines: 8, textAlign: TextAlign.justify),
                          onTap: () {
                            openAPIGit();
                          },
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
                        child: new Image(image: new AssetImage("images/github.png")),
                      ),
                      title: Text("Access GIT profile",
                          maxLines: 8, textAlign: TextAlign.justify),
                          onTap: (){
                            openGitProfile();
                          },
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
                        child: new Image(image: new AssetImage("images/linkedin.png")),
                      ),
                      title: Text("Access Linkedin profile",
                          maxLines: 8, textAlign: TextAlign.justify),
                          onTap: (){
                            openLinkedinProfile();
                          },
                    )
                  ],
                ),
              ),
            )

          ])),
    );
  }
}
