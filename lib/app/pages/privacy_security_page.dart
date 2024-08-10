import 'package:flutter/material.dart';

import '../../components/applocal.dart';

class PrivacySecurityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(getLang(context, "privacy&Security")),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Text(
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        getLang(context, "privacy&Security"))),
                Text(getLang(context,
                    'At Daily Exchange we take your privacy and data security very seriously.')),
                Text(getLang(context,
                    "This policy explains how we collect, use and protect your personal information when you use our application.")),
                SizedBox(height: 20),
                Center(
                    child: Text(
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        getLang(context, 'Data we collect:'))),
                Text(getLang(context,
                    'Account Information: When you create an account, we collect your username, password, and email address.')),
                Text(getLang(context,
                    'Transaction Information: We collect information about the financial transactions you enter, such as the amount, date, category, and description.')),
                SizedBox(height: 20),
                Center(
                    child: Text(
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        getLang(context, 'How to use data:'))),
                Text(getLang(context,
                    'Providing the Service: We use the data we collect to provide the core service of the App, which is expense tracking.')),
                Text(getLang(context,
                    'Service Improvement: We use data to improve app performance and develop new features.')),
                SizedBox(height: 20),
                Center(
                    child: Text(
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        getLang(context, 'Data sharing:'))),
                Text(getLang(context,
                    'We do not share your personal data with any third parties for marketing purposes.')),
                SizedBox(height: 20),
                Center(
                    child: Text(
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        getLang(context, 'Changes to the Privacy Policy:'))),
                Text(getLang(context,
                    'We reserve the right to modify this policy at any time. We will notify you of any material changes by posting the revised Policy on the Application.')),
                SizedBox(height: 20),
                Center(
                    child: Text(
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        getLang(context, 'Contact us:'))),
                Text(getLang(context,
                    'If you have any questions or inquiries about this policy, you can contact us via email at AlineHassan03@gmail.com.')),
              ],
            ),
          ),
        ));
  }
}
