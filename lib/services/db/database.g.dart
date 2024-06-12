// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $FairyTailModelTable extends FairyTailModel
    with TableInfo<$FairyTailModelTable, FairyTailModelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FairyTailModelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  @override
  List<GeneratedColumn> get $columns => [id];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'fairy_tail_model';
  @override
  VerificationContext validateIntegrity(Insertable<FairyTailModelData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FairyTailModelData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FairyTailModelData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
    );
  }

  @override
  $FairyTailModelTable createAlias(String alias) {
    return $FairyTailModelTable(attachedDatabase, alias);
  }
}

class FairyTailModelData extends DataClass
    implements Insertable<FairyTailModelData> {
  final int id;
  const FairyTailModelData({required this.id});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    return map;
  }

  FairyTailModelCompanion toCompanion(bool nullToAbsent) {
    return FairyTailModelCompanion(
      id: Value(id),
    );
  }

  factory FairyTailModelData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FairyTailModelData(
      id: serializer.fromJson<int>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
    };
  }

  FairyTailModelData copyWith({int? id}) => FairyTailModelData(
        id: id ?? this.id,
      );
  @override
  String toString() {
    return (StringBuffer('FairyTailModelData(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => id.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FairyTailModelData && other.id == this.id);
}

class FairyTailModelCompanion extends UpdateCompanion<FairyTailModelData> {
  final Value<int> id;
  const FairyTailModelCompanion({
    this.id = const Value.absent(),
  });
  FairyTailModelCompanion.insert({
    this.id = const Value.absent(),
  });
  static Insertable<FairyTailModelData> custom({
    Expression<int>? id,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
    });
  }

  FairyTailModelCompanion copyWith({Value<int>? id}) {
    return FairyTailModelCompanion(
      id: id ?? this.id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FairyTailModelCompanion(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $FairyTailModelTable fairyTailModel = $FairyTailModelTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [fairyTailModel];
}

typedef $$FairyTailModelTableInsertCompanionBuilder = FairyTailModelCompanion
    Function({
  Value<int> id,
});
typedef $$FairyTailModelTableUpdateCompanionBuilder = FairyTailModelCompanion
    Function({
  Value<int> id,
});

class $$FairyTailModelTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FairyTailModelTable,
    FairyTailModelData,
    $$FairyTailModelTableFilterComposer,
    $$FairyTailModelTableOrderingComposer,
    $$FairyTailModelTableProcessedTableManager,
    $$FairyTailModelTableInsertCompanionBuilder,
    $$FairyTailModelTableUpdateCompanionBuilder> {
  $$FairyTailModelTableTableManager(
      _$AppDatabase db, $FairyTailModelTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$FairyTailModelTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$FairyTailModelTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$FairyTailModelTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
          }) =>
              FairyTailModelCompanion(
            id: id,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
          }) =>
              FairyTailModelCompanion.insert(
            id: id,
          ),
        ));
}

class $$FairyTailModelTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $FairyTailModelTable,
    FairyTailModelData,
    $$FairyTailModelTableFilterComposer,
    $$FairyTailModelTableOrderingComposer,
    $$FairyTailModelTableProcessedTableManager,
    $$FairyTailModelTableInsertCompanionBuilder,
    $$FairyTailModelTableUpdateCompanionBuilder> {
  $$FairyTailModelTableProcessedTableManager(super.$state);
}

class $$FairyTailModelTableFilterComposer
    extends FilterComposer<_$AppDatabase, $FairyTailModelTable> {
  $$FairyTailModelTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$FairyTailModelTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $FairyTailModelTable> {
  $$FairyTailModelTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$FairyTailModelTableTableManager get fairyTailModel =>
      $$FairyTailModelTableTableManager(_db, _db.fairyTailModel);
}
