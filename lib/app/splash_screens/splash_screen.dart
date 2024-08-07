import 'package:flutter/material.dart';
import 'package:flutter_application_3/components/applocal.dart';
import '../../Coin/chang coin.dart';

class IntroApplicationScreen extends StatefulWidget {
  const IntroApplicationScreen({super.key});

  @override
  State<IntroApplicationScreen> createState() => _IntroApplicationScreenState();
}

class _IntroApplicationScreenState extends State<IntroApplicationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        padding: EdgeInsets.all(9),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text(
                getLang(context, "Hello There"),
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 38),
              ),
            ),
            Container(
              height: 10,
            ),
            Container(
              width: 200,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(25)),
              child:
                  Image.asset(fit: BoxFit.fill, "assets/images/15742167.png"),
            ),
            Container(
              height: 10,
            ),
            Text(
              getLang(context, "Get Started Track Your Expense"),
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[600]),
            ),
            Container(height: 15),
            Text(
              getLang(context,
                  "Most people spend their Money and dont Know ,where it goes ,Thereforee We designed this application ,For you to mange and Know where your Money goes"),
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Container(height: 18),
            MaterialButton(
              color: Colors.blue[500],
              textColor: Colors.white,
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
              child: Text(getLang(context, "Continue"),
                  style: TextStyle(fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }
}
