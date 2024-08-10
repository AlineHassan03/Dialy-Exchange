import 'package:flutter/material.dart';
import 'package:flutter_application_3/app/expense/addexpense.dart';
import 'package:flutter_application_3/app/contatct_screen/contact_screen.dart';
import 'package:flutter_application_3/app/auth/sqflite/auth_service.dart';
import 'package:flutter_application_3/app/category_screen/category_screen.dart';
import 'package:flutter_application_3/app/home_screen/expense_page/expense_page.dart';
import 'package:flutter_application_3/app/home_screen/graph_date/graph_date_page.dart';
import 'package:flutter_application_3/components/applocal.dart';
import 'package:flutter_application_3/main.dart';
import 'package:flutter_application_3/app/setting_screen/setting_screen.dart';

import 'package:share_plus/share_plus.dart';

import '../pages/privacy_security_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List<Widget> _bottomnavigationbarscreenwidget = [
    ExpensePage(),
    CategoryScreen(),
    GraphDatePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => AddExpense());
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.grey[200],
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          FutureBuilder(
              future: UserService().getUserByEmail(Profile.email!),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                    ),
                    accountName: Text(
                      "${snapshot.data!.firstName!}, ${snapshot.data!.lastName!}",
                      style: TextStyle(color: Colors.black),
                    ),
                    accountEmail: Text(
                      snapshot.data!.email!,
                      style: TextStyle(color: Colors.black),
                    ),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black12,
                      child: Image.asset(
                          fit: BoxFit.fill, "assets/images/16293972.png"),
                    ),
                  );
                } else {
                  return Container();
                }
              }),
          ListTile(
            leading: const Icon(
              Icons.home,
              color: Colors.blue,
            ),
            title: Text(getLang(context, "Home")),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: Colors.blue,
            ),
            title: Text(getLang(context, "Settings")),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SettingScreen()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.info,
              color: Colors.blue,
            ),
            title: Text(getLang(context, "About us")),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ContactScreen()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.share,
              color: Colors.blue,
            ),
            title: Text(getLang(context, "Share with friends")),
            onTap: () async {
              await Share.share(
                  "${getLang(context, "You can download the application from the following link")} ${Uri.parse("https://www.google.com/")}");
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.flag,
              color: Colors.blue,
            ),
            title: Text(getLang(context, "Privacy policy")),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PrivacySecurityPage()));
            },
          ),
        ],
      )),
      appBar: AppBar(
        actions: [],
        title: Text(
          getLang(context, "Recorde your expenses"),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[300],
        elevation: 0,
      ),
      body: _bottomnavigationbarscreenwidget[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.purple,
            ),
            label: getLang(context, "Home"),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.category,
              color: Colors.purple,
            ),
            label: getLang(context, "Category"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.graphic_eq,
              color: Colors.purple,
            ),
            label: getLang(context, "Graph"),
          ),
        ],
      ),
    );
  }
}
