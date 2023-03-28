// ignore: unused_import
import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snake and Ladder',
      locale: const Locale("fa", "IR"),
      theme: ThemeData(fontFamily: "IRANSansXFaNum-Medium"),
      debugShowCheckedModeBanner: false,
      home: const SnakeAndLadderPage(),
    );
  }
}

class SnakeAndLadderPage extends StatefulWidget {
  const SnakeAndLadderPage({super.key});

  @override
  State<SnakeAndLadderPage> createState() => _SnakeAndLadderPageState();
}

class _SnakeAndLadderPageState extends State<SnakeAndLadderPage> {
  // This key will be associated with the amber box
  final List<GlobalKey> _keys = List.generate(100, (index) => GlobalKey());

  // This function is called when the user presses the floating button
  void _getOffsetAndSize(GlobalKey key) {
    RenderBox? box = key.currentContext?.findRenderObject() as RenderBox?;
    Offset? position = box?.localToGlobal(Offset.zero);
    if (position != null) {
      setState(() {
        final RenderBox renderBox =
            key.currentContext?.findRenderObject() as RenderBox;
        key.currentContext?.size;

        final Size size = renderBox.size;
        debugPrint('Size: ${size.width}, ${size.height}');
        debugPrint("x: ${position.dx}, y: ${position.dy} ");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          radius: 0.8,

          colors: [
            // Color(0xFFF2A65A),
            // Color(0xFFD2691E),
            Color(0xFF772F1A),
            Color.fromARGB(255, 62, 39, 35),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              drawBoard(),
            ]),
      ),
    );
  }

  Center drawBoard() {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
          shrinkWrap: true,
          reverse: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 10,
          ),
          itemBuilder: (_, index) {
            return GestureDetector(
              onTap: () => _getOffsetAndSize(_keys[index]),
              child: Container(
                key: _keys[index],
                decoration: BoxDecoration(
                  color: ((index ~/ 10) % 2 == 0) && (index % 2 == 0)
                      ? Colors.brown
                      : ((index ~/ 10) % 2 == 1) && (index % 2 == 1)
                          ? Colors.brown
                          : Colors.brown[800],
                  borderRadius:
                      (index == 0 || index == 9 || index == 90 || index == 99)
                          ? setBorderRadius(index)
                          : null,
                ),
                child: Center(
                  child: Text(
                    (index + 1).toString(),
                    style: const TextStyle(color: Colors.amber),
                  ),
                ),
              ),
            );
          },
          itemCount: 100,
        ),
      ),
    );
  }

  setBorderRadius(int index) {
    switch (index) {
      case 0:
        return const BorderRadius.only(bottomLeft: Radius.circular(17.5));
      case 9:
        return const BorderRadius.only(bottomRight: Radius.circular(17.5));
      case 90:
        return const BorderRadius.only(topLeft: Radius.circular(17.5));
      case 99:
        return const BorderRadius.only(topRight: Radius.circular(17.5));
      default:
    }
  }
}

// class SnakeAndLadderPage extends StatefulWidget {
//   const SnakeAndLadderPage({super.key});

//   @override
//   State<SnakeAndLadderPage> createState() => _SnakeAndLadderPageState();
// }

// class _SnakeAndLadderPageState extends State<SnakeAndLadderPage>
//     with SingleTickerProviderStateMixin {
//   static int boardSize = 10;
//   final int numSnakes = 3;
//   final int numLadders = 3;

//   // Define the board layout
//   List<List<int>> board = List.generate(
//     10,
//     (i) => List.generate(10, (j) => i * 10 + (i % 2 == 0 ? j : 9 - j)),
//     growable: false,
//   );

//   // Define the snake positions
//   List<int> snakePositions = List.generate(
//     3,
//     (i) => Random().nextInt(boardSize * boardSize - 1) + 1,
//     growable: false,
//   );

//   // Define the ladder positions
//   List<int> ladderPositions = List.generate(
//     3,
//     (i) => Random().nextInt(boardSize * boardSize - 1) + 1,
//     growable: false,
//   );

//   // Define the players
//   int numPlayers = 2;
//   List<int> playerPositions = List.generate(
//     2,
//     (i) => 0,
//     growable: false,
//   );

//   // Define the dice roll animation controller
//   late AnimationController diceController;

//   @override
//   void initState() {
//     super.initState();
//     diceController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 500),
//     );
//   }

//   @override
//   void dispose() {
//     diceController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Snake and Ladder'),
//       ),
//       body: Center(
//         // ignore: sized_box_for_whitespace
//         child: Container(
//           // padding: const EdgeInsets.symmetric(horizontal: 0),
//           width: 500,
//           height: 500,
//           child: Stack(
//             children: [
//               // Draw the board
//               drawBoard(),

//               // Draw the players
//               for (int i = 0; i < numPlayers; i++) drawPlayers(i),

//               // Draw the dice
//               drawDice(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   CustomPaint drawBoard() {
//     return CustomPaint(
//       painter: BoardPainter(
//         boardSize: boardSize,
//         board: board,
//         snakePositions: snakePositions,
//         ladderPositions: ladderPositions,
//       ),
//       size: const Size(500, 500),
//     );
//   }

//   Positioned drawPlayers(int i) {
//     return Positioned(
//       top: (boardSize - playerPositions[i] ~/ boardSize - 1) * 50 + 5,
//       left: (playerPositions[i] % boardSize) * 50 + 5,
//       child: Container(
//         width: 40,
//         height: 40,
//         decoration: BoxDecoration(
//           color: i == 0 ? Colors.red : Colors.green,
//           shape: BoxShape.circle,
//         ),
//       ),
//     );
//   }

//   Positioned drawDice() {
//     return Positioned(
//       bottom: 50,
//       left: 50,
//       child: GestureDetector(
//         onTap: () {
//           if (!diceController.isAnimating) {
//             // Roll the dice
//             int roll = Random().nextInt(6) + 1;
//             diceController.forward(from: 0);

//             // Move the player
//             setState(() {
//               playerPositions[0] = (playerPositions[0] + roll)
//                   .clamp(0, boardSize * boardSize - 1);
//             });

//             // Check for snakes and ladders
//             int snakeIndex = snakePositions.indexOf(playerPositions[0]);
//             if (snakeIndex >= 0) {
//               int tailPosition =
//                   (snakePositions[snakeIndex] - (snakeIndex + 1) * 10)
//                       .clamp(0, boardSize * boardSize - 1);
//               setState(() {
//                 playerPositions[0] = tailPosition;
//               });
//             }

//             int ladderIndex = ladderPositions.indexOf(playerPositions[0]);
//             if (ladderIndex >= 0) {
//               int headPosition =
//                   (ladderPositions[ladderIndex] + (ladderIndex + 1) * 10)
//                       .clamp(0, boardSize * boardSize - 1);
//               setState(() {
//                 playerPositions[0] = headPosition;
//               });
//             }
//           }
//         },
//         child: AnimatedBuilder(
//           animation: diceController,
//           builder: (context, child) => Transform.rotate(
//             angle: diceController.value * pi,
//             child: child,
//           ),
//           child: const Icon(
//             Icons.trip_origin,
//             size: 100,
//             color: Colors.grey,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class BoardPainter extends CustomPainter {
//   final int boardSize;
//   final List<List<int>> board;
//   final List<int> snakePositions;
//   final List<int> ladderPositions;

//   BoardPainter({
//     required this.boardSize,
//     required this.board,
//     required this.snakePositions,
//     required this.ladderPositions,
//   });

//   @override
//   void paint(Canvas canvas, Size size) {
//     // Define the colors used for drawing
//     final Paint whitePaint = Paint()..color = Colors.white;
//     final Paint blackPaint = Paint()..color = Colors.black;
//     final Paint redPaint = Paint()..color = Colors.red;
//     final Paint greenPaint = Paint()..color = Colors.green;

//     // Draw the board grid
//     for (int i = 0; i < boardSize; i++) {
//       for (int j = 0; j < boardSize; j++) {
//         canvas.drawRect(
//           Rect.fromLTWH(j * 50, (boardSize - i - 1) * 50, 50, 50),
//           whitePaint,
//         );
//         canvas.drawRect(
//           Rect.fromLTWH(j * 50, (boardSize - i - 1) * 50, 50, 50),
//           blackPaint..style = PaintingStyle.stroke,
//         );
//       }
//     }

//     // Draw the snakes
//     for (int i = 0; i < snakePositions.length; i++) {
//       int headRow = boardSize - 1 - snakePositions[i] ~/ boardSize;
//       int headCol = snakePositions[i] % boardSize;
//       int tailRow = headRow - i - 1;
//       int tailCol = headCol + i + 1;
//       canvas.drawLine(
//           Offset(headCol * 50 + 25, headRow * 50 + 25),
//           Offset(tailCol * 50 + 25, tailRow * 50 + 25),
//           redPaint..strokeWidth = 5);
//     }

//     // Draw the ladders
//     for (int i = 0; i < ladderPositions.length; i++) {
//       int headRow = boardSize - 1 - ladderPositions[i] ~/ boardSize;
//       int headCol = ladderPositions[i] % boardSize;
//       int tailRow = headRow - i - 1;
//       int tailCol = headCol - i - 1;
//       canvas.drawLine(
//           Offset(headCol * 50 + 25, headRow * 50 + 25),
//           Offset(tailCol * 50 + 25, tailRow * 50 + 25),
//           greenPaint..strokeWidth = 5);
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
