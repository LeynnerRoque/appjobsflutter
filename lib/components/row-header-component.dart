import 'package:flutter/material.dart';

class RowHeaderComponent extends StatelessWidget {
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
        ))
      ],
    );
  }
}
