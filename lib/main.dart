import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'Grid List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: Row(
          children: [
            SizedBox(
              width: 600,
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(9, (index) {
                  return TicTacToe();
                }),
              ),
            ),
            TicTacToeOp(),
          ],
        ),
      ),
    );
  }
}

class TicTacToe extends StatefulWidget {
  const TicTacToe({Key? key}) : super(key: key);

  @override
  _TicTacToeState createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  String? _icon;

  @override
  Widget build(BuildContext context) {
    return DragTarget<String>(
      builder: (context, candidateData, rejectedData) {
        return Container(
          width: 120,
          height: 120,
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: _icon != null ? Colors.white : Colors.grey,
            border: _icon != null
                ? Border.all(
                    color: _getIconColor(),
                    width: 2,
                  )
                : null,
          ),
          child: _icon != null
              ? Icon(
                  _icon == 'X' ? Icons.close : Icons.circle_outlined,
                  color: _getIconColor(),
                  size: 24,
                )
              : null,
        );
      },
      onAccept: (data) {
        setState(() {
          _icon = data;
        });
      },
    );
  }

  Color _getIconColor() {
    return _icon == 'X' ? Colors.blue : Colors.green;
  }
}

class TicTacToeOp extends StatelessWidget {
  const TicTacToeOp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Draggable<String>(
          feedback: Container(
            width: 120,
            height: 120,
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: const Icon(
              Icons.close,
              color: Colors.blue,
              size: 24,
            ),
          ),
          data: 'X',
          child: Container(
            width: 150,
            height: 150,
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.blue, width: 2),
              color: Colors.white,
            ),
            child: const Icon(
              Icons.close,
              color: Colors.blue,
              size: 24,
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Draggable<String>(
          feedback: Container(
            width: 120,
            height: 120,
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: const Icon(
              Icons.circle_outlined,
              color: Colors.green,
              size: 24,
            ),
          ),
          data: 'O',
          child: Container(
            width: 150,
            height: 150,
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.green, width: 2),
              color: Colors.white,
            ),
            child: const Icon(
              Icons.circle_outlined,
              color: Colors.green,
              size: 24,
            ),
          ),
        ),
      ],
    );
  }
}
