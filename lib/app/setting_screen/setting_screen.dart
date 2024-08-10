import 'package:flutter/material.dart';

import 'package:flutter_application_3/app/home_screen/home_screen.dart';
import 'package:flutter_application_3/components/applocal.dart';
import 'package:flutter_application_3/components/shaerd_pref/shared.dart';
import 'package:flutter_application_3/main.dart';

import '../pages/about_screen.dart';
import '../pages/account_screen.dart';
import '../pages/privacy_security_page.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String initValue = "ar";
  List<String> langualgeList = ["ar", "en"];
  @override
  Widget build(BuildContext context) {
    initValue = AppLocale.of(context).locale.languageCode;
    return Scaffold(
        appBar: AppBar(
          title: Text(getLang(context, "Settings")),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: ListView(children: [
          Container(
            height: 30,
          ),
          ListTile(
              leading: const Icon(
                Icons.money,
                color: Colors.blue,
              ),
              title: Text(getLang(context, "Coin")),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                showSearch(context: context, delegate: DataSearchForSettings());
              }),
          ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.blue,
              ),
              title: Text(getLang(context, "Account")),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AccountScreen()));
              }),
          ListTile(
            leading: const Icon(
              Icons.language_outlined,
              color: Colors.blue,
            ),
            title: Text(getLang(context, "Language")),
            trailing: DropdownButton(
              value: initValue,
              items: langualgeList
                  .map(
                    (month) => DropdownMenuItem(
                      alignment: AlignmentDirectional.center,
                      value: month,
                      child: Text(
                        getLang(context, month),
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).textScaler.scale(15),
                        ),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value == "ar") {
                  MyApp.of(context)!.changeLanguage(Locale("ar"));
                } else {
                  MyApp.of(context)!.changeLanguage(Locale("en"));
                }
                initValue = value!;
              },
            ),
          ),
          ListTile(
              leading: const Icon(
                Icons.remove_circle_outline,
                color: Colors.blue,
              ),
              title: Text(getLang(context, "Appearance")),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {}),
          ListTile(
              leading: const Icon(
                Icons.privacy_tip_outlined,
                color: Colors.blue,
              ),
              title: Text(getLang(context, "privacy&Security")),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PrivacySecurityPage()));
              }),
          ListTile(
              leading: const Icon(
                Icons.adb_outlined,
                color: Colors.blue,
              ),
              title: Text(getLang(context, "About")),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutUsPage()));
              }),
        ]));
  }
}

class DataSearchForSettings extends SearchDelegate {
  List ListCurrancy = [
    "SYP",
    "LBP",
    "EGP",
    "SAR",
    "AED",
    "MAD",
    "OMR",
    "IQD",
    "DZD",
    "YER",
    "TND",
    "SDG",
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(
          Icons.arrow_back,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(15),
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "${getLang(context, "You have selected a")}${getLang(context, query)} ${getLang(context, "currency as the current application currency. Do you want to continue?")}",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                await CacheService.saveData(key: "currency", value: query);
                Profile().initcurrency();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                    (route) => false);
              },
              child: Text(getLang(context, "Next")))
        ],
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List filternames =
        ListCurrancy.where((element) => element.contains(query)).toList();

    return ListView.builder(
      itemCount: query == "" ? ListCurrancy.length : filternames.length,
      itemBuilder: (context, i) {
        return InkWell(
            onTap: () {
              query = query == "" ? ListCurrancy[i] : filternames[i];
              showResults(context);
            },
            child: Container(
                padding: EdgeInsets.all(10),
                child: query == ""
                    ? Text(
                        getLang(context, ListCurrancy[i]),
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )
                    : Text(
                        getLang(context, filternames[i]),
                        style: TextStyle(fontSize: 19),
                      )));
      },
    );
  }
}
