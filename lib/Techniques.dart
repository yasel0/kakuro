import 'package:flutter/material.dart';


class TechniquesPage extends StatelessWidget {
  // final String title = 'Advanced Techniques';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECFFB6),
      /*appBar: AppBar(
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
                    'kakuro techniques',
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
                /* const Text(
                  'Objective',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontFamily: 'IndieFlower',
                    color: Color(0xFFFFA629),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),*/
                const Text(
                  'Kakuro is a logic-based puzzle game that involves filling a grid with numbers while following specific rules. The grid consists of white and black cells, where the black cells represent blocks of numbers with corresponding sum clues. The objective is to fill the white cells with numbers 1 to 9, without repeating any number in the same block, so that the sum of the numbers in each horizontal and vertical block equals the corresponding clue. The game requires deduction and problem-solving skills to solve the puzzle, and there is only one correct solution for each puzzle.',
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
                    'assets/image4.jpg',
                    width: 200,
                    height: 200,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Icon(
                      Icons.add_circle_outline,
                      color: Color(0xFFFFA629),
                    ),
                    const SizedBox(width: 17),
                    const Text(
                      'Summing Technique',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'IndieFlower',
                        color: Color(0xFFFFA629),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Summing numbers horizontally or vertically to arrive at a given clue value.',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'sans-serif',
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: const [
                    Icon(Icons.remove, color: Color(0xFFFFA629)),
                    SizedBox(width: 17),
                    Text(
                      'Subtraction Technique',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'IndieFlower',
                        color: Color(0xFFFFA629),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'By identifying the remaining numbers needed to complete a block after summing the given numbers.',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'sans-serif',
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Icon(Icons.linear_scale, color: Color(0xFFFFA629)),
                    const SizedBox(width: 17),
                    const Text(
                      'Range Technique',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'IndieFlower',
                        color: Color(0xFFFFA629),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'By identifying the range of numbers that can be used to complete a block after considering other blocks in the same row or column.',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'sans-serif',
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Icon(Icons.trending_down, color: Color(0xFFFFA629)),
                    const SizedBox(width: 17),
                    const Text(
                      'Deduction Technique',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'IndieFlower',
                        color: Color(0xFFFFA629),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'In order to eliminate possible numbers in a block by considering numbers already used in the same row or column.',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'sans-serif',
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Icon(Icons.highlight_remove, color: Color(0xFFFFA629)),
                    const SizedBox(width: 17),
                    const Text(
                      'Elimination Technique',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'IndieFlower',
                        color: Color(0xFFFFA629),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'By eliminating numbers from the possible options for empty cells in a given block by using the sum of the remaining cells in the same block and the corresponding clue value.',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'sans-serif',
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                /*ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    backgroundColor: Color(0xFFFFA629),
                    padding: EdgeInsets.all(15),
                  ),
                  onPressed: () {
                    //to previous page(helppage puis page1)
                    Navigator.pop(context);
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