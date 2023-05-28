import 'package:flutter/material.dart';
import 'levelsTimer.dart';
import 'GridHardTimer1.dart';
import 'GridHardTimer2.dart';
import 'GridHardTimer3.dart';
import 'GridHardTimer4.dart';



void main() {
  runApp(const HardTimer());
}

class HardTimer extends StatelessWidget {
  const HardTimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0XFFECFFB6),
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
                    shadows: [
                      Shadow(
                        blurRadius: 5.0,
                        color: Colors.orangeAccent,
                        offset: Offset(3.0, 3.0),
                      ),
                    ],),
                ),
              ),
              Image.asset("assets/sablier.gif", height: 120,width: 120),
              const SizedBox(height: 30),
              Builder(
                builder: (context) => ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context) => const GridHardTimer1()));
                  },
                  child: const Text('Hard 1'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 80.0),
                    textStyle: const TextStyle(fontSize: 25, fontFamily: 'IndieFlower', fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Builder(
                builder: (context) => ElevatedButton(
                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder:(context) => const GridHardTimer2()));},
                  child: const Text('Hard 2'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 80.0),
                    textStyle: const TextStyle(fontSize: 25, fontFamily: 'IndieFlower', fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Builder(
                builder: (context) => ElevatedButton(
                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder:(context) => const GridHardTimer3()));},
                  child: const Text('Hard 3'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 80.0),
                    textStyle: const TextStyle(fontSize: 25, fontFamily: 'IndieFlower', fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Builder(
                builder: (context) => ElevatedButton(
                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder:(context) => const GridHardTimer4()));},
                  child: const Text('Hard 4'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 80.0),
                    textStyle: const TextStyle(fontSize: 25, fontFamily: 'IndieFlower', fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 70),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
                  child: Builder(
                    builder: (context) => ElevatedButton(
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder:(context) => const LevelsTimer()));},
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

