import 'package:contactus/contactus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/components/applocal.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          getLang(context, "YOUR COMPANY"),
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.teal,
      bottomNavigationBar: ContactUsBottomAppBar(
        companyName: 'Aline Hassan',
        textColor: Colors.white,
        backgroundColor: Colors.teal.shade300,
        email: 'adoshi26.ad@gmail.com',
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, bottom: 15),
        child: Row(
          children: [
            Expanded(
              child: ContactUs(
                companyFontSize: 20,
                cardColor: Colors.white,
                textColor: Colors.teal.shade900,
                logo: const AssetImage('assets/images/123.png'),
                email: 'adoshi26.ad@gmail.com',
                companyName: 'Aline Hassan',
                companyColor: Colors.teal.shade100,
                dividerThickness: 2,
                phoneNumber: '+917818044311',
                website: 'https://abhishekdoshi.godaddysites.com',
                tagLine: 'Flutter Developer',
                taglineColor: Colors.teal.shade100,
                twitterHandle: 'AbhishekDoshi26',
                instagram: '_abhishek_doshi',
                facebookHandle: '_abhishek_doshi',
              ),
            ),
            Expanded(
              child: ContactUs(
                companyFontSize: 20,
                cardColor: Colors.white,
                textColor: Colors.teal.shade900,
                logo: const AssetImage('assets/images/123.png'),
                email: 'adoshi26.ad@gmail.com',
                companyName: 'Aline Mostafa',
                companyColor: Colors.teal.shade100,
                dividerThickness: 2,
                phoneNumber: '+917818044311',
                website: 'https://abhishekdoshi.godaddysites.com',
                tagLine: 'Flutter Developer',
                taglineColor: Colors.teal.shade100,
                twitterHandle: 'AbhishekDoshi26',
                instagram: '_abhishek_doshi',
                facebookHandle: '_abhishek_doshi',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
