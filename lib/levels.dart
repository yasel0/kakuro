import 'package:flutter/material.dart';
import 'mode.dart';
import 'main.dart';
import 'medium.dart';
import 'hard.dart';
import 'settings.dart';

void main() {
  runApp(const Levels());
}

class Levels extends StatelessWidget {
  const Levels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0XFFECFFB6),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: const Text(
                  'Levels',
                  style: TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'IndieFlower',
                    color: Colors.black,
                    shadows: [
                      Shadow(
                        blurRadius: 5.0,
                        color: Colors.orange,
                        offset: Offset(3.0, 3.0),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 90),
              Builder(
                builder: (context) {
                  return ElevatedButton(
                    onPressed: () {Navigator.push( context,MaterialPageRoute(builder: (context) => Easy()),);},
                    child: const Text('Easy'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 90.0),
                      textStyle: const TextStyle(fontSize: 25, fontFamily: 'IndieFlower', fontWeight: FontWeight.bold),
                    ),
                  );
                }
              ),
              const SizedBox(height: 50),
              Builder(
                builder: (context) {
                  return ElevatedButton(
                    onPressed: () {Navigator.push( context,MaterialPageRoute(builder: (context) => Medium()),);},
                    child: const Text('Medium'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 80.0),
                      textStyle: const TextStyle(fontSize: 25, fontFamily: 'IndieFlower', fontWeight: FontWeight.bold),
                    ),
                  );
                }
              ),
              const SizedBox(height: 50),
              Builder(
                builder: (context) {
                  return ElevatedButton(
                    onPressed: () {Navigator.push( context,MaterialPageRoute(builder: (context) => Hard()),);},
                    child: const Text('Hard'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 90.0),
                      textStyle: const TextStyle(fontSize: 25, fontFamily: 'IndieFlower', fontWeight: FontWeight.bold),
                    ),
                  );
                }
              ),
              SizedBox(height: 45),
              Image.asset("assets/cute2.gif", height: 120,width: 120),
              const SizedBox(height: 30),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 30.0),
                    child: Builder(
                      builder: (context) => ElevatedButton(
                        onPressed: () {Navigator.push( context,MaterialPageRoute(builder: (context) => Mode()),);},
                        child: Icon(
                          Icons.arrow_back,
                          size: 40,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 235),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, bottom: 30.0),
                    child: Builder(
                      builder: (context) => ElevatedButton(
                        onPressed: () {Navigator.push( context,MaterialPageRoute(builder: (context) => SettingsPage()),);},
                        child: Icon(
                          Icons.settings,
                          size: 40,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}