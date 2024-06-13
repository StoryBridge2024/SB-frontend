import 'package:drift_dev/api/migrations.dart';

// class MyDatabase extends _$MyDatabase {
//   @override
//   MigrationStrategy get migration => MigrationStrategy(
//     onCreate: (m) async {/* ... */},
//     onUpgrade: (m, from, to) async {/* your existing migration logic */},
//       beforeOpen: (openingDetails) async {
//         if (isInDebugMode /* or some other flag */) {
//           final m = Migrator(this, customStatement);
//           for (final table in allTables) {
//             await m.deleteTable(table.actualTableName);
//             await m.createTable(table);
//           }
//         }
//       }
//   );
// }