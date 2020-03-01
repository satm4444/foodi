import 'package:flutter/material.dart';
import 'package:foodi/widgets/main_drawer.dart';

class FilterScreen extends StatelessWidget {
  static const String routeName = "/filter_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Foodi"),
      ),
      drawer: MainDrawer(),
    );
  }
}
