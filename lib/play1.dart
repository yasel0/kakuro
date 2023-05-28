import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'mode.dart';

void main() {
  //final player = AudioPlayer();
  //player.play(AssetSource('music4.mp4'));
  runApp(const Play());
}

class Play extends StatefulWidget {
  const Play({Key? key}) : super(key: key);

  @override
  _PlayState createState() => _PlayState();
}

class _PlayState extends State<Play> {
  final player = AudioPlayer();
  bool isPlaying = true;

  @override
  void initState() {
    super.initState();
    player.play(AssetSource('music4.mp4'));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/backg1.webp'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  top: 30,
                  right: 30,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(500),
                    ),
                    child: IconButton(
                      onPressed: () {
                        if (isPlaying) {
                          player.pause();
                        } else {
                          player.resume();
                        }
                        setState(() {
                          isPlaying = !isPlaying;
                        });
                      },
                      icon: Icon(
                        isPlaying ? Icons.volume_up : Icons.volume_off,
                        color: Colors.orange,
                        size: 35,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 200,
                  left: 110,
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
                          color: Color(0XFFFFCD29),
                          offset: Offset(3.0, 3.0),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 140),
                      Builder(
                        builder: (context) {
                          return Center(
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0XFFFFA629).withOpacity(0.8),
                                    spreadRadius: 5,
                                    blurRadius: 8,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: RawMaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Mode()),
                                  );
                                },
                                shape: CircleBorder(),
                                fillColor: Colors.white,
                                elevation: 2.0,
                                child: Padding(
                                  padding: EdgeInsets.all(32.0),
                                  child: Container(
                                    width: 64.0,
                                    height: 64.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Icon(
                                      Icons.play_arrow,
                                      size: 69.0,
                                      color: Color(0XFFFFA629),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: const Text(
                          'Play',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'IndieFlower',
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

