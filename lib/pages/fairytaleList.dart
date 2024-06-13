import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'getImage.dart';

import 'package:frontend/constants/fairytaleConstants.dart';
import 'package:frontend/models/scene_model.dart';
import 'package:frontend/pages/makingFairytale.dart';
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
  List<SceneModel> items = [];

  @override
  void initState() {
    super.initState();
    _loadFairytales();
  }

  Future<void> _loadFairytales() async {
    List<SceneModel> list = await getFairytale();
    setState(() {
      items = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        title: Text('완성된 동화들이에요.'),
        backgroundColor: Color(0xFFFFFFFF),
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
                                      fit: BoxFit.cover, // 이미지가 컨테이너에 맞게 잘라집니다.
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
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                                sigmaX: 4, sigmaY: 4), // 흐림 효과를 적용합니다.
                            child: Container(
                              color: Colors
                                  .transparent, // 필터를 적용할 때 반드시 투명색으로 설정해야 합니다.
                            ),
                          ),
                        ),
                        Positioned(
                          child: Container(
                            alignment: Alignment.center,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(
                                  20, 10, 20, 10), // 패딩을 추가합니다.
                              decoration: BoxDecoration(
                                color: Color.fromARGB(
                                    0xFF, 0xD1, 0xEB, 0xFF), // 배경색 설정합니다.
                                borderRadius:
                                    BorderRadius.circular(20), // 둥근 테두리를 추가합니다.
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
            ),
          ),
        ],
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
