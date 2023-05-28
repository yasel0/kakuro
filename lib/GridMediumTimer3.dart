
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'GridMedium2.dart';
import 'GridMediumTimer4.dart';
import 'medium.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'GridEasyTimer2.dart';

import 'dart:async';


class CountdownTimer extends StatefulWidget {
  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  int _seconds = 30;
  late Timer _timer;
  bool buttonPressed = false;


  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_seconds',
      style: TextStyle(fontSize: 24),
    );
  }
}

class GridMediumTimer3 extends StatefulWidget {
  const GridMediumTimer3({Key? key}) : super(key: key);

  @override
  _GridMediumTimer3State createState() => _GridMediumTimer3State();
}

class _GridMediumTimer3State extends State<GridMediumTimer3> {
  List<int?> boxValues = List.generate(25, (_) => null);

  //borders
  List<int> trianglesList =  [16,29,11,18,20,3,9,12];

  //vides
  List<String?> FilledList = List<String?>.filled(12, null);
  int? selectedBoxIndex;
  late Timer _timer;
  int _countdown = 60;// Initial countdown value in seconds

//added now//
  bool timerStarted = false;
  SharedPreferences? prefs;

  //sauvegarde
  @override
  void initState() {
    super.initState();
    startTimer();
    initSharedPreferences();
  }

  void initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  void saveState() {
    if (prefs != null) {
      prefs!.setStringList('boxValues', boxValues.map((value) => value?.toString() ?? '').toList());
      prefs!.setStringList('filledList', FilledList.map((value) => value ?? '').toList());
    }
  }


  void loadState() {
    if (prefs != null) {
      final savedBoxValues = prefs!.getStringList('boxValues');
      final savedFilledList = prefs!.getStringList('filledList');
      if (savedBoxValues != null && savedBoxValues.length == boxValues.length) {
        boxValues = savedBoxValues.map((value) => value.isNotEmpty ? int.parse(value) : null).toList();
      }
      if (savedFilledList != null && savedFilledList.length == FilledList.length) {
        FilledList = savedFilledList.map((value) => value.isNotEmpty ? value : null).toList();
      }
    }
  }

//timer
  void startTimerAndHideButton() {
    setState(() {
      timerStarted = true;
      startTimer();
    });
  }
//added now
  @override
  void initState1() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }


  //timer function
  void startTimer() {

    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (_countdown == 0) {
        timer.cancel();
        // Perform any action when the timer reaches 0
        // Example: showDialog, showSnackBar, etc.
      } else {
        setState(() {
          _countdown--;
        });
      }
      timerStarted = true;
    });

  }
  //function stop and continue
  void _stopTimer() {
    setState(() {
      _timer.cancel();
      timerStarted = false;
    });
  }

  void _continueTimer() {
    setState(() {
      timerStarted = true;
      startTimer();
    });
  }
  void resetGame() {
    setState(() {
      _countdown = 60;
      FilledList = List<String?>.filled(12, null);
      boxValues = List<int?>.filled(25, null);
      selectedBoxIndex = null;
      startTimer();
    });
  }



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
        centerTitle: true,
        title: const Text('Level 3',
          style: TextStyle(
            fontFamily: "Scribble",
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.orangeAccent,
        actions: [
          Visibility(
            visible: _countdown > 0,
            child: Container(
              color: Colors.orange,
              margin: EdgeInsets.only(right: 8.0),
              child: Transform.scale(
                scale: 0.8, // Ajustez la valeur selon la taille souhaitÃ©e
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (timerStarted) {
                        _stopTimer();
                        saveState();
                      } else {
                        loadState();
                        _continueTimer();
                      }
                    });
                  },
                  icon: Icon(timerStarted ? Icons.pause : Icons.play_arrow),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset("assets/cat4.gif", width: 130,height: 130),
          Column(
          children: [
            //const SizedBox(height: 30),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularProgressIndicator(
                        value: _countdown / 60, // Adjust the value based on your timer progress
                        backgroundColor: Colors.orange[100],
                        valueColor: _countdown <= 15
                            ? AlwaysStoppedAnimation<Color>(Colors.red)
                            : AlwaysStoppedAnimation<Color>(Colors.green),
                        strokeWidth: 8.0,
                      ),
                      Text(
                        '$_countdown',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
                                      '11',
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

                    if (index == 5 || index == 10 || index == 16 || index == 21) {
                      String text = '1';
                      if (index == 5) {
                        text = '18';
                      } else if (index == 10) {
                        text = '20';
                      } else if (index == 16) {
                        text = '9';
                      } else if (index == 21) {
                        text = '12';
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
                                            Navigator.push(context, MaterialPageRoute(builder:(context) => const GridMediumTimer4()));
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 14),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 14),
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
          Visibility(
            visible: _countdown == 0 && !isCombinationCorrect(),
            child: Dialog(
              backgroundColor: Colors.white.withOpacity(0.7),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(13.0),
                ),
                padding: EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/game_over.gif", height: 80, width: 160),
                    SizedBox(width: 30),
                    Builder(
                      builder: (context) => ElevatedButton(
                        onPressed: () {resetGame();
                        },
                        child: Icon(
                          Icons.refresh,
                          size: 30,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Visibility(
            visible: _countdown == 0 && isCombinationCorrect(),
            child: Dialog(
              backgroundColor: Colors.white.withOpacity(0.7),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(13.0),
                ),
                padding: EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/game_over.gif", height: 80, width: 160),
                    SizedBox(width: 30),
                    Builder(
                      builder: (context) => ElevatedButton(
                        onPressed: () {resetGame();
                        },
                        child: Icon(
                          Icons.refresh,
                          size: 30,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
    ]
      ),

    );
  }

  bool isCombinationCorrect() {
    // Horizontal sums
    int sum1 = int.parse(FilledList[0] ?? '0') + int.parse(FilledList[1] ?? '0') + int.parse(FilledList[2] ?? '0');
    int sum2 = int.parse(FilledList[3] ?? '0') + int.parse(FilledList[4] ?? '0') + int.parse(FilledList[5] ?? '0');
    int sum3 = int.parse(FilledList[6] ?? '0') + int.parse(FilledList[7] ?? '0') + int.parse(FilledList[8] ?? '0');
    int sum4 = int.parse(FilledList[9] ?? '0') + int.parse(FilledList[10] ?? '0') + int.parse(FilledList[11] ?? '0');
    print('Horizontal Sums: $sum1, $sum2, $sum3, $sum4');

    if (sum1 != trianglesList[3] ||
        sum2 != trianglesList[4]||
        sum3 != trianglesList[6]||
        sum4 != trianglesList[7]) {
      return false;
    }

    // Vertical sums
    int sum5 = int.parse(FilledList[0] ?? '0') + int.parse(FilledList[3] ?? '0') ;
    int sum6 = int.parse(FilledList[1] ?? '0') + int.parse(FilledList[4] ?? '0') + int.parse(FilledList[6] ?? '0')+ int.parse(FilledList[9] ?? '0');
    int sum7 = int.parse(FilledList[2]!) + int.parse(FilledList[5] ?? '0') + int.parse(FilledList[7] ?? '0') + int.parse(FilledList[10] ?? '0');
    int sum8 = int.parse(FilledList[8]!) + int.parse(FilledList[11] ?? '0');
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
      home: GridMediumTimer3(),
    ),
  );
}
