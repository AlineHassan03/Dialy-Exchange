import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/app/home_screen/database/expense_database.dart';
import 'package:flutter_application_3/app/home_screen/expense_model/expense_model.dart';
import 'package:flutter_application_3/app/home_screen/expense_page/expense_list.dart';
import 'package:flutter_application_3/components/applocal.dart';

class ExpensePage extends StatefulWidget {
  const ExpensePage({Key? key}) : super(key: key);
  static _ExpensePageState? of(BuildContext context) {
    return context.findAncestorStateOfType<_ExpensePageState>();
  }

  @override
  _ExpensePageState createState() => _ExpensePageState();
}

String? dropDownValue = "all";

class _ExpensePageState extends State<ExpensePage> {
  static List<String> monthsList =
      []; // ليست بالايام المدرجة بالتطبيق خالية من التكرار
  //يتم تخزين القيمة الحالية ل DropDown
  double totlePrice = 0; //يتم تخزين مجموع الصرف

  Future<List<ExpenseModel>>?
      getExpenses; //متغير تم انشاءة ليتم تخزين القيم القادمة من database
  initState() {
    getExpenses = ExpenseDataBase().getExpenses();
    ExpenseDataBase().getExpenses().then((onValue) async {
      getMonthsYears(onValue);
    });
    super.initState();
  }

  refState() {
    getExpenses = ExpenseDataBase().getExpenses();
    ExpenseDataBase().getExpenses().then((onValue) async {
      getMonthsYears(onValue);
    });
  }

// هذه المثود تحصل علي ليست من نوع موديل وتقوم بتحليلها واعطائنا التوارييخ بدون تكرار
  getMonthsYears(List<ExpenseModel> list) {
    Set<String> uniqueMonthsYears = {};
    for (ExpenseModel item in list) {
      uniqueMonthsYears.add(item.datetime!);
    }
    uniqueMonthsYears.add("all");

    monthsList = uniqueMonthsYears.toList();
  }

  getExpensesMethod({String? date}) async {
    if (date != null) {
      getExpenses = ExpenseDataBase().getDateWithDate(date);
    } else {
      getExpenses = ExpenseDataBase().getExpenses();
    }
    setState(() {});
  }

  Future<double> calcTotalAmountMethod(
    List<ExpenseModel> value,
  ) async {
    double totalAmount = 0;

    for (var expense in value) {
      totalAmount += double.parse(expense.price!);
    }
    return totalAmount;
  }

  void refrushItem(String? value) {
    if (value == "all") {
      getExpensesMethod(date: null);
    } else {
      getExpensesMethod(date: value.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getExpenses!
          ..then((value) async {
            totlePrice = await calcTotalAmountMethod(value);
          }),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.only(
                        top: 20.0, bottom: 20, left: 10, right: 10),
                    margin: EdgeInsets.only(left: 8.0, right: 8, top: 10),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              getLang(context, "Total Expenses"),
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${totlePrice.toString()}",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        DropdownButton(
                          value: dropDownValue!,
                          items: monthsList
                              .map(
                                (month) => DropdownMenuItem(
                                  alignment: AlignmentDirectional.center,
                                  value: month,
                                  child: Text(
                                    month == "all"
                                        ? getLang(context, "all")
                                        : month,
                                    style: TextStyle(
                                      fontSize: MediaQuery.of(context)
                                          .textScaler
                                          .scale(15),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            refrushItem(value);
                            dropDownValue = value.toString();
                          },
                        )
                      ],
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: ((context, index) {
                        return BuildItemListViewLastTestEnteries(
                          expenseModel: snapshot.data![index],
                        );
                      })),
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
