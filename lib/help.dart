import 'package:flutter/material.dart';
import 'HowToPage.dart';
import 'Techniques.dart';
import 'mode.dart';

void main() {
  runApp(Help());
}

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      home: HelpPageMerged(),
    );
  }
}
class HelpPageMerged extends StatefulWidget {
  @override
  _HelpPageMergedState createState() => _HelpPageMergedState();
}

class _HelpPageMergedState extends State<HelpPageMerged> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [    HowToPage(),    TechniquesPage(),  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFFFA629),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        currentIndex: _selectedIndex,
        /*onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },*/
        onTap: (index) {
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Mode()),
            );
          } else {
            setState(() {
              _selectedIndex = index;
            });
          }
        },
        items: const [
          BottomNavigationBarItem(
            label: 'How to play ?',
            icon: Icon(Icons.help),
          ),
          BottomNavigationBarItem(
            label: 'Techniques',
            icon: Icon(Icons.lightbulb_outline),
          ),
          BottomNavigationBarItem(
            label: 'Close',
            icon: Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}
