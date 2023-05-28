import 'package:flutter/material.dart';

class NumberBox extends StatefulWidget {
  final ValueChanged<int>? onChanged;
  final int? initialValue;

  NumberBox({this.onChanged, this.initialValue});

  @override
  _NumberBoxState createState() => _NumberBoxState();
}

class _NumberBoxState extends State<NumberBox> {
  late int _number;

  @override
  void initState() {
    super.initState();
    _number = widget.initialValue ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Show keyboard to select a number
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Select a number'),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildNumberButton(1),
                      _buildNumberButton(2),
                      _buildNumberButton(3),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildNumberButton(4),
                      _buildNumberButton(5),
                      _buildNumberButton(6),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildNumberButton(7),
                      _buildNumberButton(8),
                      _buildNumberButton(9),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildNumberButton(0),
                      SizedBox(width: 20),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Cancel'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: Center(
          child: Text(
            _number.toString(),
            style: TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }

  Widget _buildNumberButton(int number) {
    return TextButton(
      onPressed: () {
        setState(() {
          _number = number;
        });
        widget.onChanged?.call(number);
        Navigator.of(context).pop();
      },
      child: Text(
        number.toString(),
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
