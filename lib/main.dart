import 'package:flutter/material.dart';
import 'package:my_first_app/apiModel.dart';
import 'package:provider/provider.dart';
import 'bottomnavbar.dart';
import 'exercise_list_view.dart';
import 'model.dart';
import 'my_routines.dart';
import 'spec_routine.dart';

void main() {
  var state = MyState();
  state.initialize();
  runApp(
      ChangeNotifierProvider(create: (context) => state, child: const MyApp()));
  //MultiProvider
  //Page route transistions
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          //primarySwatch: Colors.blue,
          ),
      home: const MyHomePage(title: 'Exercises'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange[300],
          centerTitle: true,
          title: Text(widget.title),
          actions: [
            PopupMenuButton(
                onSelected: (int) {},
                itemBuilder: (context) => [
                      const PopupMenuItem(
                          child: Text('UpperBody'), value: 'UpperBody'),
                      const PopupMenuItem(
                          child: Text('LowerBody'), value: 'LowerBody'),
                      const PopupMenuItem(child: Text('Waist'), value: 'Waist'),
                      const PopupMenuItem(child: Text('Back'), value: 'Back'),
                    ]),
          ],
        ),
        body: Consumer<MyState>(
            builder: (context, state, child) => ExerciseListView(state.list)),
        bottomNavigationBar: const BottomNavBar());
  }
}
