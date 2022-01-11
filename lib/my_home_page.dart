import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/main.dart';
import 'package:provider/provider.dart';

import 'api_model.dart';
import 'bottomnavbar.dart';
import 'exercise_list_view.dart';
import 'model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

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
          title: const Text('Exercises'),
          actions: [
            Consumer<MyState>(builder: (context, state, child) {
              return PopupMenuButton(
                itemBuilder: (context) {
                  //Filtreringsmeny
                  return _getPopUpItems(filterList: state.filterList);
                },
                onSelected: (dynamic value) {
                  final String newValue = value ?? 'All';
                  Provider.of<MyState>(context, listen: false).filter(newValue);
                },
              );
            })
          ],
        ),
        body: Consumer<MyState>(builder: (context, state, child) {
          return _listView(state: state);
        }),
        bottomNavigationBar: const BottomNavBar(currentRoute: MyHomePage));
  }

  //Skapar listvy över övningar från _filterList
  _listView({required state}) {
    final List<Exer> filteredExerList =
        _filterList(exerList: state.exerList, filterBy: state.filterBy);
    //Laddningsikon
    if (filteredExerList.isEmpty) {
      return Center(
          child: CircularProgressIndicator(
        color: Colors.pink[300],
      ));
    }
    return ExerciseListView(filteredExerList);
  }

  //Filtrerar lista efter val (ex 'All')
  List<Exer> _filterList(
      {required List<Exer> exerList, required String filterBy}) {
    List<Exer> filteredExerList = [];
    filteredExerList.clear();

    for (Exer exer in exerList) {
      if (exer.target == filterBy) {
        filteredExerList.add(exer);
      } else if (filterBy == "All" && exerList.isNotEmpty) {
        return exerList;
      }
    }
    return filteredExerList;
  }

  //Skapar alternativ i filtreringsmeny
  _getPopUpItems({filterList}) {
    List<PopupMenuItem> filterItems = [];
    //Lägger till en manuell popupitem för att visa alla övningar
    filterItems.add(const PopupMenuItem(child: Text("All"), value: "All"));
    //Skapar popmenuitems från objekt i targetlistan från model
    filterList.forEach((target) {
      var item = PopupMenuItem(child: Text(target), value: target);
      filterItems.add(item);
    });
    return filterItems;
  }
}
