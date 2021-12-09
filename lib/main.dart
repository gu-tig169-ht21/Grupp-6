import 'package:flutter/material.dart';
import 'package:my_first_app/apiModel.dart';
import 'package:provider/provider.dart';
import 'bottomnavbar.dart';
import 'list_view.dart';
import 'model.dart';

void main() {
  var state = MyState();
   state.getList();
  runApp(
      ChangeNotifierProvider(create: (context) => state, child: const MyApp()));
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
      home: const MyHomePage(title: 'Exer'),
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
  /*final List<Exer> _list = [
    Exer(
        bodyPart: "waist",
        equipment: "body weight",
        gifUrl: "http://d205bpvrqc9yn1.cloudfront.net/0002.gif",
        id: "0002",
        name: "name",
        target: "target")
  ];*/
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
        //body: ExerciseListView(_list),
        body: Consumer<MyState>(
          builder: (context, state, child) => ExerciseListView(state.list),
        ),
        bottomNavigationBar: const BottomNavBar());
  }
  
}
