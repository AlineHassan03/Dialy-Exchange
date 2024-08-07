import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/app/home_screen/database/expense_database.dart';
import 'package:flutter_application_3/app/home_screen/expense_model/expense_model.dart';
import 'package:flutter_application_3/components/applocal.dart';
import 'package:flutter_application_3/main.dart';

class GraphDatePage extends StatefulWidget {
  const GraphDatePage({Key? key}) : super(key: key);

  @override
  _GraphDatePageState createState() => _GraphDatePageState();
}

class _GraphDatePageState extends State<GraphDatePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ExpenseDataBase().getExpenses(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                margin: EdgeInsets.only(left: 8.0, right: 8, top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Theme.of(context).colorScheme.primary,
                ),
                height: MediaQuery.of(context).size.height * 0.5,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                    child: BarChart(
                      BarChartData(
                        barGroups: getDailyExpenses(snapshot.data!)
                            .entries
                            .map((entry) {
                          return BarChartGroupData(
                            groupVertically: false,
                            x: int.parse(entry.key.substring(0, 2)),
                            barRods: [
                              BarChartRodData(
                                borderRadius: BorderRadius.circular(15),
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.red,
                                    Colors.orange,
                                    Colors.yellow,
                                  ],
                                  stops: [
                                    0.0,
                                    0.5,
                                    1.0,
                                  ],
                                ),
                                toY: entry.value,
                              ),
                            ],
                          );
                        }).toList(),
                        titlesData: FlTitlesData(
                          rightTitles: AxisTitles(
                              axisNameWidget: Text(
                            "Price is according to the ${getLang(context, Profile.currency!)} currency",
                            style: const TextStyle(fontSize: 10),
                          )),
                          bottomTitles: AxisTitles(
                              axisNameWidget: Text(
                                "Month",
                                style: const TextStyle(fontSize: 10),
                              ),
                              sideTitles: SideTitles(showTitles: false)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

Map<String, double> getDailyExpenses(List<ExpenseModel> expensesModel) {
  return expensesModel.fold(<String, double>{}, (map, expense) {
    map[expense.datetime!] =
        (map[expense.datetime!] ?? 0) + num.parse(expense.price!);
    return map;
  });
}
