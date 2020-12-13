import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'reusable_gender.dart';
import 'constants.dart';

const Color activecardcolor = Color(0xFF686d76);
const Color inactivecardcolor = Color(0xFF393e46);

enum Gendertype { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Color maleColor = inactivecardcolor;
  // Color femaleColor = inactivecardcolor;

  Gendertype genderSelected;
  double currentValue = 180;
  int weight = 60, age = 15;

  // void updateColor({gendertype n}){

  //   // if(n==gendertype.male){
  //   //   maleColor=activecardcolor;
  //   //   femaleColor=inactivecardcolor;
  //   // }else{
  //   //   femaleColor=activecardcolor;
  //   //   maleColor=inactivecardcolor;
  //   // }
  // }

  @override
  Widget build(BuildContext context) {
    int curvalue = currentValue.toInt();

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI Calculator',
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onpress: () {
                      setState(() {
                        genderSelected = Gendertype.male;
                      });
                    },
                    colour: genderSelected == Gendertype.male
                        ? activecardcolor
                        : inactivecardcolor,
                    cardchild: ReusableGender(
                      ic: FontAwesomeIcons.mars,
                      gender: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onpress: () {
                      setState(() {
                        genderSelected = Gendertype.female;
                      });
                    },
                    colour: genderSelected == Gendertype.female
                        ? activecardcolor
                        : inactivecardcolor,
                    cardchild: ReusableGender(
                      ic: FontAwesomeIcons.venus,
                      gender: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: TextStyle(fontSize: 20, color: Colors.grey.shade300),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        '$curvalue',
                        style: kstyle,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        'cm',
                        style: TextStyle(
                            fontSize: 15, color: Colors.grey.shade300),
                      )
                    ],
                  ),
                  Slider(
                      value: currentValue,
                      min: 10,
                      max: 250,
                      divisions: 240,
                      activeColor: inactivecardcolor,
                      inactiveColor: Color(0xFF373a40),
                      label: currentValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          currentValue = value;
                        });
                      }),
                ],
              ),
              colour: activecardcolor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
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
                              '$weight',
                              style: kstyle,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                'kg',
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
                                onLongPress :(){
                                  setState(() {
                                    weight+=10;
                                  });
                                },
                                child: FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                backgroundColor: inactivecardcolor,
                                child: Icon(Icons.add),
                              ),
                            ),
                            GestureDetector(
                                
                                onLongPress: (){
                                  setState(() {
                                    weight=weight-10;
                                  });
                                },
                                child: FloatingActionButton(
                                backgroundColor: inactivecardcolor,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                child: Icon(Icons.remove),
                                
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    colour: activecardcolor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: activecardcolor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFFEB1555),
            ),
            height: 80,
            width: double.infinity,
          )
        ],
      ),
    );
  }
}
