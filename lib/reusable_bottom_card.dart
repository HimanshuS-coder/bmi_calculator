import 'package:flutter/material.dart';
import 'input_page.dart';
import 'constants.dart';

class ReusableBottomCard extends StatefulWidget {
  final int input;
  final String type,weightType;

  ReusableBottomCard({@required this.input,@required this.type,@required this.weightType});

  @override
  _ReusableBottomCardState createState() =>
      _ReusableBottomCardState(input,type,weightType);
}

class _ReusableBottomCardState extends State<ReusableBottomCard> {
  int input;
  String type,weightType;

  _ReusableBottomCardState(this.input,this.type,this.weightType);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            type,
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey.shade300,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              Text(
                '$input',
                style: kstyle,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  weightType,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onLongPress: () {
                  setState(() {
                    input += 10;
                  });
                },
                child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      input++;
                    });
                  },
                  backgroundColor: inactivecardcolor,
                  child: Icon(Icons.add),
                ),
              ),
              GestureDetector(
                onLongPress: () {
                  setState(() {
                    input -= 10;
                  });
                },
                child: FloatingActionButton(
                  backgroundColor: inactivecardcolor,
                  onPressed: () {
                    setState(() {
                      input--;
                    });
                  },
                  child: Icon(Icons.remove),
                ),
              )
            ],
          )
        ],
      ),
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFF686d76),
      ),
    );
  }
}
