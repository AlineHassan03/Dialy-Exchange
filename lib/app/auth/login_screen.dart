import 'package:flutter/material.dart';

import 'package:flutter_application_3/app/auth/sqflite/auth_service.dart';
import 'package:flutter_application_3/components/applocal.dart';
import 'package:flutter_application_3/app/home_screen/home_screen.dart';
import 'package:flutter_application_3/app/auth/forgot_passwrod_screen.dart';
import 'package:flutter_application_3/app/auth/sing_up_screen.dart';
import 'package:flutter_application_3/components/shaerd_pref/shared.dart';
import 'package:flutter_application_3/main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passworController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[200],
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Center(
                child: Column(children: [
                  Text(getLang(context, "SIGN IN"),
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 39,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 5,
                  ),
                  Text(getLang(context, "Welcome To Our Application"),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                controller: _emailController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return getLang(
                                        context, "Please enter your email");
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: getLang(context, "email"),
                                  border: InputBorder.none,
                                ),
                              )))),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return getLang(
                                        context, "Please enter your password");
                                  }
                                  return null;
                                },
                                controller: _passworController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: getLang(context, "password"),
                                  border: InputBorder.none,
                                ),
                              )))),
                  SizedBox(
                    height: 25,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Forgetpassword()));
                      },
                      child: Text(
                        getLang(context, "Forgot password"),
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: 19),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: MaterialButton(
                      color: Colors.blue,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final bool isAuthenticated = await UserService()
                              .authenticateUser(_emailController.text,
                                  _passworController.text);

                          if (isAuthenticated == true) {
                            await CacheService.saveData(
                                key: "email", value: _emailController.text);
                            Profile().init();
                            // انتقل إلى شاشة المستخدم الرئيسية
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.amber,
                                content: Text(getLang(
                                  context,
                                  "Login successfully",
                                )),
                              ),
                            );
                          } else {
                            // إظهار رسالة خطأ
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(getLang(context,
                                    "The email or password is incorrect")),
                              ),
                            );
                          }
                        }
                      },
                      child: Text(
                        getLang(context, "Login"),
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(getLang(context, "Not yet a member?")),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SingUpScreen()));
                        },
                        child: Text(
                          getLang(context, "Sign up now"),
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ))
                  ])
                ]),
              ),
            ),
          )),
    );
  }
}
