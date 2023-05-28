import 'package:flutter/material.dart';
import 'levelsTimer.dart';
import 'play.dart';
import 'help.dart';
import 'levels.dart';
import 'package:audioplayers/audioplayers.dart';
import 'settings.dart';

void main() {
  runApp(const Mode());
}

class Mode extends StatefulWidget {
  const Mode({Key? key}) : super(key: key);

  @override
  State<Mode> createState() => _ModeState();
}

class _ModeState extends State<Mode> {



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
                  'Kakuro',
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
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder:(context) => const LevelsTimer()));
                      },
                      child: const Text('Timer mode',
                          style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 95.0),
                        textStyle: const TextStyle(
                            fontSize: 25,
                            fontFamily: 'IndieFlower',
                            fontWeight: FontWeight.bold),
                      ),
                    );
                  }
              ),
              const SizedBox(height: 50),
              Builder(
                  builder: (context) {
                    return ElevatedButton(
                      onPressed: () {Navigator.push( context,MaterialPageRoute(builder: (context) => Levels()),);},
                      child: const Text('No timer mode',
                          style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 80.0),
                        textStyle: const TextStyle(
                            fontSize: 25,
                            fontFamily: 'IndieFlower',
                            fontWeight: FontWeight.bold),
                      ),
                    );
                  }
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.push( context,MaterialPageRoute(builder: (context) => Help()),);
                },
                child:
                const Text('Help ?', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding:
                  EdgeInsets.symmetric(vertical: 15.0, horizontal: 125.0),
                  textStyle: const TextStyle(
                      fontSize: 25,
                      fontFamily: 'IndieFlower',
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 50),
              Image.asset("assets/cute.gif", width: 200),
              const SizedBox(height: 50),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  /*Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 30.0),
                    child: Builder(
                      builder: (context) => ElevatedButton(
                        onPressed: () {Navigator.push( context,MaterialPageRoute(builder: (context) => Play()),);},
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
                  ),*/
                  SizedBox(width: 305),
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
              /*Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.only(left: 330.0, bottom: 5.0),
                    child: Builder(
                      builder: (context) => ElevatedButton(
                        onPressed: () {},
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
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}