import 'package:flutter/material.dart';
// import 'getImage.dart';

// import 'dart:convert';
// import 'dart:io';
// import 'dart:typed_data';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:frontend/constants/action_list.dart';
// import 'package:frontend/constants/const.dart';
// import 'package:frontend/models/script_model.dart';
// import 'package:frontend/services/api/tts.dart';
// import 'package:http/http.dart';
// import 'package:frontend/constants/animal_list.dart';
// import 'package:frontend/constants/prompt.dart';
// import 'package:frontend/models/image_model.dart';
// import 'package:frontend/models/scene_model.dart';
import 'package:frontend/services/db/database_manager/database_manager.dart';
// import 'package:frontend/services/util.dart';

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
  final database = AppDatabase();
  List<FairytailModelData> items = [];

  @override
  void initState() {
    super.initState();
    _loadFairytales();
  }

  Future<void> _loadFairytales() async {
    List<FairytailModelData> list = await getFairytale();
    setState(() {
      items = list;
    });
  }

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
                final item = items[index];
                return Container(
                  color: Colors.blueAccent,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Scene: ${item.sceneModel}',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        'ID: ${item.id}',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<List<FairytailModelData>> getFairytale() async {
    List<FairytailModelData> list =
        await database.select(database.fairytailModel).get();
    return list;
  }
}
