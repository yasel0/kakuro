import 'package:flutter/material.dart';
import 'GridEasyTimer1.dart';
import 'GridEasyTimer2.dart';
import 'GridEasyTimer3.dart';
import 'GridEasyTimer4.dart';
import 'levelsTimer.dart';

void main() {
  runApp(const EasyTimer());
}

class EasyTimer extends StatelessWidget {
  const EasyTimer({Key? key}) : super(key: key);

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
              //const SizedBox(height: 90),
              Image.asset("assets/sablier.gif", height: 120,width: 120),
              const SizedBox(height: 30),
              Builder(
                builder: (context) => ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context) => const GridEasyTimer1()));
                  },
                  child: const Text('Easy 1'),
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
                  onPressed: () { Navigator.push(context, MaterialPageRoute(builder:(context) => const GridEasyTimer2()));},
                  child: const Text('Easy 2'),
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
                  onPressed: () { Navigator.push(context, MaterialPageRoute(builder:(context) => const GridEasyTimer3()));},
                  child: const Text('Easy 3'),
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
                  onPressed: () { Navigator.push(context, MaterialPageRoute(builder:(context) => const GridEasyTimer4()));},
                  child: const Text('Easy 4'),
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
                      onPressed: () {Navigator.push( context,MaterialPageRoute(builder: (context) => LevelsTimer()),);},
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

class Easy1 extends StatefulWidget {
  const Easy1({Key? key}) : super(key: key);

  @override
  State<Easy1> createState() => _Easy1State();
}

class _Easy1State extends State<Easy1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
          child: Text('This is page1')
      ),
    );
  }
}
