import 'package:flutter/material.dart';
import 'package:flutter_application_3/components/applocal.dart';

import 'sqflite/auth_service.dart';
import 'update_password_screen.dart';

class Forgetpassword extends StatefulWidget {
  const Forgetpassword({super.key});

  @override
  State<Forgetpassword> createState() => _ForgetpasswordState();
}

class _ForgetpasswordState extends State<Forgetpassword> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          getLang(context, "Forget Password"),
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 20,
          ),
          Center(
            child: Text(
              getLang(context, "Check Email"),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
            ),
          ),
          Container(
            height: 10,
          ),
          Center(
            child: Text(getLang(context,
                "Sign up with your Email And password oR \n, Continue With social Media")),
          ),
          Container(
            height: 8,
          ),
          Container(
            padding: EdgeInsets.all(18),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: getLang(context, "Entre your Email"),
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: Colors.green,
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
              ),
            ),
          ),
          Container(
            height: 15,
          ),
          MaterialButton(
            color: Colors.amber,
            onPressed: () async {
              final data =
                  await UserService().getUserByEmail(emailController.text);
              if (data != null) {
                showModalBottomSheet(
                    showDragHandle: true,
                    isDismissible: true,
                    isScrollControlled: true,
                    context: context,
                    builder: (
                      context,
                    ) =>
                        UpdatePasswordScreen(value: data));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("هذا البريد الاكتروني غير مسجل لدينا"),
                  ),
                );
              }
            },
            child: Text("Check"),
          )
        ],
      ),
    );
  }
}
