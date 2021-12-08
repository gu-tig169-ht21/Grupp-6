/* import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigationBars extends StatefulWidget {
  ///[currentRoute] is used to know what route we are on.
  ///
  ///[currentRoute] is mostly used for knowing if we are on [LiftRoute] screen or not.
  final currentRoute;
  final recentSearch;
  const BottomNavigationBars({Key key, this.currentRoute, this.recentSearch})
      : super(key: key);
  @override
  _BottomNavigationBarsState createState() => _BottomNavigationBarsState();
}

class _BottomNavigationBarsState extends State<BottomNavigationBars> {
  @override
  Widget build(BuildContext context) {
    ///Starting index at 0. Must have a default index.
    int navigationIndex = 0;
    return BottomNavigationBar(
      ///Same fontsizes selected and unselected.
      selectedFontSize: 14,
      unselectedFontSize: 14,

      ///Display text color grey if we dont have any [currentRoute] else blue.
      selectedItemColor:
          widget.currentRoute == null ? Colors.grey : Colors.lightBlue,

      ///Items.
      items: <BottomNavigationBarItem>[
        ///Overview.
        _overViewItem(),

        ///Statistics.
        _statisticsItem(),

        ///Service.
        _serviceItem(),
      ],

      ///Index is default 0.
      currentIndex: navigationIndex,

      ///Ontap function.
      onTap: (int index) {
        if (mounted) {
          setState(() {
            navigationIndex = index;
            switch (navigationIndex) {
              case 0:
                _navigateToLiftRoute();
                break;
              case 1:

                ///Nothing.
                break;
              case 2:

                ///Nothing.
                break;
            }
          });
        }
      },
    );
  }

  _overViewItem() {
    return BottomNavigationBarItem(
      ///Label.
      label: 'Overview',

      ///Show active icon if user is on [LiftRoute].
      activeIcon: widget.currentRoute != LiftRoute
          ? SvgImage('bottom_appbar/dashboard_inactive.svg',
              'overview/dashbard_inactive', 24)
          : SvgImage('bottom_appbar/dashboard_active.svg',
              'overview/dashbard_active', 24),
      icon: SvgImage('bottom_appbar/dashboard_inactive.svg',
          'overview/dashbard_inactive', 24),
    );
  }

  _statisticsItem() {
    return BottomNavigationBarItem(
      ///Label.
      label: 'Statistics',
      activeIcon: SvgImage('bottom_appbar/statistics_active.svg',
          'Statistics/statistics_active', 24),
      icon: SvgImage('bottom_appbar/statistics_inactive.svg',
          'Statistics/statistics_inactive', 24),
    );
  }

  _serviceItem() {
    return BottomNavigationBarItem(
      label: 'Service',
      activeIcon: SvgImage(
          'bottom_appbar/service_active.svg', 'service/service_active', 24),
      icon: SvgImage(
          'bottom_appbar/service_inactive.svg', 'service/service_inactive', 24),
    );
  }

  _navigateToLiftRoute() {
    ///Check if we can pop.
    if (Navigator.canPop(context)) {
      ///First we pop so we cant go back to the same route.
      Navigator.pop(context);
    }

    ///Then push to [LiftRoute].
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(

            ///Send permissionstatus and search history to [LiftRoute]?
            builder: (context) =>
                LiftRoute(recentSearch: [], hasShownAlert: true)));
  }
}
 */