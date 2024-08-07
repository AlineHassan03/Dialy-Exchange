import 'package:flutter/material.dart';
import 'package:flutter_application_3/app/home_screen/database/expense_database.dart';
import 'package:flutter_application_3/app/home_screen/expense_model/expense_model.dart';
import 'package:flutter_application_3/app/home_screen/expense_page/expense_page.dart';
import 'package:flutter_application_3/components/applocal.dart';

import '../../../main.dart';

class BuildItemListViewLastTestEnteries extends StatelessWidget {
  final ExpenseModel expenseModel;
  const BuildItemListViewLastTestEnteries({
    super.key,
    required this.expenseModel,
  });
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      onDismissed: (DismissDirection direction) {
        if (direction == DismissDirection.endToStart) {
          ExpenseDataBase().deleteDataWithId(expenseModel.id!);
          if (dropDownValue == "all") {
            ExpensePage.of(context)!.refrushItem(null);
            ExpensePage.of(context)!.refState();
          } else {
            ExpensePage.of(context)!.refrushItem(dropDownValue);
          }
        }
      },
      background: Container(
        color: Colors.red,
        child: Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                end: 25.0,
              ),
              child: Icon(Icons.delete),
            )),
      ),
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
        margin: const EdgeInsets.only(left: 8.0, right: 8, top: 10, bottom: 10),
        child: Row(
          children: [
            Container(
                width: 50,
                height: 50,
                child: ExpenseItemCategory(
                  categoryText: expenseModel.category!,
                )),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    expenseModel.details!,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "${expenseModel.datetime!}",
                    style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                  )
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "${expenseModel.price!} ${getLang(context, Profile.currency!)}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ),
                  Text(
                    "${getLang(context, "count")}: ${expenseModel.count!}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpenseItemCategory extends StatelessWidget {
  const ExpenseItemCategory({Key? key, required this.categoryText})
      : super(key: key);
  final String categoryText;
  @override
  Widget build(BuildContext context) {
    switch (categoryText) {
      case "food":
        return Image.asset("assets/images/706164.png");
      case "travel":
        return Image.asset("assets/images/995260.png");
      case "fuel":
        return Image.asset("assets/images/2248880.png");
      case "clothes":
        return Image.asset("assets/images/706164.png");
      case "House cleaning":
        return Image.asset("assets/images/2331716.png");
      case "Gas":
        return Image.asset("assets/images/3144737.png");
      case "Network bills":
        return Image.asset("assets/images/3797975.png");
      case "invoices of May":
        return Image.asset("assets/images/4757490.png");
      case "health":
        return Image.asset("assets/images/4807695.png");
      case "electricity bills":
        return Image.asset("assets/images/7506305.png");
      case "Agriculture costs":
        return Image.asset("assets/images/10130599.png");
      case "university costs":
        return Image.asset("assets/images/10156019.png");
      default:
        return Icon(Icons.help_outline_sharp);
    }
  }
}
