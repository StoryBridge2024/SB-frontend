import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'getImage.dart';

import 'package:frontend/constants/fairytaleConstants.dart';
import 'package:frontend/models/scene_model.dart';
import 'package:frontend/pages/makingFairytale.dart';
import 'package:frontend/services/db/database_manager/database_manager.dart';

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
  late Future<List<SceneModel>> _fairytalesFuture;

  @override
  void initState() {
    super.initState();
    _fairytalesFuture = _loadFairytales();
  }

  Future<List<SceneModel>> _loadFairytales() async {
    List<SceneModel> list = await getFairytale();
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        title: Text('완성된 동화들이에요.'),
        backgroundColor: Color(0xFFFFFFFF),
      ),
      body: FutureBuilder<List<SceneModel>>(
        future: _fairytalesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: Text(
              '동화를 불러오는 중이에요!',
              style: TextStyle(
                fontSize: 40,
              ),
            ));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
                child: Text(
              '아직 만들어진 동화가 없어요.',
              style: TextStyle(
                fontSize: 40,
              ),
            ));
          } else {
            List<SceneModel> items = snapshot.data!;
            return GridView.builder(
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
                  padding: EdgeInsets.all(5),
                  color: Color.fromARGB(0xFF, 0xD1, 0xEB, 0xFF),
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      gSceneModel = item;
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlacingCharacter(),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Image.memory(
                                      base64Decode(
                                          item.b64_images.elementAt(0)),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Expanded(
                                    child: Image.memory(
                                      base64Decode(
                                          item.b64_images.elementAt(1)),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Expanded(
                                    child: Image.memory(
                                      base64Decode(
                                          item.b64_images.elementAt(2)),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Expanded(
                                    child: Image.memory(
                                      base64Decode(
                                          item.b64_images.elementAt(3)),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Image.memory(
                                      base64Decode(
                                          item.b64_images.elementAt(4)),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Expanded(
                                    child: Image.memory(
                                      base64Decode(
                                          item.b64_images.elementAt(5)),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Expanded(
                                    child: Image.memory(
                                      base64Decode(
                                          item.b64_images.elementAt(6)),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Expanded(
                                    child: Image.memory(
                                      base64Decode(
                                          item.b64_images.elementAt(7)),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          child: Container(
                            alignment: Alignment.center,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(0xFF, 0xD1, 0xEB, 0xFF),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                '${item.theme}',
                                style: TextStyle(
                                  color: Color.fromARGB(0xFF, 0x22, 0x1A, 0x7E),
                                  fontSize: 40,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<List<SceneModel>> getFairytale() async {
    List<FairytailModelData> list =
        await database.select(database.fairytailModel).get();

    List<SceneModel> gslist = [];
    for (int i = 0; i < list.length; i++) {
      print(jsonDecode(list[i].sceneModel).runtimeType);
      SceneModel sm = SceneModel.fromJson(jsonDecode(list[i].sceneModel));
      gslist.add(sm);
    }

    return gslist;
  }
}
