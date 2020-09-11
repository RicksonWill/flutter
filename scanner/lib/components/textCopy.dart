import 'package:flutter/material.dart';

class TextCopy extends StatefulWidget {
  final String text;
  final Widget iconButton;

  const TextCopy({Key key, this.text, this.iconButton}) : super(key: key);

  @override
  _TextCopyState createState() => _TextCopyState();
}

class _TextCopyState extends State<TextCopy> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RotatedBox(
                quarterTurns: 0,
                child: Image.asset(
                  'assets/borde.png',
                  height: 25,
                ),
              ),
              RotatedBox(
                quarterTurns: 1,
                child: Image.asset(
                  'assets/borde.png',
                  height: 25,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Text(
                      widget.text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: const Color(0xFF606060), fontSize: 17),
                    )),
                widget.iconButton
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RotatedBox(
                quarterTurns: 3,
                child: Image.asset(
                  'assets/borde.png',
                  height: 25,
                ),
              ),
              RotatedBox(
                quarterTurns: 2,
                child: Image.asset(
                  'assets/borde.png',
                  height: 25,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
