import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<double> expenses;

  BarChart(this.expenses);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Weekly Spending',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
            Text('Now, 10, 2020 - Now, 15, 2020'),
            IconButton(icon: Icon(Icons.arrow_forward), onPressed: () {}),
          ],
        )
      ],
    );
  }
}
