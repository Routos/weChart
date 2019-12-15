import 'package:flutter/material.dart';
import 'package:we_chart/widget/category_selector.dart';
import 'package:we_chart/widget/favorite_contact.dart';
import 'package:we_chart/widget/recently_chart.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        leading: Icon(
          Icons.menu,
          size: 30,
        ),
        title: Text(
          'We Chart',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: 1.2),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.search,
              size: 30,
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          CategorySelector(),
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35))),
                child: Column(
                  children: <Widget>[FavoriteContact(), RecentCharts()],
                )),
          )
        ],
      ),
    );
  }
}
