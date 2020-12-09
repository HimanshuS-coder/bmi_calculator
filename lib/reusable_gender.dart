import 'package:flutter/material.dart';

class ReusableGender extends StatelessWidget {
  final IconData ic;
  final String gender;

  ReusableGender({@required this.ic, @required this.gender});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          ic,
          size: 90,
          color: Colors.grey.shade300,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          gender,
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey.shade300,
            
          ),
        )
      ],
    );
  }
}


// floatingActionButton: Theme(
//         data: ThemeData(
//           accentColor: Colors.blue,   We can also give theme to a particular widget like this.
//         ),
//         child: FloatingActionButton(
//     child: Icon(Icons.add),
//   ),
// ),
