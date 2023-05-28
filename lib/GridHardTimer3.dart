import 'package:flutter/material.dart';
import 'GridHard4.dart';
import 'GridHardTimer4.dart';
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



class GridHardTimer3 extends StatefulWidget {
  const GridHardTimer3({Key? key}) : super(key: key);

  @override
  _GridHardTimer3State createState() => _GridHardTimer3State();
}
class _GridHardTimer3State  extends State<GridHardTimer3> {
  List<int?> boxValues = List.generate(72, (_) => null);

  //borders
  List<int> trianglesList = [6,13,13,12,5,13,4,20,26,17,4,21,9,11,6,19,14,28,6,11,4,13,10,7,10];

  //vides
  List<String?> FilledList = List<String?>.filled(30, null);
  int? selectedBoxIndex;
  //added variables for timer
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
      FilledList = List<String?>.filled(30, null);
      boxValues = List<int?>.filled(72, null);
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
    if (index == 9 ||
        index == 10 ||
        index == 14 ||
        index == 15 ||
        index == 17 ||
        index == 18 ||
        index == 19 ||
        index == 22 ||
        index == 23 ||
        index == 27 ||
        index == 28 ||
        index == 29 ||
        index == 30 ||
        index == 36 ||
        index == 37 ||
        index == 43 ||
        index == 44 ||
        index == 50 ||
        index == 51 ||
        index == 52 ||
        index == 53 ||
        index == 57 ||
        index == 58 ||
        index == 61 ||
        index == 62 ||
        index == 63 ||
        index == 65 ||
        index == 66 ||
        index == 70 ||
        index == 71) {
      FilledList[getIndexInFilledList(index)] = number.toString();
    }
  }
  int getIndexInFilledList(int index) {
    if (index == 9) return 0;
    if (index == 10) return 1;
    if (index == 14) return 2;
    if (index == 15) return 3;
    if (index == 17) return 4;
    if (index == 18) return 5;
    if (index == 19) return 6;
    if (index == 22) return 7;
    if (index == 23) return 8;
    if (index == 27) return 9;
    if (index == 28) return 10;
    if (index == 29) return 11;
    if (index == 30) return 12;
    if (index == 36) return 13;
    if (index == 37) return 14;
    if (index == 43) return 15;
    if (index == 44) return 16;
    if (index == 50) return 17;
    if (index == 51) return 18;
    if (index == 52) return 19;
    if (index == 53) return 20;
    if (index == 57) return 21;
    if (index == 58) return 22;
    if (index == 61) return 23;
    if (index == 62) return 24;
    if (index == 63) return 25;
    if (index == 65) return 26;
    if (index == 66) return 27;
    if (index == 70) return 28;
    if (index == 71) return 29;
    return -1; // Invalid index
  }
  /*int getIndexInFilledList(int index) {
    if (index == 9) return 0;
    if (index == 10) return 1;
    if (index == 14) return 2;
    if (index == 15) return 3;
    if (index == 17) return 4;
    if (index == 18) return 5;
    if (index == 19) return 6;
    if (index == 22) return 7;
    if (index == 23) return 8;
    if (index == 27) return 9;
    if (index == 28) return 10;
    if (index == 29) return 11;
    if (index == 30) return 12;
    if (index == 36) return 13;
    if (index == 37) return 14;
    if (index == 43) return 15;
    if (index == 44) return 16;
    if (index == 50) return 17;
    if (index == 51) return 18;
    if (index == 52) return 19;
    if (index == 53) return 20;
    if (index == 57) return 21;
    if (index == 58) return 22;
    if (index == 61) return 23;
    if (index == 62) return 24;
    if (index == 63) return 25;
    if (index == 65) return 26;
    if (index == 66) return 27;
    if (index == 60) return 28;
    if (index == 71) return 29;
    return -1; // Invalid index
  }*/

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
      boxValues = List.generate(72, (_) => null);
      selectedBoxIndex = null;
      FilledList = List<String?>.filled(30, null);
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
          SizedBox(height: 10),
          Image.asset("assets/cat4.gif", width: 130,height: 130),
          Column(
            children: [
              //const SizedBox(height: 30),
              //Image.asset("assets/cat4.gif", width: 130,height: 130),
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
                      crossAxisCount: 8,
                      childAspectRatio: 1.6,
                    ),
                    itemCount: 72,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 1) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.orange,
                              width: 0,
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
                                      offset: const Offset(2.0, -3.0),
                                      child: Text(
                                        '6',
                                        style: const TextStyle(
                                          fontSize: 15,
                                          //fontWeight: FontWeight.bold,
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
                              width: 1,
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
                                        top: 3.0, right: 28.0),
                                    child: Transform.translate(
                                      offset: const Offset(2.0, -3.0),
                                      child: Text(
                                        '13',
                                        style: const TextStyle(
                                          fontSize: 15,
                                          //fontWeight: FontWeight.bold,
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
                      if (index == 6) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.orange,
                              width: 0,
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
                                        top: 5.0, right: 30.0),
                                    child: Transform.translate(
                                      offset: const Offset(2.0, -3.0),
                                      child: Text(
                                        '13',
                                        style: const TextStyle(
                                          fontSize: 15,
                                          //  fontWeight: FontWeight.bold,
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
                      if (index == 7) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.orange,
                              width: 1,
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
                                        top: 5.0, right: 30.0),
                                    child: Transform.translate(
                                      offset: const Offset(2.0, -3.0),
                                      child: Text(
                                        '12',
                                        style: const TextStyle(
                                          fontSize: 15,
                                          //   fontWeight: FontWeight.bold,
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
                      if (index == 11) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.orange,
                              width: 1,
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
                                        top: 3.0, right: 30.0),
                                    child: Transform.translate(
                                      offset: const Offset(2.0, -3.0),
                                      child: Text(
                                        '13',
                                        style: const TextStyle(
                                          fontSize: 15,
                                          //   fontWeight: FontWeight.bold,
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
                      if (index == 20) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.orange,
                              width: 1,
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
                                        top: 3.0, right: 30.0),
                                    child: Transform.translate(
                                      offset: const Offset(2.0, -3.0),
                                      child: Text(
                                        '26',
                                        style: const TextStyle(
                                          fontSize: 15,
                                          // fontWeight: FontWeight.bold,
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
                      if (index == 45) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.orange,
                              width: 1,
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
                                        top: 3.0, right: 30.0),
                                    child: Transform.translate(
                                      offset: const Offset(2.0, -3.0),
                                      child: Text(
                                        '14',
                                        style: const TextStyle(
                                          fontSize: 15,
                                          //  fontWeight: FontWeight.bold,
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
                      if (index == 54) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.orange,
                              width: 1,
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
                                        top: 3.0, right: 30.0),
                                    child: Transform.translate(
                                      offset: const Offset(2.0, -3.0),
                                      child: Text(
                                        '11',
                                        style: const TextStyle(
                                          fontSize: 15,
                                          //   fontWeight: FontWeight.bold,
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
                      if (index == 55) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.orange,
                              width: 1,
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
                                        top: 3.0, right: 30.0),
                                    child: Transform.translate(
                                      offset: const Offset(2.0, -3.0),
                                      child: Text(
                                        '4',
                                        style: const TextStyle(
                                          fontSize: 15,
                                          //fontWeight: FontWeight.bold,
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

                      if (index == 35) {
                        return GestureDetector(
                          onTap: () => onCellSelected(index),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.orange,
                                width: 1,
                              ),
                              color: Colors.white,
                            ),
                            child: Stack(
                              children: [
                                CustomPaint(
                                  painter: EmptyTrianglePainter(isTop: true),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 0.0, right: 0.0),
                                      child: Transform.translate(
                                        offset: const Offset(-1.0, 3.0),
                                        child: Text(
                                          '9',
                                          style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.orange,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                CustomPaint(
                                  painter: EmptyTrianglePainter(isTop: false),
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 3.0, right: 30.0),
                                      child: Transform.translate(
                                        offset: const Offset(2.0, -3.0),
                                        child: Text(
                                          '11',
                                          style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.orange,
                                          ),
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


                      if (index == 42) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.orange,
                              width: 1,
                            ),
                            color: Colors.white,
                          ),
                          child: Stack(
                            children: [
                              CustomPaint(
                                painter: EmptyTrianglePainter(isTop: false),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 3.0, right: 30.0),
                                    child: Transform.translate(
                                      offset: const Offset(2.0, -3.0),
                                      child: Text(
                                        '19',
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.orange,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              CustomPaint(
                                painter: EmptyTrianglePainter(isTop: true),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0, right: 0.0),
                                    child: Transform.translate(
                                      offset: const Offset(-1.0, 3.0),
                                      child: Text(
                                        '6',
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.orange,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }


                      if (index == 49) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.orange,
                              width: 1,
                            ),
                            color: Colors.white,
                          ),
                          child: Stack(
                            children: [
                              CustomPaint(
                                painter: EmptyTrianglePainter(isTop: false),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 3.0, right: 30.0),
                                    child: Transform.translate(
                                      offset: const Offset(2.0, -3.0),
                                      child: Text(
                                        '6',
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.orange,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              CustomPaint(
                                painter: EmptyTrianglePainter(isTop: true),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0, right: 0.0),
                                    child: Transform.translate(
                                      offset: const Offset(-1.0, 3.0),
                                      child: Text(
                                        '28',
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.orange,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }


                      if (index == 21) {
                        return GestureDetector(
                          onTap: () => onCellSelected(index),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.orange,
                                width: 1,
                              ),
                              color: Colors.white,
                            ),
                            child: Stack(
                              children: [
                                CustomPaint(
                                  painter: EmptyTrianglePainter(isTop: true),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 1.0, right: 0.0),
                                      child: Transform.translate(
                                        offset: const Offset(-1.0, 3.0),
                                        child: Text(
                                          '17',
                                          style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.orange,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                CustomPaint(
                                  painter: EmptyTrianglePainter(isTop: false),
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 3.0, right: 33.0),
                                      child: Transform.translate(
                                        offset: const Offset(2.0, -3.0),
                                        child: Text(
                                          '4',
                                          style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.orange,
                                          ),
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


                      if (index == 8 || index == 13 || index == 16|| index == 26
                          || index == 56  || index == 60 || index == 64 || index == 69
                      ) {
                        String text = '1';
                        if (index == 8) {
                          text = '5';
                        } else if (index == 13) {
                          text = '4';
                        } else if (index == 16) {
                          text = '20';
                        } else if (index == 26) {
                          text = '21';
                        }
                        else if (index == 56) {
                          text = '13';
                        }else if (index == 60) {
                          text = '10';
                        }else if (index == 64) {
                          text = '7';
                        }else if (index == 69) {
                          text = '10';
                        }


                        return GestureDetector(
                          onTap: () => onCellSelected(index),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.orange,
                                width: 1,
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
                                        offset: const Offset(-1.0, 3.0),
                                        child: Text(
                                          text,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            //fontWeight: FontWeight.bold,
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

                      //byed
                      if (index == 9 || index == 10 || index == 14 || index == 15
                          || index == 17 || index == 18 || index == 19 ||
                          index == 22 || index == 23 || index == 27 || index == 28 || index == 29 ||
                          index == 30
                          || index == 36 || index == 37 || index == 43 ||
                          index == 44
                          || index == 50 || index == 51 || index == 52 ||
                          index == 53
                          || index == 57 || index == 58 || index == 61 ||
                          index == 62
                          || index == 63 || index == 65 || index == 66 ||
                          index == 70
                          || index == 71
                      ) {
                        return GestureDetector(
                          onTap: () => onCellSelected(index),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.orange,
                                width: 1,
                              ),
                              color: selectedBoxIndex == index ? Colors.orange[100] : Colors.white.withOpacity(0.6),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Transform.translate(
                                    offset: const Offset(18.0, -1.0),
                                    child: Text(
                                      boxValues[index]?.toString() ?? '',
                                      style: const TextStyle(
                                        fontSize: 22,
                                        //fontWeight: FontWeight.bold,
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

                      //gris, puzzle
                      if (index == 0 || index == 3 || index == 4 || index == 5 ||
                          index == 12 || index == 24
                          || index == 25 || index == 31 || index == 32 ||
                          index == 33
                          || index == 34 || index == 38 || index == 39 ||
                          index == 40
                          || index == 41 || index == 46 || index == 47 ||
                          index == 48 || index == 59
                          || index == 67 || index == 68) {
                        return GestureDetector(
                          onTap: () => onCellSelected(index),
                          child: Container(
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
                              width: 1,
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
                                    padding: const EdgeInsets.only(
                                        top: 4.0, right: 4.0),
                                    child: Text(
                                      boxValues[index]?.toString() ?? '',
                                      style: const TextStyle(
                                        fontSize: 70,
                                        //fontWeight: FontWeight.bold,
                                        color: Colors.deepOrangeAccent,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 4.0, left: 4.0),
                                    child: Text(
                                      boxValues[index]?.toString() ?? '',
                                      style: const TextStyle(
                                        fontSize: 70,
                                        //fontWeight: FontWeight.bold,
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
    MaterialPageRoute(builder: (context) => const Hard()),
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
                                    // fontWeight: FontWeight.bold,
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
        ],
      ),
    );
  }

  bool isCombinationCorrect() {
    // Horizontal sums
    int sum1 = int.parse(FilledList[0]?? '0') + int.parse(FilledList[1]?? '0');
    int sum2 = int.parse(FilledList[3]?? '0') + int.parse(FilledList[2]?? '0');
    int sum3 = int.parse(FilledList[4]?? '0') + int.parse(FilledList[5]?? '0') + int.parse(FilledList[6]?? '0');
    int sum4 = int.parse(FilledList[7]?? '0') + int.parse(FilledList[8]?? '0');
    int sum5 = int.parse(FilledList[9]?? '0') + int.parse(FilledList[10]?? '0') + int.parse(FilledList[11]?? '0') + int.parse(FilledList[12]?? '0');
    int sum6 = int.parse(FilledList[13]?? '0') + int.parse(FilledList[14]?? '0');
    int sum7 = int.parse(FilledList[15]?? '0') + int.parse(FilledList[16]?? '0');
    int sum8 = int.parse(FilledList[17]?? '0') + int.parse(FilledList[18]?? '0') + int.parse(FilledList[19]?? '0') + int.parse(FilledList[20]?? '0');
    int sum9 = int.parse(FilledList[21]?? '0') + int.parse(FilledList[22]?? '0');
    int sum10 = int.parse(FilledList[23]?? '0') + int.parse(FilledList[24]?? '0') + int.parse(FilledList[25]?? '0');
    int sum11 = int.parse(FilledList[26]?? '0') + int.parse(FilledList[27]?? '0');
    int sum12 = int.parse(FilledList[28]?? '0') + int.parse(FilledList[29]?? '0');
//print('Horizontal Sums: $sum1, $sum2, $sum3, $sum4');

    if (sum1 != trianglesList[4] ||
        sum2 != trianglesList[6]||
        sum3 != trianglesList[7]||
        sum4 != trianglesList[9]||
        sum5 != trianglesList[11]||
        sum6 != trianglesList[12]||
        sum7 != trianglesList[14]||
        sum8 != trianglesList[17] ||
        sum9 != trianglesList[21]||
        sum10 != trianglesList[22]||
        sum11 != trianglesList[23]
        ||sum12 != trianglesList[24]) {
      return false;
    }


    // Vertical sums
    int sum13 = int.parse(FilledList[0]?? '0') + int.parse(FilledList[4]?? '0');
    int sum14 = int.parse(FilledList[21]?? '0') + int.parse(FilledList[26]?? '0');
    int sum15 = int.parse(FilledList[1]?? '0') + int.parse(FilledList[5]?? '0');
    int sum16 = int.parse(FilledList[17]?? '0') + int.parse(FilledList[22]?? '0') + int.parse(FilledList[27]?? '0');
    int sum17 = int.parse(FilledList[6]?? '0') + int.parse(FilledList[9]?? '0');
    int sum18 = int.parse(FilledList[15]?? '0') + int.parse(FilledList[18]?? '0');
    int sum19 = int.parse(FilledList[10]?? '0') + int.parse(FilledList[13]?? '0') + int.parse(FilledList[16]?? '0') + int.parse(FilledList[19]?? '0');
    int sum20 = int.parse(FilledList[11]?? '0') + int.parse(FilledList[14]?? '0');
    int sum21 = int.parse(FilledList[20]?? '0') + int.parse(FilledList[23]?? '0');
    int sum22 = int.parse(FilledList[2]?? '0') + int.parse(FilledList[7]?? '0') + int.parse(FilledList[12]?? '0');
    int sum23 = int.parse(FilledList[24]?? '0') + int.parse(FilledList[28]?? '0');
    int sum24 = int.parse(FilledList[3]?? '0') + int.parse(FilledList[8]?? '0');
    int sum25 = int.parse(FilledList[25]?? '0') + int.parse(FilledList[29]?? '0');
//print('Vertical Sums: $sum4, $sum5, $sum6');

    if (sum13 != trianglesList[0] ||
        sum14!= trianglesList[18] ||
        sum15 != trianglesList[1]||
        sum16!= trianglesList[15]||
        sum17 != trianglesList[5]||
        sum18!= trianglesList[13]||
        sum19!= trianglesList[8]||
        sum20 != trianglesList[10]||
        sum21 != trianglesList[16]||
        sum22 != trianglesList[2]||
        sum23!= trianglesList[19]||
        sum24 != trianglesList[3]||
        sum25 != trianglesList[20]) {
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

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GridHardTimer3(),
    ),
  );
}