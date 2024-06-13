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
  static const VerificationMeta _sceneModelMeta =
      const VerificationMeta('sceneModel');
  @override
  late final GeneratedColumn<String> sceneModel = GeneratedColumn<String>(
      'scene_model', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _humanLocXMeta =
      const VerificationMeta('humanLocX');
  @override
  late final GeneratedColumn<String> humanLocX = GeneratedColumn<String>(
      'human_loc_x', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _humanLocYMeta =
      const VerificationMeta('humanLocY');
  @override
  late final GeneratedColumn<String> humanLocY = GeneratedColumn<String>(
      'human_loc_y', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tigerLocXMeta =
      const VerificationMeta('tigerLocX');
  @override
  late final GeneratedColumn<String> tigerLocX = GeneratedColumn<String>(
      'tiger_loc_x', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tigerLocYMeta =
      const VerificationMeta('tigerLocY');
  @override
  late final GeneratedColumn<String> tigerLocY = GeneratedColumn<String>(
      'tiger_loc_y', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _monkeyLocXMeta =
      const VerificationMeta('monkeyLocX');
  @override
  late final GeneratedColumn<String> monkeyLocX = GeneratedColumn<String>(
      'monkey_loc_x', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _monkeyLocYMeta =
      const VerificationMeta('monkeyLocY');
  @override
  late final GeneratedColumn<String> monkeyLocY = GeneratedColumn<String>(
      'monkey_loc_y', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _giraffeLocXMeta =
      const VerificationMeta('giraffeLocX');
  @override
  late final GeneratedColumn<String> giraffeLocX = GeneratedColumn<String>(
      'giraffe_loc_x', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _giraffeLocYMeta =
      const VerificationMeta('giraffeLocY');
  @override
  late final GeneratedColumn<String> giraffeLocY = GeneratedColumn<String>(
      'giraffe_loc_y', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _koalaLocXMeta =
      const VerificationMeta('koalaLocX');
  @override
  late final GeneratedColumn<String> koalaLocX = GeneratedColumn<String>(
      'koala_loc_x', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _koalaLocYMeta =
      const VerificationMeta('koalaLocY');
  @override
  late final GeneratedColumn<String> koalaLocY = GeneratedColumn<String>(
      'koala_loc_y', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _elephantLocXMeta =
      const VerificationMeta('elephantLocX');
  @override
  late final GeneratedColumn<String> elephantLocX = GeneratedColumn<String>(
      'elephant_loc_x', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _elephantLocYMeta =
      const VerificationMeta('elephantLocY');
  @override
  late final GeneratedColumn<String> elephantLocY = GeneratedColumn<String>(
      'elephant_loc_y', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lionLocXMeta =
      const VerificationMeta('lionLocX');
  @override
  late final GeneratedColumn<String> lionLocX = GeneratedColumn<String>(
      'lion_loc_x', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lionLocYMeta =
      const VerificationMeta('lionLocY');
  @override
  late final GeneratedColumn<String> lionLocY = GeneratedColumn<String>(
      'lion_loc_y', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _puppyLocXMeta =
      const VerificationMeta('puppyLocX');
  @override
  late final GeneratedColumn<String> puppyLocX = GeneratedColumn<String>(
      'puppy_loc_x', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _puppyLocYMeta =
      const VerificationMeta('puppyLocY');
  @override
  late final GeneratedColumn<String> puppyLocY = GeneratedColumn<String>(
      'puppy_loc_y', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        sceneModel,
        image,
        humanLocX,
        humanLocY,
        tigerLocX,
        tigerLocY,
        monkeyLocX,
        monkeyLocY,
        giraffeLocX,
        giraffeLocY,
        koalaLocX,
        koalaLocY,
        elephantLocX,
        elephantLocY,
        lionLocX,
        lionLocY,
        puppyLocX,
        puppyLocY
      ];
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
    if (data.containsKey('scene_model')) {
      context.handle(
          _sceneModelMeta,
          sceneModel.isAcceptableOrUnknown(
              data['scene_model']!, _sceneModelMeta));
    } else if (isInserting) {
      context.missing(_sceneModelMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('human_loc_x')) {
      context.handle(
          _humanLocXMeta,
          humanLocX.isAcceptableOrUnknown(
              data['human_loc_x']!, _humanLocXMeta));
    } else if (isInserting) {
      context.missing(_humanLocXMeta);
    }
    if (data.containsKey('human_loc_y')) {
      context.handle(
          _humanLocYMeta,
          humanLocY.isAcceptableOrUnknown(
              data['human_loc_y']!, _humanLocYMeta));
    } else if (isInserting) {
      context.missing(_humanLocYMeta);
    }
    if (data.containsKey('tiger_loc_x')) {
      context.handle(
          _tigerLocXMeta,
          tigerLocX.isAcceptableOrUnknown(
              data['tiger_loc_x']!, _tigerLocXMeta));
    } else if (isInserting) {
      context.missing(_tigerLocXMeta);
    }
    if (data.containsKey('tiger_loc_y')) {
      context.handle(
          _tigerLocYMeta,
          tigerLocY.isAcceptableOrUnknown(
              data['tiger_loc_y']!, _tigerLocYMeta));
    } else if (isInserting) {
      context.missing(_tigerLocYMeta);
    }
    if (data.containsKey('monkey_loc_x')) {
      context.handle(
          _monkeyLocXMeta,
          monkeyLocX.isAcceptableOrUnknown(
              data['monkey_loc_x']!, _monkeyLocXMeta));
    } else if (isInserting) {
      context.missing(_monkeyLocXMeta);
    }
    if (data.containsKey('monkey_loc_y')) {
      context.handle(
          _monkeyLocYMeta,
          monkeyLocY.isAcceptableOrUnknown(
              data['monkey_loc_y']!, _monkeyLocYMeta));
    } else if (isInserting) {
      context.missing(_monkeyLocYMeta);
    }
    if (data.containsKey('giraffe_loc_x')) {
      context.handle(
          _giraffeLocXMeta,
          giraffeLocX.isAcceptableOrUnknown(
              data['giraffe_loc_x']!, _giraffeLocXMeta));
    } else if (isInserting) {
      context.missing(_giraffeLocXMeta);
    }
    if (data.containsKey('giraffe_loc_y')) {
      context.handle(
          _giraffeLocYMeta,
          giraffeLocY.isAcceptableOrUnknown(
              data['giraffe_loc_y']!, _giraffeLocYMeta));
    } else if (isInserting) {
      context.missing(_giraffeLocYMeta);
    }
    if (data.containsKey('koala_loc_x')) {
      context.handle(
          _koalaLocXMeta,
          koalaLocX.isAcceptableOrUnknown(
              data['koala_loc_x']!, _koalaLocXMeta));
    } else if (isInserting) {
      context.missing(_koalaLocXMeta);
    }
    if (data.containsKey('koala_loc_y')) {
      context.handle(
          _koalaLocYMeta,
          koalaLocY.isAcceptableOrUnknown(
              data['koala_loc_y']!, _koalaLocYMeta));
    } else if (isInserting) {
      context.missing(_koalaLocYMeta);
    }
    if (data.containsKey('elephant_loc_x')) {
      context.handle(
          _elephantLocXMeta,
          elephantLocX.isAcceptableOrUnknown(
              data['elephant_loc_x']!, _elephantLocXMeta));
    } else if (isInserting) {
      context.missing(_elephantLocXMeta);
    }
    if (data.containsKey('elephant_loc_y')) {
      context.handle(
          _elephantLocYMeta,
          elephantLocY.isAcceptableOrUnknown(
              data['elephant_loc_y']!, _elephantLocYMeta));
    } else if (isInserting) {
      context.missing(_elephantLocYMeta);
    }
    if (data.containsKey('lion_loc_x')) {
      context.handle(_lionLocXMeta,
          lionLocX.isAcceptableOrUnknown(data['lion_loc_x']!, _lionLocXMeta));
    } else if (isInserting) {
      context.missing(_lionLocXMeta);
    }
    if (data.containsKey('lion_loc_y')) {
      context.handle(_lionLocYMeta,
          lionLocY.isAcceptableOrUnknown(data['lion_loc_y']!, _lionLocYMeta));
    } else if (isInserting) {
      context.missing(_lionLocYMeta);
    }
    if (data.containsKey('puppy_loc_x')) {
      context.handle(
          _puppyLocXMeta,
          puppyLocX.isAcceptableOrUnknown(
              data['puppy_loc_x']!, _puppyLocXMeta));
    } else if (isInserting) {
      context.missing(_puppyLocXMeta);
    }
    if (data.containsKey('puppy_loc_y')) {
      context.handle(
          _puppyLocYMeta,
          puppyLocY.isAcceptableOrUnknown(
              data['puppy_loc_y']!, _puppyLocYMeta));
    } else if (isInserting) {
      context.missing(_puppyLocYMeta);
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
      sceneModel: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}scene_model'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image'])!,
      humanLocX: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}human_loc_x'])!,
      humanLocY: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}human_loc_y'])!,
      tigerLocX: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tiger_loc_x'])!,
      tigerLocY: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tiger_loc_y'])!,
      monkeyLocX: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}monkey_loc_x'])!,
      monkeyLocY: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}monkey_loc_y'])!,
      giraffeLocX: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}giraffe_loc_x'])!,
      giraffeLocY: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}giraffe_loc_y'])!,
      koalaLocX: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}koala_loc_x'])!,
      koalaLocY: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}koala_loc_y'])!,
      elephantLocX: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}elephant_loc_x'])!,
      elephantLocY: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}elephant_loc_y'])!,
      lionLocX: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}lion_loc_x'])!,
      lionLocY: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}lion_loc_y'])!,
      puppyLocX: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}puppy_loc_x'])!,
      puppyLocY: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}puppy_loc_y'])!,
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
  final String sceneModel;
  final String image;
  final String humanLocX;
  final String humanLocY;
  final String tigerLocX;
  final String tigerLocY;
  final String monkeyLocX;
  final String monkeyLocY;
  final String giraffeLocX;
  final String giraffeLocY;
  final String koalaLocX;
  final String koalaLocY;
  final String elephantLocX;
  final String elephantLocY;
  final String lionLocX;
  final String lionLocY;
  final String puppyLocX;
  final String puppyLocY;
  const FairytailModelData(
      {required this.id,
      required this.sceneModel,
      required this.image,
      required this.humanLocX,
      required this.humanLocY,
      required this.tigerLocX,
      required this.tigerLocY,
      required this.monkeyLocX,
      required this.monkeyLocY,
      required this.giraffeLocX,
      required this.giraffeLocY,
      required this.koalaLocX,
      required this.koalaLocY,
      required this.elephantLocX,
      required this.elephantLocY,
      required this.lionLocX,
      required this.lionLocY,
      required this.puppyLocX,
      required this.puppyLocY});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['scene_model'] = Variable<String>(sceneModel);
    map['image'] = Variable<String>(image);
    map['human_loc_x'] = Variable<String>(humanLocX);
    map['human_loc_y'] = Variable<String>(humanLocY);
    map['tiger_loc_x'] = Variable<String>(tigerLocX);
    map['tiger_loc_y'] = Variable<String>(tigerLocY);
    map['monkey_loc_x'] = Variable<String>(monkeyLocX);
    map['monkey_loc_y'] = Variable<String>(monkeyLocY);
    map['giraffe_loc_x'] = Variable<String>(giraffeLocX);
    map['giraffe_loc_y'] = Variable<String>(giraffeLocY);
    map['koala_loc_x'] = Variable<String>(koalaLocX);
    map['koala_loc_y'] = Variable<String>(koalaLocY);
    map['elephant_loc_x'] = Variable<String>(elephantLocX);
    map['elephant_loc_y'] = Variable<String>(elephantLocY);
    map['lion_loc_x'] = Variable<String>(lionLocX);
    map['lion_loc_y'] = Variable<String>(lionLocY);
    map['puppy_loc_x'] = Variable<String>(puppyLocX);
    map['puppy_loc_y'] = Variable<String>(puppyLocY);
    return map;
  }

  FairytailModelCompanion toCompanion(bool nullToAbsent) {
    return FairytailModelCompanion(
      id: Value(id),
      sceneModel: Value(sceneModel),
      image: Value(image),
      humanLocX: Value(humanLocX),
      humanLocY: Value(humanLocY),
      tigerLocX: Value(tigerLocX),
      tigerLocY: Value(tigerLocY),
      monkeyLocX: Value(monkeyLocX),
      monkeyLocY: Value(monkeyLocY),
      giraffeLocX: Value(giraffeLocX),
      giraffeLocY: Value(giraffeLocY),
      koalaLocX: Value(koalaLocX),
      koalaLocY: Value(koalaLocY),
      elephantLocX: Value(elephantLocX),
      elephantLocY: Value(elephantLocY),
      lionLocX: Value(lionLocX),
      lionLocY: Value(lionLocY),
      puppyLocX: Value(puppyLocX),
      puppyLocY: Value(puppyLocY),
    );
  }

  factory FairytailModelData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FairytailModelData(
      id: serializer.fromJson<int>(json['id']),
      sceneModel: serializer.fromJson<String>(json['sceneModel']),
      image: serializer.fromJson<String>(json['image']),
      humanLocX: serializer.fromJson<String>(json['humanLocX']),
      humanLocY: serializer.fromJson<String>(json['humanLocY']),
      tigerLocX: serializer.fromJson<String>(json['tigerLocX']),
      tigerLocY: serializer.fromJson<String>(json['tigerLocY']),
      monkeyLocX: serializer.fromJson<String>(json['monkeyLocX']),
      monkeyLocY: serializer.fromJson<String>(json['monkeyLocY']),
      giraffeLocX: serializer.fromJson<String>(json['giraffeLocX']),
      giraffeLocY: serializer.fromJson<String>(json['giraffeLocY']),
      koalaLocX: serializer.fromJson<String>(json['koalaLocX']),
      koalaLocY: serializer.fromJson<String>(json['koalaLocY']),
      elephantLocX: serializer.fromJson<String>(json['elephantLocX']),
      elephantLocY: serializer.fromJson<String>(json['elephantLocY']),
      lionLocX: serializer.fromJson<String>(json['lionLocX']),
      lionLocY: serializer.fromJson<String>(json['lionLocY']),
      puppyLocX: serializer.fromJson<String>(json['puppyLocX']),
      puppyLocY: serializer.fromJson<String>(json['puppyLocY']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sceneModel': serializer.toJson<String>(sceneModel),
      'image': serializer.toJson<String>(image),
      'humanLocX': serializer.toJson<String>(humanLocX),
      'humanLocY': serializer.toJson<String>(humanLocY),
      'tigerLocX': serializer.toJson<String>(tigerLocX),
      'tigerLocY': serializer.toJson<String>(tigerLocY),
      'monkeyLocX': serializer.toJson<String>(monkeyLocX),
      'monkeyLocY': serializer.toJson<String>(monkeyLocY),
      'giraffeLocX': serializer.toJson<String>(giraffeLocX),
      'giraffeLocY': serializer.toJson<String>(giraffeLocY),
      'koalaLocX': serializer.toJson<String>(koalaLocX),
      'koalaLocY': serializer.toJson<String>(koalaLocY),
      'elephantLocX': serializer.toJson<String>(elephantLocX),
      'elephantLocY': serializer.toJson<String>(elephantLocY),
      'lionLocX': serializer.toJson<String>(lionLocX),
      'lionLocY': serializer.toJson<String>(lionLocY),
      'puppyLocX': serializer.toJson<String>(puppyLocX),
      'puppyLocY': serializer.toJson<String>(puppyLocY),
    };
  }

  FairytailModelData copyWith(
          {int? id,
          String? sceneModel,
          String? image,
          String? humanLocX,
          String? humanLocY,
          String? tigerLocX,
          String? tigerLocY,
          String? monkeyLocX,
          String? monkeyLocY,
          String? giraffeLocX,
          String? giraffeLocY,
          String? koalaLocX,
          String? koalaLocY,
          String? elephantLocX,
          String? elephantLocY,
          String? lionLocX,
          String? lionLocY,
          String? puppyLocX,
          String? puppyLocY}) =>
      FairytailModelData(
        id: id ?? this.id,
        sceneModel: sceneModel ?? this.sceneModel,
        image: image ?? this.image,
        humanLocX: humanLocX ?? this.humanLocX,
        humanLocY: humanLocY ?? this.humanLocY,
        tigerLocX: tigerLocX ?? this.tigerLocX,
        tigerLocY: tigerLocY ?? this.tigerLocY,
        monkeyLocX: monkeyLocX ?? this.monkeyLocX,
        monkeyLocY: monkeyLocY ?? this.monkeyLocY,
        giraffeLocX: giraffeLocX ?? this.giraffeLocX,
        giraffeLocY: giraffeLocY ?? this.giraffeLocY,
        koalaLocX: koalaLocX ?? this.koalaLocX,
        koalaLocY: koalaLocY ?? this.koalaLocY,
        elephantLocX: elephantLocX ?? this.elephantLocX,
        elephantLocY: elephantLocY ?? this.elephantLocY,
        lionLocX: lionLocX ?? this.lionLocX,
        lionLocY: lionLocY ?? this.lionLocY,
        puppyLocX: puppyLocX ?? this.puppyLocX,
        puppyLocY: puppyLocY ?? this.puppyLocY,
      );
  @override
  String toString() {
    return (StringBuffer('FairytailModelData(')
          ..write('id: $id, ')
          ..write('sceneModel: $sceneModel, ')
          ..write('image: $image, ')
          ..write('humanLocX: $humanLocX, ')
          ..write('humanLocY: $humanLocY, ')
          ..write('tigerLocX: $tigerLocX, ')
          ..write('tigerLocY: $tigerLocY, ')
          ..write('monkeyLocX: $monkeyLocX, ')
          ..write('monkeyLocY: $monkeyLocY, ')
          ..write('giraffeLocX: $giraffeLocX, ')
          ..write('giraffeLocY: $giraffeLocY, ')
          ..write('koalaLocX: $koalaLocX, ')
          ..write('koalaLocY: $koalaLocY, ')
          ..write('elephantLocX: $elephantLocX, ')
          ..write('elephantLocY: $elephantLocY, ')
          ..write('lionLocX: $lionLocX, ')
          ..write('lionLocY: $lionLocY, ')
          ..write('puppyLocX: $puppyLocX, ')
          ..write('puppyLocY: $puppyLocY')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      sceneModel,
      image,
      humanLocX,
      humanLocY,
      tigerLocX,
      tigerLocY,
      monkeyLocX,
      monkeyLocY,
      giraffeLocX,
      giraffeLocY,
      koalaLocX,
      koalaLocY,
      elephantLocX,
      elephantLocY,
      lionLocX,
      lionLocY,
      puppyLocX,
      puppyLocY);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FairytailModelData &&
          other.id == this.id &&
          other.sceneModel == this.sceneModel &&
          other.image == this.image &&
          other.humanLocX == this.humanLocX &&
          other.humanLocY == this.humanLocY &&
          other.tigerLocX == this.tigerLocX &&
          other.tigerLocY == this.tigerLocY &&
          other.monkeyLocX == this.monkeyLocX &&
          other.monkeyLocY == this.monkeyLocY &&
          other.giraffeLocX == this.giraffeLocX &&
          other.giraffeLocY == this.giraffeLocY &&
          other.koalaLocX == this.koalaLocX &&
          other.koalaLocY == this.koalaLocY &&
          other.elephantLocX == this.elephantLocX &&
          other.elephantLocY == this.elephantLocY &&
          other.lionLocX == this.lionLocX &&
          other.lionLocY == this.lionLocY &&
          other.puppyLocX == this.puppyLocX &&
          other.puppyLocY == this.puppyLocY);
}

class FairytailModelCompanion extends UpdateCompanion<FairytailModelData> {
  final Value<int> id;
  final Value<String> sceneModel;
  final Value<String> image;
  final Value<String> humanLocX;
  final Value<String> humanLocY;
  final Value<String> tigerLocX;
  final Value<String> tigerLocY;
  final Value<String> monkeyLocX;
  final Value<String> monkeyLocY;
  final Value<String> giraffeLocX;
  final Value<String> giraffeLocY;
  final Value<String> koalaLocX;
  final Value<String> koalaLocY;
  final Value<String> elephantLocX;
  final Value<String> elephantLocY;
  final Value<String> lionLocX;
  final Value<String> lionLocY;
  final Value<String> puppyLocX;
  final Value<String> puppyLocY;
  const FairytailModelCompanion({
    this.id = const Value.absent(),
    this.sceneModel = const Value.absent(),
    this.image = const Value.absent(),
    this.humanLocX = const Value.absent(),
    this.humanLocY = const Value.absent(),
    this.tigerLocX = const Value.absent(),
    this.tigerLocY = const Value.absent(),
    this.monkeyLocX = const Value.absent(),
    this.monkeyLocY = const Value.absent(),
    this.giraffeLocX = const Value.absent(),
    this.giraffeLocY = const Value.absent(),
    this.koalaLocX = const Value.absent(),
    this.koalaLocY = const Value.absent(),
    this.elephantLocX = const Value.absent(),
    this.elephantLocY = const Value.absent(),
    this.lionLocX = const Value.absent(),
    this.lionLocY = const Value.absent(),
    this.puppyLocX = const Value.absent(),
    this.puppyLocY = const Value.absent(),
  });
  FairytailModelCompanion.insert({
    this.id = const Value.absent(),
    required String sceneModel,
    required String image,
    required String humanLocX,
    required String humanLocY,
    required String tigerLocX,
    required String tigerLocY,
    required String monkeyLocX,
    required String monkeyLocY,
    required String giraffeLocX,
    required String giraffeLocY,
    required String koalaLocX,
    required String koalaLocY,
    required String elephantLocX,
    required String elephantLocY,
    required String lionLocX,
    required String lionLocY,
    required String puppyLocX,
    required String puppyLocY,
  })  : sceneModel = Value(sceneModel),
        image = Value(image),
        humanLocX = Value(humanLocX),
        humanLocY = Value(humanLocY),
        tigerLocX = Value(tigerLocX),
        tigerLocY = Value(tigerLocY),
        monkeyLocX = Value(monkeyLocX),
        monkeyLocY = Value(monkeyLocY),
        giraffeLocX = Value(giraffeLocX),
        giraffeLocY = Value(giraffeLocY),
        koalaLocX = Value(koalaLocX),
        koalaLocY = Value(koalaLocY),
        elephantLocX = Value(elephantLocX),
        elephantLocY = Value(elephantLocY),
        lionLocX = Value(lionLocX),
        lionLocY = Value(lionLocY),
        puppyLocX = Value(puppyLocX),
        puppyLocY = Value(puppyLocY);
  static Insertable<FairytailModelData> custom({
    Expression<int>? id,
    Expression<String>? sceneModel,
    Expression<String>? image,
    Expression<String>? humanLocX,
    Expression<String>? humanLocY,
    Expression<String>? tigerLocX,
    Expression<String>? tigerLocY,
    Expression<String>? monkeyLocX,
    Expression<String>? monkeyLocY,
    Expression<String>? giraffeLocX,
    Expression<String>? giraffeLocY,
    Expression<String>? koalaLocX,
    Expression<String>? koalaLocY,
    Expression<String>? elephantLocX,
    Expression<String>? elephantLocY,
    Expression<String>? lionLocX,
    Expression<String>? lionLocY,
    Expression<String>? puppyLocX,
    Expression<String>? puppyLocY,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sceneModel != null) 'scene_model': sceneModel,
      if (image != null) 'image': image,
      if (humanLocX != null) 'human_loc_x': humanLocX,
      if (humanLocY != null) 'human_loc_y': humanLocY,
      if (tigerLocX != null) 'tiger_loc_x': tigerLocX,
      if (tigerLocY != null) 'tiger_loc_y': tigerLocY,
      if (monkeyLocX != null) 'monkey_loc_x': monkeyLocX,
      if (monkeyLocY != null) 'monkey_loc_y': monkeyLocY,
      if (giraffeLocX != null) 'giraffe_loc_x': giraffeLocX,
      if (giraffeLocY != null) 'giraffe_loc_y': giraffeLocY,
      if (koalaLocX != null) 'koala_loc_x': koalaLocX,
      if (koalaLocY != null) 'koala_loc_y': koalaLocY,
      if (elephantLocX != null) 'elephant_loc_x': elephantLocX,
      if (elephantLocY != null) 'elephant_loc_y': elephantLocY,
      if (lionLocX != null) 'lion_loc_x': lionLocX,
      if (lionLocY != null) 'lion_loc_y': lionLocY,
      if (puppyLocX != null) 'puppy_loc_x': puppyLocX,
      if (puppyLocY != null) 'puppy_loc_y': puppyLocY,
    });
  }

  FairytailModelCompanion copyWith(
      {Value<int>? id,
      Value<String>? sceneModel,
      Value<String>? image,
      Value<String>? humanLocX,
      Value<String>? humanLocY,
      Value<String>? tigerLocX,
      Value<String>? tigerLocY,
      Value<String>? monkeyLocX,
      Value<String>? monkeyLocY,
      Value<String>? giraffeLocX,
      Value<String>? giraffeLocY,
      Value<String>? koalaLocX,
      Value<String>? koalaLocY,
      Value<String>? elephantLocX,
      Value<String>? elephantLocY,
      Value<String>? lionLocX,
      Value<String>? lionLocY,
      Value<String>? puppyLocX,
      Value<String>? puppyLocY}) {
    return FairytailModelCompanion(
      id: id ?? this.id,
      sceneModel: sceneModel ?? this.sceneModel,
      image: image ?? this.image,
      humanLocX: humanLocX ?? this.humanLocX,
      humanLocY: humanLocY ?? this.humanLocY,
      tigerLocX: tigerLocX ?? this.tigerLocX,
      tigerLocY: tigerLocY ?? this.tigerLocY,
      monkeyLocX: monkeyLocX ?? this.monkeyLocX,
      monkeyLocY: monkeyLocY ?? this.monkeyLocY,
      giraffeLocX: giraffeLocX ?? this.giraffeLocX,
      giraffeLocY: giraffeLocY ?? this.giraffeLocY,
      koalaLocX: koalaLocX ?? this.koalaLocX,
      koalaLocY: koalaLocY ?? this.koalaLocY,
      elephantLocX: elephantLocX ?? this.elephantLocX,
      elephantLocY: elephantLocY ?? this.elephantLocY,
      lionLocX: lionLocX ?? this.lionLocX,
      lionLocY: lionLocY ?? this.lionLocY,
      puppyLocX: puppyLocX ?? this.puppyLocX,
      puppyLocY: puppyLocY ?? this.puppyLocY,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sceneModel.present) {
      map['scene_model'] = Variable<String>(sceneModel.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (humanLocX.present) {
      map['human_loc_x'] = Variable<String>(humanLocX.value);
    }
    if (humanLocY.present) {
      map['human_loc_y'] = Variable<String>(humanLocY.value);
    }
    if (tigerLocX.present) {
      map['tiger_loc_x'] = Variable<String>(tigerLocX.value);
    }
    if (tigerLocY.present) {
      map['tiger_loc_y'] = Variable<String>(tigerLocY.value);
    }
    if (monkeyLocX.present) {
      map['monkey_loc_x'] = Variable<String>(monkeyLocX.value);
    }
    if (monkeyLocY.present) {
      map['monkey_loc_y'] = Variable<String>(monkeyLocY.value);
    }
    if (giraffeLocX.present) {
      map['giraffe_loc_x'] = Variable<String>(giraffeLocX.value);
    }
    if (giraffeLocY.present) {
      map['giraffe_loc_y'] = Variable<String>(giraffeLocY.value);
    }
    if (koalaLocX.present) {
      map['koala_loc_x'] = Variable<String>(koalaLocX.value);
    }
    if (koalaLocY.present) {
      map['koala_loc_y'] = Variable<String>(koalaLocY.value);
    }
    if (elephantLocX.present) {
      map['elephant_loc_x'] = Variable<String>(elephantLocX.value);
    }
    if (elephantLocY.present) {
      map['elephant_loc_y'] = Variable<String>(elephantLocY.value);
    }
    if (lionLocX.present) {
      map['lion_loc_x'] = Variable<String>(lionLocX.value);
    }
    if (lionLocY.present) {
      map['lion_loc_y'] = Variable<String>(lionLocY.value);
    }
    if (puppyLocX.present) {
      map['puppy_loc_x'] = Variable<String>(puppyLocX.value);
    }
    if (puppyLocY.present) {
      map['puppy_loc_y'] = Variable<String>(puppyLocY.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FairytailModelCompanion(')
          ..write('id: $id, ')
          ..write('sceneModel: $sceneModel, ')
          ..write('image: $image, ')
          ..write('humanLocX: $humanLocX, ')
          ..write('humanLocY: $humanLocY, ')
          ..write('tigerLocX: $tigerLocX, ')
          ..write('tigerLocY: $tigerLocY, ')
          ..write('monkeyLocX: $monkeyLocX, ')
          ..write('monkeyLocY: $monkeyLocY, ')
          ..write('giraffeLocX: $giraffeLocX, ')
          ..write('giraffeLocY: $giraffeLocY, ')
          ..write('koalaLocX: $koalaLocX, ')
          ..write('koalaLocY: $koalaLocY, ')
          ..write('elephantLocX: $elephantLocX, ')
          ..write('elephantLocY: $elephantLocY, ')
          ..write('lionLocX: $lionLocX, ')
          ..write('lionLocY: $lionLocY, ')
          ..write('puppyLocX: $puppyLocX, ')
          ..write('puppyLocY: $puppyLocY')
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
  required String sceneModel,
  required String image,
  required String humanLocX,
  required String humanLocY,
  required String tigerLocX,
  required String tigerLocY,
  required String monkeyLocX,
  required String monkeyLocY,
  required String giraffeLocX,
  required String giraffeLocY,
  required String koalaLocX,
  required String koalaLocY,
  required String elephantLocX,
  required String elephantLocY,
  required String lionLocX,
  required String lionLocY,
  required String puppyLocX,
  required String puppyLocY,
});
typedef $$FairytailModelTableUpdateCompanionBuilder = FairytailModelCompanion
    Function({
  Value<int> id,
  Value<String> sceneModel,
  Value<String> image,
  Value<String> humanLocX,
  Value<String> humanLocY,
  Value<String> tigerLocX,
  Value<String> tigerLocY,
  Value<String> monkeyLocX,
  Value<String> monkeyLocY,
  Value<String> giraffeLocX,
  Value<String> giraffeLocY,
  Value<String> koalaLocX,
  Value<String> koalaLocY,
  Value<String> elephantLocX,
  Value<String> elephantLocY,
  Value<String> lionLocX,
  Value<String> lionLocY,
  Value<String> puppyLocX,
  Value<String> puppyLocY,
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
            Value<String> sceneModel = const Value.absent(),
            Value<String> image = const Value.absent(),
            Value<String> humanLocX = const Value.absent(),
            Value<String> humanLocY = const Value.absent(),
            Value<String> tigerLocX = const Value.absent(),
            Value<String> tigerLocY = const Value.absent(),
            Value<String> monkeyLocX = const Value.absent(),
            Value<String> monkeyLocY = const Value.absent(),
            Value<String> giraffeLocX = const Value.absent(),
            Value<String> giraffeLocY = const Value.absent(),
            Value<String> koalaLocX = const Value.absent(),
            Value<String> koalaLocY = const Value.absent(),
            Value<String> elephantLocX = const Value.absent(),
            Value<String> elephantLocY = const Value.absent(),
            Value<String> lionLocX = const Value.absent(),
            Value<String> lionLocY = const Value.absent(),
            Value<String> puppyLocX = const Value.absent(),
            Value<String> puppyLocY = const Value.absent(),
          }) =>
              FairytailModelCompanion(
            id: id,
            sceneModel: sceneModel,
            image: image,
            humanLocX: humanLocX,
            humanLocY: humanLocY,
            tigerLocX: tigerLocX,
            tigerLocY: tigerLocY,
            monkeyLocX: monkeyLocX,
            monkeyLocY: monkeyLocY,
            giraffeLocX: giraffeLocX,
            giraffeLocY: giraffeLocY,
            koalaLocX: koalaLocX,
            koalaLocY: koalaLocY,
            elephantLocX: elephantLocX,
            elephantLocY: elephantLocY,
            lionLocX: lionLocX,
            lionLocY: lionLocY,
            puppyLocX: puppyLocX,
            puppyLocY: puppyLocY,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String sceneModel,
            required String image,
            required String humanLocX,
            required String humanLocY,
            required String tigerLocX,
            required String tigerLocY,
            required String monkeyLocX,
            required String monkeyLocY,
            required String giraffeLocX,
            required String giraffeLocY,
            required String koalaLocX,
            required String koalaLocY,
            required String elephantLocX,
            required String elephantLocY,
            required String lionLocX,
            required String lionLocY,
            required String puppyLocX,
            required String puppyLocY,
          }) =>
              FairytailModelCompanion.insert(
            id: id,
            sceneModel: sceneModel,
            image: image,
            humanLocX: humanLocX,
            humanLocY: humanLocY,
            tigerLocX: tigerLocX,
            tigerLocY: tigerLocY,
            monkeyLocX: monkeyLocX,
            monkeyLocY: monkeyLocY,
            giraffeLocX: giraffeLocX,
            giraffeLocY: giraffeLocY,
            koalaLocX: koalaLocX,
            koalaLocY: koalaLocY,
            elephantLocX: elephantLocX,
            elephantLocY: elephantLocY,
            lionLocX: lionLocX,
            lionLocY: lionLocY,
            puppyLocX: puppyLocX,
            puppyLocY: puppyLocY,
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

  ColumnFilters<String> get sceneModel => $state.composableBuilder(
      column: $state.table.sceneModel,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get image => $state.composableBuilder(
      column: $state.table.image,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get humanLocX => $state.composableBuilder(
      column: $state.table.humanLocX,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get humanLocY => $state.composableBuilder(
      column: $state.table.humanLocY,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get tigerLocX => $state.composableBuilder(
      column: $state.table.tigerLocX,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get tigerLocY => $state.composableBuilder(
      column: $state.table.tigerLocY,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get monkeyLocX => $state.composableBuilder(
      column: $state.table.monkeyLocX,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get monkeyLocY => $state.composableBuilder(
      column: $state.table.monkeyLocY,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get giraffeLocX => $state.composableBuilder(
      column: $state.table.giraffeLocX,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get giraffeLocY => $state.composableBuilder(
      column: $state.table.giraffeLocY,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get koalaLocX => $state.composableBuilder(
      column: $state.table.koalaLocX,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get koalaLocY => $state.composableBuilder(
      column: $state.table.koalaLocY,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get elephantLocX => $state.composableBuilder(
      column: $state.table.elephantLocX,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get elephantLocY => $state.composableBuilder(
      column: $state.table.elephantLocY,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get lionLocX => $state.composableBuilder(
      column: $state.table.lionLocX,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get lionLocY => $state.composableBuilder(
      column: $state.table.lionLocY,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get puppyLocX => $state.composableBuilder(
      column: $state.table.puppyLocX,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get puppyLocY => $state.composableBuilder(
      column: $state.table.puppyLocY,
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

  ColumnOrderings<String> get sceneModel => $state.composableBuilder(
      column: $state.table.sceneModel,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get image => $state.composableBuilder(
      column: $state.table.image,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get humanLocX => $state.composableBuilder(
      column: $state.table.humanLocX,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get humanLocY => $state.composableBuilder(
      column: $state.table.humanLocY,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get tigerLocX => $state.composableBuilder(
      column: $state.table.tigerLocX,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get tigerLocY => $state.composableBuilder(
      column: $state.table.tigerLocY,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get monkeyLocX => $state.composableBuilder(
      column: $state.table.monkeyLocX,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get monkeyLocY => $state.composableBuilder(
      column: $state.table.monkeyLocY,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get giraffeLocX => $state.composableBuilder(
      column: $state.table.giraffeLocX,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get giraffeLocY => $state.composableBuilder(
      column: $state.table.giraffeLocY,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get koalaLocX => $state.composableBuilder(
      column: $state.table.koalaLocX,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get koalaLocY => $state.composableBuilder(
      column: $state.table.koalaLocY,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get elephantLocX => $state.composableBuilder(
      column: $state.table.elephantLocX,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get elephantLocY => $state.composableBuilder(
      column: $state.table.elephantLocY,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get lionLocX => $state.composableBuilder(
      column: $state.table.lionLocX,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get lionLocY => $state.composableBuilder(
      column: $state.table.lionLocY,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get puppyLocX => $state.composableBuilder(
      column: $state.table.puppyLocX,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get puppyLocY => $state.composableBuilder(
      column: $state.table.puppyLocY,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$FairytailModelTableTableManager get fairytailModel =>
      $$FairytailModelTableTableManager(_db, _db.fairytailModel);
}
