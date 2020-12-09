import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        
        primaryColor: Color(0xFF373a40),
        scaffoldBackgroundColor: Color(0xFF373a40),
        // You can also use TextTheme.dark.copywith() inside this bracket you can write all the properties like primary color , other colors and more .
        // This is used if you want to apply all these properties along side dark theme.
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.white,
          ),
        ),
        
      ),
      home: InputPage(),
    );
  }
}

