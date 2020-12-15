import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'reusable_gender.dart';
import 'constants.dart';
import 'result_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  double result;
  String type, phrase;
  Color getcolor;

  void calculateBmi() {
    print('$weight and $currentValue');
    result = (weight / ((currentValue * currentValue) / 10000)).toDouble();
  }

  void fetchBMI() {
    if (result < 16) {
      type = 'Severe Thinness';
      phrase = 'You have to take more calories to gain weight.';
      getcolor = Colors.yellow.shade800;
    } else if (result > 15 && result < 18) {
      type = 'Moderate Thinness';
      phrase = 'You should take more carbs,protein etc to gain weight.';
      getcolor = Colors.yellow.shade600;
    } else if (result > 17 && result < 18.6) {
      type = 'Mild Thinness';
      phrase = 'You should take more calories to gain weight.';
      getcolor = Colors.yellow;
    } else if (result > 18.5 && result < 26) {
      type = 'Normal';
      phrase = 'You are perfectly in shape.';
      getcolor = Colors.green;
    } else if (result > 25) {
      type = 'Overweight';
      phrase =
          'You have a higher than normal body weight. Try to exercise more.';
      getcolor = Colors.red.shade800;
    }
  }

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
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 14, disabledThumbRadius: 14),
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: inactivecardcolor,
                      inactiveTrackColor: Colors.white24, //Color(0xFF373a40),
                      overlayColor: Color(0x29EB1555),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 25),
                      valueIndicatorColor: Color(0xFFEB1555),
                      valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                      trackHeight: 2,
                    ),
                    child: Slider(
                      value: currentValue,
                      min: 10,
                      max: 250,
                      divisions: 240,
                      //activeColor: inactivecardcolor,
                      //inactiveColor: Color(0xFF373a40),
                      label: currentValue.round().toString(),
                      onChanged: (double value) {
                        setState(
                          () {
                            currentValue = value;
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              colour: activecardcolor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: Column(
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
                                'Kg',
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
                                  weight += 10;
                                });
                              },
                              child: FloatingActionButton(
                                heroTag: 'we+',
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
                              onLongPress: () {
                                setState(() {
                                  weight -= 10;
                                });
                              },
                              child: FloatingActionButton(
                                heroTag: 'we-',
                                backgroundColor: inactivecardcolor,
                                onPressed: () {
                                  setState(() {
                                    weight--;
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
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
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
                              '$age',
                              style: kstyle,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                'Yrs',
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
                                  age += 10;
                                });
                              },
                              child: FloatingActionButton(
                                heroTag: 'ag+',
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                backgroundColor: inactivecardcolor,
                                child: Icon(Icons.add),
                              ),
                            ),
                            GestureDetector(
                              onLongPress: () {
                                setState(() {
                                  age -= 10;
                                });
                              },
                              child: FloatingActionButton(
                                heroTag: 'ag-',
                                backgroundColor: inactivecardcolor,
                                onPressed: () {
                                  setState(() {
                                    age--;
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
                  ),
                ),
              ],
            ),
          ),
          FlatButton(
            padding: EdgeInsets.all(0),
            textColor: Colors.white,
            onPressed: () {
              setState(
                () {
                  if (genderSelected == null) {
                    Fluttertoast.showToast(msg: 'Please Select a Gender Type',gravity: ToastGravity.CENTER,fontSize: 22);
                  } else {
                    calculateBmi();
                    fetchBMI();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(
                          result: result,
                          type: type,
                          phrase: phrase,
                          getcolor: getcolor,
                        ),
                      ),
                    );
                  }
                },
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFEB1555),
              ),
              child: Center(
                child: Text(
                  'CALCULATE',
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
    );
  }
}
