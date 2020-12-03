import 'package:flutter/material.dart';
import 'package:flutter_budget_ui/data/data.dart';
import 'package:flutter_budget_ui/models/category_model.dart';
import 'package:flutter_budget_ui/models/expense_model.dart';
import 'package:flutter_budget_ui/screens/category_screen.dart';
import 'package:flutter_budget_ui/widgets/bar_chart.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _buildCategory(Category category, double total) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => CategoryScreen(category))),
      child: Container(
        width: double.infinity,
        height: 100,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, offset: Offset(0, 2), blurRadius: 6),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  category.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Text(
                  '\$${(category.maxAmount - total).toStringAsFixed(2)} / \$${total.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                Container(
                  height: 20,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20)),
                ),
                Container(
                  width: 50,
                  height: 20,
                  decoration: BoxDecoration(
                      color: Colors.red[900],
                      borderRadius: BorderRadius.circular(20)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

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
              if (index == 0) {
                return Container(
                  margin:
                      EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 7),
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
              } else {
                final Category category = categories[index - 1];
                double totalAmountSpent = 0;

                category.expenses.forEach((Expense expense) {
                  totalAmountSpent += expense.cost;
                });

                return _buildCategory(category, totalAmountSpent);
              }
            }, childCount: 1 + categories.length),
          )
        ],
      ),
    );
  }
}
