import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_3/app/auth/model/auth_model.dart';
import 'package:flutter_application_3/app/auth/sqflite/auth_service.dart';
import 'package:flutter_application_3/app/auth/login_screen.dart';
import 'package:flutter_application_3/app/home_screen/home_screen.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _Homepage2State();
}

class _Homepage2State extends State<SingUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _locathionController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(children: [
              Container(height: 10),
              Center(
                child: Text(
                  "Register Now",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Container(height: 20),
              TextFormField(
                controller: _firstNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter First Name';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: " Enter First name",
                    suffixIcon: Icon(
                      Icons.star,
                      color: Colors.purple,
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.blue,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(width: 3, color: Colors.grey))),
              ),
              Container(height: 17),
              TextFormField(
                controller: _lastNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter last Name';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: " Entre Last name",
                    suffixIcon: Icon(
                      Icons.star,
                      color: Colors.purple,
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.blue,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(width: 3, color: Colors.grey))),
              ),
              Container(
                height: 10,
              ),
              TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter email ';
                  } else if (!EmailValidator.validate(value))
                    return 'this email is not valid';
                  ;
                  return null;
                },
                decoration: InputDecoration(
                    hintText: "ُ Entre Email",
                    suffixIcon: Icon(
                      Icons.star,
                      color: Colors.purple,
                    ),
                    prefixIcon: Icon(
                      Icons.location_city,
                      color: Colors.blue,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(width: 3, color: Colors.grey))),
              ),
              Container(height: 17),
              TextFormField(
                controller: _locathionController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please   entre locathion';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: " Entre Location",
                    suffixIcon: Icon(
                      Icons.star,
                      color: Colors.purple,
                    ),
                    prefixIcon: Icon(
                      Icons.location_city,
                      color: Colors.blue,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(width: 3, color: Colors.grey))),
              ),
              Container(height: 17),
              TextFormField(
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter password';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: " Entre Password",
                    suffixIcon: Icon(
                      Icons.star,
                      color: Colors.purple,
                    ),
                    prefixIcon: Icon(
                      Icons.password,
                      color: Colors.blue,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(width: 3, color: Colors.grey))),
              ),
              Container(height: 40),
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  color: Colors.blue[500],
                  textColor: Colors.white,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        final AuthModel user = AuthModel(
                          location: _locathionController.text,
                          firstName: _firstNameController.text,
                          lastName: _lastNameController.text,
                          password: _passwordController.text,
                          email: _emailController.text,
                        );
                        await UserService().createUser(user);
                        // انتقل إلى شاشة تسجيل الدخول
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.red,
                            content:
                                Text('حصل خطأ في عملية التسجيل حاول مرة اخري'),
                          ),
                        );
                      }
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Sign Up Now",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
