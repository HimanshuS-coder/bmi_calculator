import 'package:flutter/material.dart';
import 'reusable_card.dart';

class ResultPage extends StatefulWidget {
  final double result;
  final String type, phrase;
  final Color getcolor;

  ResultPage(
      {@required this.result,
      @required this.type,
      @required this.phrase,
      @required this.getcolor});

  @override
  _ResultPageState createState() =>
      _ResultPageState(result, type, phrase, getcolor);
}

class _ResultPageState extends State<ResultPage> {
  double result;
  String type, phrase;
  Color getcolor;

  _ResultPageState(this.result, this.type, this.phrase, this.getcolor);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  'Your Result',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 12,
              child: ReusableCard(
                colour: Color(0xFF686d76),
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      type,
                      style: TextStyle(
                        color: getcolor,
                        fontSize: 35,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 5,
                      ),
                    ),
                    Text(
                      result.toStringAsPrecision(4),
                      style: TextStyle(
                        fontSize: 80,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      phrase,
                      style: TextStyle(
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            FlatButton(
              padding: EdgeInsets.all(0),
              textColor: Colors.white,
              
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFEB1555),
                ),
                child: Center(
                  child: Text(
                    'RE-CALCULATE',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 3,
                    ),
                  ),
                ),
                height: 80,
                width: double.infinity,
              ),
            )
          ],
        ),
      ),
    );
  }
}
