// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_manager.dart';

// ignore_for_file: type=lint
class $FairytailModelTable extends FairytailModel
    with TableInfo<$FairytailModelTable, FairytailModelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FairytailModelTable(this.attachedDatabase, [this._alias]);
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
  static const String $name = 'fairytail_model';
  @override
  VerificationContext validateIntegrity(Insertable<FairytailModelData> instance,
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
  FairytailModelData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FairytailModelData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
    );
  }

  @override
  $FairytailModelTable createAlias(String alias) {
    return $FairytailModelTable(attachedDatabase, alias);
  }
}

class FairytailModelData extends DataClass
    implements Insertable<FairytailModelData> {
  final int id;
  const FairytailModelData({required this.id});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    return map;
  }

  FairytailModelCompanion toCompanion(bool nullToAbsent) {
    return FairytailModelCompanion(
      id: Value(id),
    );
  }

  factory FairytailModelData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FairytailModelData(
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

  FairytailModelData copyWith({int? id}) => FairytailModelData(
        id: id ?? this.id,
      );
  @override
  String toString() {
    return (StringBuffer('FairytailModelData(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => id.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FairytailModelData && other.id == this.id);
}

class FairytailModelCompanion extends UpdateCompanion<FairytailModelData> {
  final Value<int> id;
  const FairytailModelCompanion({
    this.id = const Value.absent(),
  });
  FairytailModelCompanion.insert({
    this.id = const Value.absent(),
  });
  static Insertable<FairytailModelData> custom({
    Expression<int>? id,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
    });
  }

  FairytailModelCompanion copyWith({Value<int>? id}) {
    return FairytailModelCompanion(
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
    return (StringBuffer('FairytailModelCompanion(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $FairytailModelTable fairytailModel = $FairytailModelTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [fairytailModel];
}

typedef $$FairytailModelTableInsertCompanionBuilder = FairytailModelCompanion
    Function({
  Value<int> id,
});
typedef $$FairytailModelTableUpdateCompanionBuilder = FairytailModelCompanion
    Function({
  Value<int> id,
});

class $$FairytailModelTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FairytailModelTable,
    FairytailModelData,
    $$FairytailModelTableFilterComposer,
    $$FairytailModelTableOrderingComposer,
    $$FairytailModelTableProcessedTableManager,
    $$FairytailModelTableInsertCompanionBuilder,
    $$FairytailModelTableUpdateCompanionBuilder> {
  $$FairytailModelTableTableManager(
      _$AppDatabase db, $FairytailModelTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$FairytailModelTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$FairytailModelTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$FairytailModelTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
          }) =>
              FairytailModelCompanion(
            id: id,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
          }) =>
              FairytailModelCompanion.insert(
            id: id,
          ),
        ));
}

class $$FairytailModelTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $FairytailModelTable,
    FairytailModelData,
    $$FairytailModelTableFilterComposer,
    $$FairytailModelTableOrderingComposer,
    $$FairytailModelTableProcessedTableManager,
    $$FairytailModelTableInsertCompanionBuilder,
    $$FairytailModelTableUpdateCompanionBuilder> {
  $$FairytailModelTableProcessedTableManager(super.$state);
}

class $$FairytailModelTableFilterComposer
    extends FilterComposer<_$AppDatabase, $FairytailModelTable> {
  $$FairytailModelTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$FairytailModelTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $FairytailModelTable> {
  $$FairytailModelTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$FairytailModelTableTableManager get fairytailModel =>
      $$FairytailModelTableTableManager(_db, _db.fairytailModel);
}
