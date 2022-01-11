import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model.dart';
import 'my_home_page.dart';

void main() {
  var state = MyState();
  state.initialize();
  runApp(
      ChangeNotifierProvider(create: (context) => state, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Exercises',
      home: MyHomePage(),
    );
  }
}
