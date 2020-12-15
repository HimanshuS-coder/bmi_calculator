import 'package:flutter/material.dart';
import 'input_page.dart';
import 'constants.dart';

class ReusableBottomCard extends StatefulWidget {
  final int input;
  final String type,weightType,tagname1,tagname2;


  ReusableBottomCard({@required this.input,@required this.type,@required this.weightType,@required this.tagname1,@required this.tagname2});

  @override
  _ReusableBottomCardState createState() =>
      _ReusableBottomCardState(input,type,weightType,tagname1,tagname2);
}

class _ReusableBottomCardState extends State<ReusableBottomCard> {
  int input;
  String type,weightType,tagname1,tagname2;

  _ReusableBottomCardState(this.input,this.type,this.weightType,this.tagname1,this.tagname2);

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
                  heroTag: tagname1,
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
                  heroTag: tagname2,
                  backgroundColor: inactivecardcolor,
                  onPressed: () {
                    setState(() {
                      input--;
                    });
                  },
                  child: Icon(Icons.remove),
                ),
              ),
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
