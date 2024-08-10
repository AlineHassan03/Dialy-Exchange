import 'package:flutter/material.dart';
import 'package:flutter_application_3/components/applocal.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getLang(context, "About")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                getLang(context, 'Welcome to Dialy Exchange'),
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(getLang(context,
                  "We are a team of passionate individuals who are dedicated to creating innovative solutions that make a difference in people\'s lives.")),
              SizedBox(height: 20),
              Center(
                child: Text(
                  getLang(context, "Our Mission"),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Text(getLang(context,
                  "Our mission is to provide high-quality products and services that exceed our customers expectations. We strive to be the best in our industry and to make a positive impact on the world.")),
              SizedBox(height: 20),
              Center(
                child: Text(
                  getLang(context, "Our Team"),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Text(getLang(context,
                  "Our team consists of experienced professionals who are experts in their fields. We have a diverse range of skills and backgrounds, but we all share a common goal: to create amazing products that people love.")),
              SizedBox(height: 20),
              Center(
                child: Text(
                  getLang(context, 'Our Values'),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Text(getLang(context,
                  'Innovation: We believe in thinking outside the box and finding new solutions to old problems.')),
              Text(getLang(context,
                  'Quality: We are committed to delivering high-quality products and services that meet our customers needs.')),
              Text(getLang(context,
                  'Customer Focus: We put our customers at the heart of everything we do.')),
              Text(getLang(context,
                  'Teamwork: We believe that together, we can achieve more than we can alone.')),
            ],
          ),
        ),
      ),
    );
  }
}
