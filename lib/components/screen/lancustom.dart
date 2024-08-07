import 'package:flutter/material.dart';

class LL1 extends StatefulWidget {
  final String textbutton;
  final void Function()? onPressed;

  const LL1({
    super.key,
    required this.textbutton,
    this.onPressed,
  });

  @override
  State<LL1> createState() => _LL1State();
}

class _LL1State extends State<LL1> {
  late final String textbutton;
  late final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 110),
              width: double.infinity,
              child: MaterialButton(
                color: Colors.blue[300],
                textColor: Colors.black,
                onPressed: onPressed,
                child: Text(
                  textbutton,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ));
  }
}
