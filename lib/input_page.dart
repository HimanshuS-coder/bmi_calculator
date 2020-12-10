import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'reusable_gender.dart';

const Color activecardcolor = Color(0xFF686d76);
const Color inactivecardcolor= Color(0xFF393e46);

enum Gendertype {male,female}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Color maleColor = inactivecardcolor;
  // Color femaleColor = inactivecardcolor;

  Gendertype genderSelected;

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
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI Calculator',
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        // updateColor(n: gendertype.male);
                        genderSelected=Gendertype.male; 
                      });
                    },
                    child: ReusableCard(
                      colour: genderSelected==Gendertype.male ? activecardcolor : inactivecardcolor,
                      cardchild: ReusableGender(
                        ic: FontAwesomeIcons.mars,
                        gender: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        // updateColor(n: gendertype.female);
                        genderSelected=Gendertype.female;
                      });
                    },
                    child: ReusableCard(
                      colour: genderSelected==Gendertype.female ? activecardcolor : inactivecardcolor,
                      cardchild: ReusableGender(
                        ic: FontAwesomeIcons.venus,
                        gender: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: activecardcolor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
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


