import 'package:flutter/material.dart';
import 'package:flutter_budget_ui/data/data.dart';
import 'package:flutter_budget_ui/widgets/bar_chart.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            forceElevated: true,
            floating: true,
            // pinned: true,
            expandedHeight: 100,
            leading: IconButton(
                icon: Icon(Icons.settings), iconSize: 30, onPressed: () {}),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "Simple Budget",
                style: TextStyle(fontSize: 16),
              ),
            ),
            actions: [
              IconButton(icon: Icon(Icons.add), iconSize: 30, onPressed: () {})
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                height: 100,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 2),
                          blurRadius: 6.0)
                    ],
                    borderRadius: BorderRadius.circular(5)),
                child: BarChart(weeklySpending),
              );
            }, childCount: 1),
          )
        ],
      ),
    );
  }
}
