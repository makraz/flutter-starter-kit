import 'package:flutter/material.dart';

import 'presentation/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       theme: ThemeData(
        useMaterial3: true,
        ),
      home: HomePage(),
    );
  }
}

