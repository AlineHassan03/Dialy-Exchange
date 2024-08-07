import 'package:flutter/material.dart';
import 'package:flutter_application_3/app/home_screen/database/expense_database.dart';
import 'package:flutter_application_3/app/home_screen/expense_page/expense_list.dart';
import 'package:flutter_application_3/components/applocal.dart';

class CategoryDetails extends StatefulWidget {
  final String categoryitem;
  const CategoryDetails({Key? key, required this.categoryitem})
      : super(key: key);

  @override
  _CategoryDetailsState createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getLang(context, widget.categoryitem)),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: ExpenseDataBase().getDateWithCategory(widget.categoryitem),
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              return ListView.builder(
                  itemCount: snapShot.data!.length,
                  itemBuilder: (context, index) {
                    return BuildItemListViewLastTestEnteries(
                        expenseModel: snapShot.data![index]);
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
