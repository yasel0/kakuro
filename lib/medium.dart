import 'package:flutter/material.dart';
import 'levels.dart';
import 'package:kakuro/GridMedium1.dart';
import 'GridMedium2.dart';
import 'GridMedium3.dart';
import 'GridMedium4.dart';


void main() {
  runApp(const Medium());
}

class Medium extends StatelessWidget {
  const Medium({Key? key}) : super(key: key);

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
              const SizedBox(height: 90),
              Builder(
                builder: (context) => ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context) => const GridMedium1()));
                  },
                  child: const Text('Medium 1'),
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
                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder:(context) => const GridMedium2()));},
                  child: const Text('Medium 2'),
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
                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder:(context) => const GridMedium3()));},
                  child: const Text('Medium 3'),
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
                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder:(context) => const GridMedium4()));},
                  child: const Text('Medium 4'),
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
              SizedBox(height: 100),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
                  child: Builder(
                    builder: (context) => ElevatedButton(
                      onPressed: () {Navigator.push( context,MaterialPageRoute(builder: (context) => Levels()),);},
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
