import 'package:appjobsflutter/home/home.dart';
import 'package:flutter/material.dart';

class IntroAppJobs extends StatefulWidget {
  @override
  _IntroAppJobsState createState() => _IntroAppJobsState();
}

class _IntroAppJobsState extends State<IntroAppJobs> {

   composeTela() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pop(context);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  void initState() {
    composeTela();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.blue,
            Colors.blueAccent,
            Colors.lightBlue,
          ])),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                ),
                SizedBox(
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 80,
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                   SizedBox(
                  child: Text("appjobs", style: TextStyle(color: Colors.white, fontSize: 28)),
                ),
                SizedBox(
                  height: 10,
                ),
                // Expanded(
                //     child: Center(
                //   child: Container(
                //     height: 2,
                //     width: 150,
                //     child: LinearProgressIndicator(
                //       color: Colors.white,
                //     ),
                //   ),
                // )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
