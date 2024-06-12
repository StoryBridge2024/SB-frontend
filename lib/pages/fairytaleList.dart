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
  // 데이터 리스트
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
                crossAxisCount: 2, // 가로 2칸
                mainAxisSpacing: 30.0, // 세로 간격
                crossAxisSpacing: 30.0, // 가로 간격
                childAspectRatio: 2, // 각 셀의 가로세로 비율을 설정
              ),
              padding: EdgeInsets.all(30.0), // 그리드 전체의 패딩
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
                  // 새로운 아이템을 추가
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
