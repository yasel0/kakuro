
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'GridMedium2.dart';
import 'GridMedium3.dart';
import 'medium.dart';

class GridMedium1 extends StatefulWidget {
  const GridMedium1({Key? key}) : super(key: key);

  @override
  _GridMedium1State createState() => _GridMedium1State();
}

class _GridMedium1State extends State<GridMedium1> {
  List<int?> boxValues = List.generate(25, (_) => null);

  //borders
  List<int> trianglesList =  [3,30,29,18,16,16,21,23];

  //vides
  List<String?> FilledList = List<String?>.filled(12, null);
  int? selectedBoxIndex;

  void onCellSelected(int index) {
    setState(() {
      selectedBoxIndex = index;
    });
  }

  void onKeyboardItemSelected(int number) {
    setState(() {
      if (selectedBoxIndex != null) {
        boxValues[selectedBoxIndex!] = number;
        updateFilledList(selectedBoxIndex!, number);
      }
    });
  }

  void updateFilledList(int index, int number) {
    if (index == 6 ||
        index == 7 ||
        index == 8 ||
        index == 11 ||
        index == 12 ||
        index == 13 ||
        index == 17 ||
        index == 18 ||
        index == 19 ||
        index == 22 ||
        index == 23 ||
        index == 24) {
      FilledList[getIndexInFilledList(index)] = number.toString();
    }
  }

  int getIndexInFilledList(int index) {
    if (index == 6) return 0;
    if (index == 7) return 1;
    if (index == 8) return 2;
    if (index == 11) return 3;
    if (index == 12) return 4;
    if (index == 13) return 5;
    if (index == 17) return 6;
    if (index == 18) return 7;
    if (index == 19) return 8;
    if (index == 22) return 9;
    if (index == 23) return 10;
    if (index == 24) return 11;
    return -1; // Invalid index
  }

  void onCancelSelected() {
    setState(() {
      selectedBoxIndex = null;
    });
  }

  void onDeleteSelected() {
    setState(() {
      if (selectedBoxIndex != null) {
        boxValues[selectedBoxIndex!] = null;
        selectedBoxIndex = null;
      }
    });
  }

  void onDeleteAll() {
    setState(() {
      boxValues = List.generate(16, (_) => null);
      selectedBoxIndex = null;
      FilledList = List<String?>.filled(9, null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFECFFB6),

      appBar: AppBar(
        title: const Text('Level 1',
          style: TextStyle(
            fontFamily: "Scribble",
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        //backgroundColor: Color(0XFFDB9C61),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Image.asset("assets/cat4.gif", width: 130,height: 130),
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  childAspectRatio: 1.5,
                ),
                itemCount: 25,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 1) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.orange,
                          width: 2,
                        ),
                        color: Colors.white,
                      ),
                      child: CustomPaint(
                        painter: EmptyTrianglePainter(isTop: false),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, right: 40.0),
                                child: Transform.translate(
                                  offset: const Offset(5.0, -4.0),
                                  child: Text(
                                    '3',
                                    style: const TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  if (index == 2) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.orange,
                          width: 2,
                        ),
                        color: Colors.white,
                      ),
                      child: CustomPaint(
                        painter: EmptyTrianglePainter(isTop: false),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, right: 40.0),
                                child: Transform.translate(
                                  offset: const Offset(5.0, -4.0),
                                  child: Text(
                                    '30',
                                    style: const TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  if (index == 3) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.orange,
                          width: 2,
                        ),
                        color: Colors.white,
                      ),
                      child: CustomPaint(
                        painter: EmptyTrianglePainter(isTop: false),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, right: 40.0),
                                child: Transform.translate(
                                  offset: const Offset(5.0, -4.0),
                                  child: Text(
                                    '29',
                                    style: const TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  if (index == 14) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.orange,
                          width: 2,
                        ),
                        color: Colors.white,
                      ),
                      child: CustomPaint(
                        painter: EmptyTrianglePainter(isTop: false),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, right: 60.0),
                                child: Transform.translate(
                                  offset: const Offset(10.0, -6.0),
                                  child: Text(
                                    '16',
                                    style: const TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  if (index == 5 || index == 10 || index == 16 || index == 21) {
                    String text = '1';
                    if (index == 5) {
                      text = '18';
                    } else if (index == 10) {
                      text = '16';
                    } else if (index == 16) {
                      text = '21';
                    } else if (index == 21) {
                      text = '23';
                    }
                    return GestureDetector(
                      onTap: () => onCellSelected(index),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.orange,
                            width: 2,
                          ),
                          color: Colors.white,
                        ),
                        child: CustomPaint(
                          painter: EmptyTrianglePainter(isTop: true),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding:
                                  const EdgeInsets.only(top: 0.0, right: 0.0),
                                  child: Transform.translate(
                                    offset: const Offset(-5.0, 5.0),
                                    child: Text(
                                      text,
                                      style: const TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange,
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

                  if (index == 6 ||
                      index == 7 ||
                      index == 8 ||
                      index == 11 ||
                      index == 12 ||
                      index == 13 ||
                      index == 17 ||
                      index == 18 ||
                      index == 19 ||
                      index == 22 ||
                      index == 23 ||
                      index == 24) {
                    return GestureDetector(
                      onTap: () => onCellSelected(index),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.orange,
                            width: 2,
                          ),

                          color: selectedBoxIndex == index ? Colors.orange[100] : Colors.white.withOpacity(0.6),

                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Transform.translate(
                                offset: const Offset(25.0, -10.0),
                                child: Text(
                                  boxValues[index]?.toString() ?? '',
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  if (index == 0 ||
                      index == 4 ||
                      index == 9 ||
                      index == 15 ||
                      index == 20) {
                    return GestureDetector(
                      onTap: () => onCellSelected(index),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.orange,
                            width: 2,
                          ),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xFFFFA629), Colors.white],
                          ),
                        ),
                        child: const Icon(Icons.extension, color: Colors
                            .orange),
                      ),
                    );
                  }

                  return GestureDetector(
                    onTap: () => onCellSelected(index),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.orange,
                          width: 2,
                        ),
                        color: Colors.white,
                      ),
                      child: CustomPaint(
                        painter: TrianglePainter(),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding:
                                const EdgeInsets.only(top: 5.0, right: 4.0),
                                child: Text(
                                  boxValues[index]?.toString() ?? '',
                                  style: const TextStyle(
                                    fontSize: 70,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepOrangeAccent,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },

              ),
            ),
          ),
          /*Container(
    alignment: Alignment.centerLeft,
    margin: const EdgeInsets.fromLTRB(10, 50, 100, 20),
    child: ElevatedButton(
    onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const Medium()),
    );
    },
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
    ),*/
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Transform.translate(
                    offset: Offset(0, 40),
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 4,
                        crossAxisSpacing: 30,
                        mainAxisSpacing: 4,
                      ),
                      itemCount: 9,
                      itemBuilder: (context, index) {
                        final number = index + 1;
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            backgroundColor: Colors.orange.withOpacity(0.7),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          /* onPressed: selectedBoxIndex != null
                            ? () => onKeyboardItemSelected(number)
                            : null,*/
                          onPressed: () => onKeyboardItemSelected(number),
                          //onPressed: onDeleteAll,
                          child: Center(
                            child: Text(
                              number.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    if (FilledList.contains(null)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please fill in all the grid!'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    } else if (isCombinationCorrect()) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors.transparent,
                            contentPadding: EdgeInsets.zero,
                            content: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(13.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset("assets/congrats.gif"),
                                  Padding(
                                    padding: EdgeInsets.all(40.0),
                                    child: Text(
                                      'Do you want to go to the next level?',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(width: 100),
                                      TextButton(
                                        child: const Text('No'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          elevation: 0,
                                          textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 30),
                                      TextButton(
                                        child: const Text('Yes'),
                                        onPressed: () {
                                          Navigator.push( context,MaterialPageRoute(builder: (context) => GridMedium2()),);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          elevation: 0,
                                          textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ),

                                    ],
                                  )


                                ],

                              ),
                            ),

                          );


                        },
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Try again!'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),

                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.check),
                      const SizedBox(width: 8),
                      Text(
                        'Check',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Scribble',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: onDeleteSelected,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),

                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.clear),
                      const SizedBox(width: 8),
                      Text(
                        'Clear',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Scribble',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),
          SizedBox(height: 30),
        ],
      ),

    );
  }

  bool isCombinationCorrect() {
    // Horizontal sums
    int sum1 = int.parse(FilledList[0]!) + int.parse(FilledList[1]!) + int.parse(FilledList[2]!);
    int sum2 = int.parse(FilledList[3]!) + int.parse(FilledList[4]!) + int.parse(FilledList[5]!);
    int sum3 = int.parse(FilledList[6]!) + int.parse(FilledList[7]!) + int.parse(FilledList[8]!);
    int sum4 = int.parse(FilledList[9]!) + int.parse(FilledList[10]!) + int.parse(FilledList[11]!);
    print('Horizontal Sums: $sum1, $sum2, $sum3, $sum4');

    if (sum1 != trianglesList[3] ||
        sum2 != trianglesList[4]||
        sum3 != trianglesList[6]||
        sum4 != trianglesList[7]) {
      return false;
    }

    // Vertical sums
    int sum5 = int.parse(FilledList[0]!) + int.parse(FilledList[3]!) ;
    int sum6 = int.parse(FilledList[1]!) + int.parse(FilledList[4]!) + int.parse(FilledList[6]!)+ int.parse(FilledList[9]!);
    int sum7 = int.parse(FilledList[2]!) + int.parse(FilledList[5]!) + int.parse(FilledList[7]!) + int.parse(FilledList[10]!);
    int sum8 = int.parse(FilledList[8]!) + int.parse(FilledList[11]!);
    print('Vertical Sums: $sum4, $sum5, $sum6');

    if (sum5 != trianglesList[0] ||
        sum6 != trianglesList[1] ||
        sum7 != trianglesList[2]||
        sum8 != trianglesList[5]) {
      return false;
    }

    return true;
  }

  void printFilledList() {
    print('FilledList: $FilledList');
    print('boxlist: $boxValues');
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
    } else {
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

void main() {
  runApp(
    MaterialApp(
      home: GridMedium1(),
    ),
  );
}
