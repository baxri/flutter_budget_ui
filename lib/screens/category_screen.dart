import 'package:flutter/material.dart';
import 'package:flutter_budget_ui/models/category_model.dart';
import 'package:flutter_budget_ui/widgets/radio_painter.dart';

class CategoryScreen extends StatefulWidget {
  final Category category;

  CategoryScreen(this.category);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category Screen'),
        actions: [IconButton(icon: Icon(Icons.add), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomPaint(
              foregroundPainter: CircleProgress(),
              child: Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                height: 250,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 2),
                          blurRadius: 6)
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
