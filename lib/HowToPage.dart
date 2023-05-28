import 'package:flutter/material.dart';




class HowToPage extends StatelessWidget {
  //final String title = 'Help';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECFFB6),
      /* appBar: AppBar(
        title: Text(title),
      ),*/
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    'How to play',
                    style: TextStyle(
                      fontSize: 35.0,
                      color: Color(0xFFFFA629),
                      fontFamily: 'IndieFlower',
                      fontWeight:
                      FontWeight.bold, // set the text color to #FFA629
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Rules',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontFamily: 'IndieFlower',
                    color: Color(0xFFFFA629),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),
                const SizedBox(height: 16.0),
                const Text(
                  'The puzzle comprises of a grid with empty squares and sum-clues positioned at various locations. The objective is to fill all the empty squares with numbers ranging from 1 to 9 such that the sum of each horizontal block equals the clue on its left, and the sum of each vertical block equals the clue on its top. It is important to note that no number can be repeated within the same block.',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'sans-serif',
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/intro_image.jpg',
                        width: 150,
                        height: 150,
                      ),
                      const SizedBox(width: 16),
                      Image.asset(
                        'assets/image1.jpg',
                        width: 150,
                        height: 150,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Placing and deleting numbers',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'IndieFlower',
                    color: Color(0xFFFFA629),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Tap on a square in the grid to select an empty cell and enter a number using the keypad. To delete, select the desired square and tap on the X or the same number on the keypad.',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'sans-serif',
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  //   children: [
                  child: Image.asset(
                    'assets/image2.jpg',
                    width: 150,
                    height: 150,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'An example',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'IndieFlower',
                    color: Color(0xFFFFA629),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'If a row of 2 squares whose sum is 4 intersects with a column of 2 squares whose sum is 3, then, as the numbers are different and non-zero:\n\n- The only combinations for the row are 1+3 or 3+1;\n- The only combinations for the column are 1+2 or 2+1;\n- Therefore, the square at their intersection can only be worth 1, which is the only common number;\n- We can then deduce the value of the other squares in the row and column from this square;\n- And so on...',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'sans-serif',
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'In-Depth Gameplay Guide',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'IndieFlower',
                    color: Color(0xFFFFA629),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  '- Start with the largest numbers: Begin by filling in the largest possible numbers that can fit in the available squares.\n\n'
                      '- Use deduction: Use the sum clues to deduce which numbers can fit in certain squares.\n\n'
                      '- Try different combinations: If you are stuck, try different combinations of numbers until you find the correct one.\n\n'
                      '- Check your work: Make sure you check your work regularly to avoid mistakes.\n\n'
                      '- Keep practicing: The more puzzles you solve, the better you will become at Kakuro.\n\n'
                      '- Enjoy the challenge: Kakuro is a fun and challenging game that requires concentration and logical thinking. Enjoy the process of solving the puzzles!',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'sans-serif',
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Completing a puzzle',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'IndieFlower',
                    color: Color(0xFFFFA629),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Once all the sums in the puzzle have been correctly completed, the game will be finished and a congratulations message will appear.',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'sans-serif',
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  //   children: [
                  child: Image.asset(
                    'assets/image3.jpg',
                    width: 200,
                    height: 200,
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 16.0),
                /* ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    backgroundColor: Color(0xFFFFA629),
                    padding: EdgeInsets.all(15),
                  ),*/
                /* onPressed: () {
                    //to next/previous page(helppage1 puis page1(abd))
                    Navigator.pop(context);
                  },*/
                /*onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HelpPage1()),
                    );
                  },
                  child: Icon(Icons.arrow_back, color: Colors.white),
                ),*/
              ],
            ),
          ),
        ],
      ),
    );
  }
}