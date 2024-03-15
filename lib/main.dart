// ignore_for_file: dead_code

import 'package:convert_ease/utils/buttons.dart';
import 'package:convert_ease/utils/converter_types.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade100,
          centerTitle: true,
          title: Text('Convert Ease'),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        body: GridView.builder(
          padding: EdgeInsets.all(20),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 1,
            crossAxisSpacing: 20, mainAxisSpacing: 20
          ),
          itemCount: Converters.values.length,
          itemBuilder: (context, index) {
            final converter = Converters.values[index];
            final tab = converter.tab;
            return ConverterTabs(onTap: () {}, tab: tab);
          },
        ),
      ),
    );
  }
}

