import 'package:drift/drift.dart';

// These additional imports are necessary to open the sqlite3 database
import 'dart:io';
import 'package:drift/native.dart';
import 'package:frontend/constants/const.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'database_manager.g.dart';

class FairytailModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get sceneModel => text()();
  TextColumn get image => text()();
  TextColumn get humanLocX => text()();
  TextColumn get humanLocY => text()();
  TextColumn get tigerLocX => text()();
  TextColumn get tigerLocY => text()();
  TextColumn get monkeyLocX => text()();
  TextColumn get monkeyLocY => text()();
  TextColumn get giraffeLocX => text()();
  TextColumn get giraffeLocY => text()();
  TextColumn get koalaLocX => text()();
  TextColumn get koalaLocY => text()();
  TextColumn get elephantLocX => text()();
  TextColumn get elephantLocY => text()();
  TextColumn get lionLocX => text()();
  TextColumn get lionLocY => text()();
  TextColumn get puppyLocX => text()();
  TextColumn get puppyLocY => text()();
}

@DriftDatabase(tables: [FairytailModel])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(beforeOpen: (openingDetails) async {
      if (IS_DEBUG_MODE) {
        final m = Migrator(this);
        for (final table in allTables) {
          await m.deleteTable(table.actualTableName);
          await m.createTable(table);
        }
      }
    });
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    // Also work around limitations on old Android versions
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    // Make sqlite3 pick a more suitable location for temporary files - the
    // one from the system may be inaccessible due to sandboxing.
    final cachebase = (await getTemporaryDirectory()).path;
    // We can't access /tmp on Android, which sqlite3 would try by default.
    // Explicitly tell it about the correct temporary directory.
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
