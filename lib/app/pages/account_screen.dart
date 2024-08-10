import 'package:flutter/material.dart';
import 'package:flutter_application_3/components/applocal.dart';

import '../../main.dart';
import '../auth/sqflite/auth_service.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(getLang(context, "Account")),
        ),
        body: FutureBuilder(
            future: UserService().getUserByEmail(Profile.email!),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Center(
                    child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundImage:
                            AssetImage("assets/images/16293972.png"),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        readOnly: true,
                        initialValue:
                            "${snapshot.data!.firstName} ${snapshot.data!.lastName}",
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.person)),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        readOnly: true,
                        initialValue: "${snapshot.data!.email}",
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.email)),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        readOnly: true,
                        initialValue: "${snapshot.data!.location}",
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.location_on_outlined)),
                      ),
                    ],
                  ),
                ));
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
