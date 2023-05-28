import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(

        appBar: AppBar(
          backgroundColor: Color(0XFFECFFB6),
          title: const Text('Grid Widget',
              style: TextStyle(color: Colors.orange, fontSize: 40)
          ),
        ),
        body: const GridWidget(),
      ),
    ),
  );
}

class GridWidget extends StatelessWidget {
  const GridWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color(0XFFECFFB6),
        ),


        child: Column(
          children: [
            Expanded(
                child: GridView.count(
                  crossAxisCount: 8,
                  children: List.generate(
                    72,
                        (index) {
                      final random = Random();
                      final firstNumber = random.nextInt(9) + 1;
                      final secondNumber = random.nextInt(9) + 1;

                      if (index == 3 || index == 4 || index == 14 || index == 15
                          || index == 41 || index == 46
                      )  {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.orange,
                              width: 1,
                            ),
                          ),
                          child: CustomPaint(
                            painter: EmptyTrianglePainter(isTop: false),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10.0, right: 40.0),
                                    child: Text(firstNumber.toString(),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.deepOrangeAccent,

                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }

                      if (index == 17 || index == 25 || index == 35 || index == 49
                          || index == 57 || index == 60 || index == 68
                      )  {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.orange,
                              width: 1,
                            ),
                          ),
                          child: CustomPaint(
                            painter: EmptyTrianglePainter(isTop: true),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0, right: 0.0),
                                    child: Text(firstNumber.toString(),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.deepOrangeAccent,

                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }

                      // Check if the current index corresponds to a box to be emptied
                      if (index == 0 || index == 1 || index == 2 || index == 5 || index == 6 ||
                          index == 7 || index == 8 || index == 9 || index == 11 || index == 12 ||
                          index == 13 || index == 16 || index == 18 || index == 19 || index == 20
                          || index == 22 || index == 23 || index == 24 || index == 26 || index == 27
                          || index == 29 || index == 30 || index == 31 || index == 32 || index == 33
                          || index == 35 || index == 36 || index == 37 || index == 38 || index == 39
                          || index == 40 || index == 43 || index == 44 || index == 45 || index == 47
                          || index == 49 || index == 50 || index == 51 || index == 53 || index == 54
                          || index == 55 || index == 57 || index == 58 || index == 60 || index == 61
                          || index == 62 || index == 63 || index == 64 || index == 65 || index == 66
                          || index == 68 || index == 69 || index == 70 || index == 71

                      ) {
                        return Container(

                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.orange,
                              width: 1,
                            ),
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xFFFFA629),
                                Colors.white
                              ],
                            ),

                          ),
                          child : const Icon(Icons.extension, color: Colors.orange),
                        );
                      }

                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.orange,
                            width: 1,
                          ),
                        ),
                        child: CustomPaint(
                          painter: TrianglePainter(),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 4.0, right: 4.0),
                                  child: Text(
                                    firstNumber.toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.deepOrangeAccent,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 4.0, left: 4.0),
                                  child: Text(
                                    secondNumber.toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.deepOrangeAccent,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )),
            NumberKeyboard1(),
          ],
        )
    );
  }
}

class NumberKeyboard1 extends StatelessWidget {
  const NumberKeyboard1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final keyboardWidth = screenWidth - 32; // Set padding to 16 on each side
    final buttonWidth = keyboardWidth / 3 - 16; // Set padding to 8 on each side

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
      child: Container(
        width: keyboardWidth,
        decoration: const BoxDecoration(
          color: Colors.orangeAccent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildKeyboardButton(buttonWidth, 1),
                _buildKeyboardButton(buttonWidth, 2),
                _buildKeyboardButton(buttonWidth, 3),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildKeyboardButton(buttonWidth, 4),
                _buildKeyboardButton(buttonWidth, 5),
                _buildKeyboardButton(buttonWidth, 6),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildKeyboardButton(buttonWidth, 7),
                _buildKeyboardButton(buttonWidth, 8),
                _buildKeyboardButton(buttonWidth, 9),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: buttonWidth,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.backspace, color: Colors.white,),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKeyboardButton(double buttonWidth, int number) {
    return SizedBox(
      width: buttonWidth,
      child: TextButton(
        onPressed: () {},
        child: Text(
          number.toString(),
          style: const TextStyle(fontSize: 23, color: Colors.white),
        ),
      ),
    );
  }
}



class EmptyTrianglePainter extends CustomPainter {
  final bool isTop;

  EmptyTrianglePainter({this.isTop = false});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 2;

    if (isTop) {
      canvas.drawLine(
        const Offset(0, 0),
        Offset(size.width, size.height),
        paint,
      );
    }else{
      canvas.drawLine(
        const Offset(0, 0),
        Offset(size.width, size.height),
        paint,
      );
      canvas.drawLine(
        Offset(size.width, size.height),
        Offset(0, size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}



class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 2;

    canvas.drawLine(
      /* Offset(0, size.height),
      Offset(size.width, 0),*/
      const Offset(0, 0),
      Offset(size.width, size.height),
      paint,
    );

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
