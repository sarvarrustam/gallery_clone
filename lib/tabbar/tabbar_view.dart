import 'package:file_picker_galery/pages/main/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabbarView extends StatefulWidget {
  const TabbarView({Key? key}) : super(key: key);

  @override
  State<TabbarView> createState() => _TabbarViewState();
}

class _TabbarViewState extends State<TabbarView> {
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      bottomNavigationBar: getFooter(),
      body: IndexedStack(
        index: activeTab,
        children: [
          const MainScreen(),
          Center(
            child: Text(
              "Library",
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        ],
      ),
    );
  }

  Widget getFooter() {
    return BottomNavigationBar(
        unselectedItemColor: Theme.of(context).bottomAppBarColor,
        selectedItemColor: Colors.blue,
        currentIndex: activeTab,
        onTap: (index) {
          setState(() {
            activeTab = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.photo),
            label: "Photos",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.photo_on_rectangle),
            label: "Albums",
          ),
        ]);
  }
}
