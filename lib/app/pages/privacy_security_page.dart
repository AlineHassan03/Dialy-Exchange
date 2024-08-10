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
                Center(child: _SectionHeader("privacy&Security")),
                _BulletPoint(
                    'At Daily Exchange we take your privacy and data security very seriously.'),
                _BulletPoint(
                    "This policy explains how we collect, use and protect your personal information when you use our application."),
                SizedBox(height: 20),
                Center(child: _SectionHeader('Data we collect:')),
                _BulletPoint(
                    'Account Information: When you create an account, we collect your username, password, and email address.'),
                _BulletPoint(
                    'Transaction Information: We collect information about the financial transactions you enter, such as the amount, date, category, and description.'),
                SizedBox(height: 20),
                Center(child: _SectionHeader('How to use data:')),
                _BulletPoint(
                    'Providing the Service: We use the data we collect to provide the core service of the App, which is expense tracking.'),
                _BulletPoint(
                    'Service Improvement: We use data to improve app performance and develop new features.'),
                SizedBox(height: 20),
                Center(child: _SectionHeader('Data sharing:')),
                _BulletPoint(
                    'We do not share your personal data with any third parties for marketing purposes.'),
                SizedBox(height: 20),
                Center(child: _SectionHeader('Changes to the Privacy Policy:')),
                _BulletPoint(
                    'We reserve the right to modify this policy at any time. We will notify you of any material changes by posting the revised Policy on the Application.'),
                SizedBox(height: 20),
                Center(child: _SectionHeader('Contact us:')),
                _BulletPoint(
                    'If you have any questions or inquiries about this policy, you can contact us via email at AlineHassan03@gmail.com.'),
              ],
            ),
          ),
        ));
  }
}

class _SectionHeader extends StatelessWidget {
  final String text;

  _SectionHeader(this.text);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        getLang(context, text),
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _BulletPoint extends StatelessWidget {
  final String text;

  _BulletPoint(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.start,
      getLang(context, text),
      style: TextStyle(),
    );
  }
}
