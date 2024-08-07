import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/app/home_screen/database/expense_database.dart';
import 'package:flutter_application_3/app/home_screen/expense_model/expense_model.dart';
import 'package:flutter_application_3/app/home_screen/home_screen.dart';
import 'package:flutter_application_3/components/applocal.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  String? selectedvalue;
  List listitem = [
    "food",
    "travel",
    "fuel",
    "clothes",
    "House cleaning",
    "Gas",
    "Network bills",
    "invoices of May",
    "health",
    "electricity bills",
    "Agriculture costs",
    "university costs",
  ];
  final List<String> imageList = [
    "assets/images/706164.png",
    "assets/images/995260.png",
    "assets/images/2248880.png",
    "assets/images/2331716.png",
    "assets/images/2870667.png",
    "assets/images/3144737.png",
    "assets/images/3797975.png",
    "assets/images/4757490.png",
    "assets/images/4807695.png",
    "assets/images/7506305.png",
    "assets/images/10130599.png",
    "assets/images/10156019.png",
  ];

  final List<String> datatitle = [
    "food",
    "travel",
    "fuel",
    "clothes",
    "House cleaning",
    "Gas",
    "Network bills",
    "invoices of May",
    "health",
    "electricity bills",
    "Agriculture costs",
    "university costs",
  ];
  final _amountController = TextEditingController();
  final _detailsController = TextEditingController();
  final _datetimeController = TextEditingController();
  final _countController = TextEditingController();
  final _timeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 34),
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Center(
                    child: Text(
                  getLang(
                    context,
                    "Add New Expense",
                  ),
                  style: TextStyle(
                      color: Colors.purple.shade600,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
                Container(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15)),
                  child: TextFormField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return getLang(context, 'Please Enter amount');
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: getLang(context, "amount"),
                      hintStyle: TextStyle(color: Colors.purple),
                    ),
                  ),
                ),
                Container(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15)),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    onTap: () {},
                    validator: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return getLang(context, 'Please Select Category');
                      }
                      return null;
                    },
                    value: selectedvalue,
                    hint: Text(
                      getLang(context, "select item"),
                      style: TextStyle(color: Colors.purple),
                    ),
                    items: listitem
                        .map((e) => DropdownMenuItem(
                              child: Text(getLang(context, e)),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedvalue = val as String;
                      });
                    },
                    icon: Icon(
                      Icons.category_outlined,
                      color: Colors.green,
                    ),
                  ),
                ),
                Container(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15)),
                  child: TextFormField(
                    controller: _detailsController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return getLang(context, 'Please Enter details');
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: getLang(context, "note"),
                      hintStyle: TextStyle(color: Colors.purple),
                    ),
                  ),
                ),
                Container(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15)),
                  child: TextFormField(
                    controller: _countController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return getLang(context, 'Please Enter count');
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: getLang(context, "count"),
                      hintStyle: TextStyle(color: Colors.purple),
                    ),
                  ),
                ),
                Container(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15)),
                  child: TextFormField(
                    readOnly: true,
                    onTap: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2003),
                              lastDate: DateTime.now())
                          .then((value) {
                        _datetimeController.text =
                            DateFormat('dd/MM/yyyy').format(value!);
                      });
                    },
                    controller: _datetimeController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return getLang(context, "Please Select Date");
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: getLang(context, "Select Date"),
                      hintStyle: TextStyle(color: Colors.purple),
                    ),
                  ),
                ),
                Container(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15)),
                  child: TextFormField(
                    readOnly: true,
                    onTap: () {
                      showTimePicker(
                        initialTime: TimeOfDay.now(),
                        context: context,
                      ).then((value) {
                        _timeController.text =
                            value!.format(context).toString();
                      });
                    },
                    controller: _timeController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return getLang(context, 'Please Select time');
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: getLang(context, "Select Time"),
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.purple),
                    ),
                  ),
                ),
                Container(
                  height: 30,
                ),
                Container(
                  width: 200,
                  child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: Colors.purple,
                      textColor: Colors.white,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ExpenseDataBase()
                              .addExpenseToDatabase(ExpenseModel(
                                  details: _detailsController.text,
                                  count: _countController.text,
                                  price: _amountController.text,
                                  time: _timeController.text,
                                  datetime: _datetimeController.text,
                                  category: selectedvalue))
                              .then((value) => Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()),
                                  (route) => false));
                        }
                      },
                      child: Text(
                        getLang(context, "add"),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
                Container(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
