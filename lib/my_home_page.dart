
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/main.dart';
import 'package:provider/provider.dart';

import 'api_model.dart';
import 'bottomnavbar.dart';
import 'exercise_list_view.dart';
import 'model.dart';

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
            Consumer<MyState>(builder: (context, state, child) {
              return PopupMenuButton(
                itemBuilder: (context) {
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
        bottomNavigationBar: const BottomNavBar(
          currentRoute: MyApp,
        ));
  }

  _listView({required state}) {
    final List<Exer> filteredExerList =
        _filterList(exerList: state.list, filterBy: state.filterBy);
    return ListView.builder(
      shrinkWrap: true,
      itemCount: filteredExerList.isEmpty ? 1 : filteredExerList.length,
      itemBuilder: (context, index) {
        if (filteredExerList.isEmpty) {
          return Center(
              child: CircularProgressIndicator(
            color: Colors.pink[300],
          ));
        }
        return ExerciseListView(filteredExerList);
      },
    );
  }

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

  _getPopUpItems({filterList}) {
    List<PopupMenuItem> filterItems = [];
    filterItems.add(const PopupMenuItem(child: Text("All"), value: "All"));
    filterList.forEach((target) {
      var item = PopupMenuItem(child: Text(target), value: target);
      filterItems.add(item);
    });
    return filterItems;
  }
}