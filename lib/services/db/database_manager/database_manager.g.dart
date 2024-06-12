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
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, content];
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
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
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
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
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
  final String content;
  const FairytailModelData({required this.id, required this.content});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['content'] = Variable<String>(content);
    return map;
  }

  FairytailModelCompanion toCompanion(bool nullToAbsent) {
    return FairytailModelCompanion(
      id: Value(id),
      content: Value(content),
    );
  }

  factory FairytailModelData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FairytailModelData(
      id: serializer.fromJson<int>(json['id']),
      content: serializer.fromJson<String>(json['content']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'content': serializer.toJson<String>(content),
    };
  }

  FairytailModelData copyWith({int? id, String? content}) => FairytailModelData(
        id: id ?? this.id,
        content: content ?? this.content,
      );
  @override
  String toString() {
    return (StringBuffer('FairytailModelData(')
          ..write('id: $id, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, content);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FairytailModelData &&
          other.id == this.id &&
          other.content == this.content);
}

class FairytailModelCompanion extends UpdateCompanion<FairytailModelData> {
  final Value<int> id;
  final Value<String> content;
  const FairytailModelCompanion({
    this.id = const Value.absent(),
    this.content = const Value.absent(),
  });
  FairytailModelCompanion.insert({
    this.id = const Value.absent(),
    required String content,
  }) : content = Value(content);
  static Insertable<FairytailModelData> custom({
    Expression<int>? id,
    Expression<String>? content,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (content != null) 'content': content,
    });
  }

  FairytailModelCompanion copyWith({Value<int>? id, Value<String>? content}) {
    return FairytailModelCompanion(
      id: id ?? this.id,
      content: content ?? this.content,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FairytailModelCompanion(')
          ..write('id: $id, ')
          ..write('content: $content')
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
  required String content,
});
typedef $$FairytailModelTableUpdateCompanionBuilder = FairytailModelCompanion
    Function({
  Value<int> id,
  Value<String> content,
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
            Value<String> content = const Value.absent(),
          }) =>
              FairytailModelCompanion(
            id: id,
            content: content,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String content,
          }) =>
              FairytailModelCompanion.insert(
            id: id,
            content: content,
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

  ColumnFilters<String> get content => $state.composableBuilder(
      column: $state.table.content,
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

  ColumnOrderings<String> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$FairytailModelTableTableManager get fairytailModel =>
      $$FairytailModelTableTableManager(_db, _db.fairytailModel);
}
