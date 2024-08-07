import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LL1 extends StatelessWidget {
  const LL1(
      {super.key,
      required Null Function() onPressed,
      required String textbutton});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[300],
        items: [
          BottomNavigationBarItem(
              icon: Icon(
            Icons.home,
            color: Colors.pink,
          )),
          BottomNavigationBarItem(
              icon: Icon(
            Icons.settings,
            color: Colors.pink,
          )),
          BottomNavigationBarItem(
              icon: Icon(
            Icons.back_hand,
            color: Colors.pink,
          )),
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Choose Language",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(
            height: 20,
          ),
          LL1(textbutton: "Ar", onPressed: () {}),
          LL1(textbutton: "En", onPressed: () {}),
        ]),
      ),
    );
  }
}
