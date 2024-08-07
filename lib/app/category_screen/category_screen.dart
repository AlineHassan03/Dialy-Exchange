import 'package:flutter/material.dart';
import 'package:flutter_application_3/app/category_details/category_details.dart';
import 'package:flutter_application_3/components/applocal.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.only(top: 34),
            padding: EdgeInsets.symmetric(horizontal: 19),
            child: Column(
              children: [
                GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: imageList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5.0,
                      crossAxisSpacing: 5,
                    ),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext, int index) {
                      return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CategoryDetails(
                                    categoryitem: datatitle[index])));
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue,
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  imageList[index],
                                  width: 100,
                                ),
                                Text(
                                  getLang(context, datatitle[index]),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                ),
                              ],
                            ),
                          ));
                    }),
              ],
            )),
      ),
    );
  }
}
