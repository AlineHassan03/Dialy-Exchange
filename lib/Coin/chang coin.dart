import 'package:flutter/material.dart';
import 'package:flutter_application_3/app/auth/login_screen.dart';
import 'package:flutter_application_3/app/auth/sing_up_screen.dart';
import 'package:flutter_application_3/components/applocal.dart';
import 'package:flutter_application_3/components/shaerd_pref/shared.dart';

class DataSearch extends SearchDelegate {
  List Listlanguage = [
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
    "USD"
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
          color: Colors.green,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(getLang(context, "Do you have an account ?")),
          ElevatedButton(
              onPressed: () async {
                await CacheService.saveData(key: "currency", value: query);
                await CacheService.saveData(key: "onboarding", value: true);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (route) => false);
              },
              child: Text(getLang(context, "Login"))),
          Text(getLang(context, "Don't have an account?")),
          ElevatedButton(
              onPressed: () async {
                await CacheService.saveData(key: "currency", value: query);
                await CacheService.saveData(key: "onboarding", value: true);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => SingUpScreen()),
                    (route) => false);
              },
              child: Text(getLang(context, "Sign up now"))),
        ],
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List filternames =
        Listlanguage.where((element) => element.contains(query)).toList();

    return ListView.builder(
      itemCount: query == "" ? Listlanguage.length : filternames.length,
      itemBuilder: (context, i) {
        return InkWell(
          onTap: () {
            query = query == "" ? Listlanguage[i] : filternames[i];
            showResults(context);
          },
          child: Container(
            padding: EdgeInsets.all(10),
            child: query == ""
                ? Text(
                    "${getLang(context, Listlanguage[i])}",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )
                : Text(
                    getLang(context, filternames[i]),
                    style: TextStyle(fontSize: 19),
                  ),
          ),
        );
      },
    );
  }
}
