import 'package:flutter/material.dart';
import 'package:flutter_application_3/app/auth/login_screen.dart';
import 'package:flutter_application_3/app/auth/model/auth_model.dart';
import 'package:flutter_application_3/app/auth/sqflite/auth_service.dart';

class UpdatePasswordScreen extends StatefulWidget {
  UpdatePasswordScreen({super.key, required this.value});
  final AuthModel? value;

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  TextEditingController _newPasswordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _conformPasswordController = TextEditingController();

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black12,
              radius: 35,
              child:
                  Image.asset(fit: BoxFit.fill, "assets/images/16293972.png"),
            ),
            Text(
              "${widget.value!.firstName!.toUpperCase()} ${widget.value!.lastName!.toUpperCase()}",
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(
              controller: _newPasswordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required';
                }
                return null;
              },
              decoration: InputDecoration(
                  hintText: "كلمة المرور الجديدة",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25))),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _conformPasswordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Confirm password is required';
                }
                if (value != _newPasswordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
              decoration: InputDecoration(
                  hintText: "تأكيد كلمة المرور",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25))),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              child: MaterialButton(
                color: Colors.amber,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final newData = AuthModel(
                        password: _newPasswordController.text,
                        email: widget.value!.email!,
                        location: widget.value!.location,
                        firstName: widget.value!.firstName!,
                        lastName: widget.value!.lastName);
                    await UserService()
                        .updateUserData(newData, widget.value!.email!);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                        (route) => false);
                  }
                },
                child: Text("Change Password"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
