import 'package:flutter/material.dart';
class NextPage extends StatelessWidget {
  String name;
  NextPage({Key? key,required this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: $name'),
            ],
          ),
        ),
      ),
    );
  }
}