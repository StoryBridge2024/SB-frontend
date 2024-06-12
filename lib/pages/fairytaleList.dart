import 'package:flutter/material.dart';
import 'getImage.dart';

class FairytaleList extends StatelessWidget {
  const FairytaleList({super.key});

  @override
  Widget build(BuildContext context) {
    return TablePage();
  }
}

class TablePage extends StatefulWidget {
  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  List<String> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('완성된 동화들'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 30.0,
                crossAxisSpacing: 30.0,
                childAspectRatio: 2,
              ),
              padding: EdgeInsets.all(30.0),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.blueAccent,
                  alignment: Alignment.center,
                  child: Text(
                    items[index],
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  items.add('Item ${items.length + 1}');
                });
              },
              child: Text('Add Item'),
            ),
          ),
        ],
      ),
    );
  }
}
