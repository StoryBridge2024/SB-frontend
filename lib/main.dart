import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend/constants/fairytaleConstants.dart';
import 'package:frontend/pages/homePage.dart';
import 'package:frontend/services/db/database_manager/database_manager.dart';

List<CameraDescription> cameras = [];

void main() async {
  clr_index.value = 0;
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  //================================================================================================
  final database = AppDatabase();
  await database
      .into(database.fairytailModel)
      .insert(FairytailModelCompanion.insert());
  List<FairytailModelData> allItems = await database.select(database.fairytailModel).get();

  print('items in database: $allItems');
  //================================================================================================
  cameras = await availableCameras();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
