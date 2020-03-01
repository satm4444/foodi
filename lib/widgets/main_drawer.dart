import 'package:flutter/material.dart';
import 'package:foodi/screens/bottom_bar_screen.dart';
import 'package:foodi/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://ctl.s6img.com/society6/img/b1sMuHt6R2Hx8pTsa99hI7gkAmo/w_1500/prints/~artwork/s6-original-art-uploads/society6/uploads/misc/19fc4d5ced334072a83bb03465bab5d3/~~/noragami-minimmalist-yato-prints.jpg")),
          accountName: Text("Satyam Rawal"),
          accountEmail: Text("rawalsatyam018@gmail.com"),
        ),
        ListTile(
          leading: Icon(Icons.restaurant),
          title: Text("Meals"),
          onTap: () {
            Navigator.pushReplacementNamed(context, BottomBarScreen.routeName);
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text("Filter Screen"),
          onTap: () {
            Navigator.pushReplacementNamed(context, FilterScreen.routeName);
          },
        ),
        Divider(),
      ],
    ));
  }
}
