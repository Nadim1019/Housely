// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UsersTableTable extends UsersTable
    with TableInfo<$UsersTableTable, UserTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumnWithTypeConverter<UserRole, String> role =
      GeneratedColumn<String>('role', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<UserRole>($UsersTableTable.$converterrole);
  static const VerificationMeta _unitNumberMeta =
      const VerificationMeta('unitNumber');
  @override
  late final GeneratedColumn<String> unitNumber = GeneratedColumn<String>(
      'unit_number', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, email, role, unitNumber, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users_table';
  @override
  VerificationContext validateIntegrity(Insertable<UserTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    context.handle(_roleMeta, const VerificationResult.success());
    if (data.containsKey('unit_number')) {
      context.handle(
          _unitNumberMeta,
          unitNumber.isAcceptableOrUnknown(
              data['unit_number']!, _unitNumberMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      role: $UsersTableTable.$converterrole.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}role'])!),
      unitNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit_number']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $UsersTableTable createAlias(String alias) {
    return $UsersTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<UserRole, String, String> $converterrole =
      const EnumNameConverter<UserRole>(UserRole.values);
}

class UserTableData extends DataClass implements Insertable<UserTableData> {
  final String id;
  final String name;
  final String email;
  final UserRole role;
  final String? unitNumber;
  final DateTime createdAt;
  const UserTableData(
      {required this.id,
      required this.name,
      required this.email,
      required this.role,
      this.unitNumber,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['email'] = Variable<String>(email);
    {
      map['role'] =
          Variable<String>($UsersTableTable.$converterrole.toSql(role));
    }
    if (!nullToAbsent || unitNumber != null) {
      map['unit_number'] = Variable<String>(unitNumber);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  UsersTableCompanion toCompanion(bool nullToAbsent) {
    return UsersTableCompanion(
      id: Value(id),
      name: Value(name),
      email: Value(email),
      role: Value(role),
      unitNumber: unitNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(unitNumber),
      createdAt: Value(createdAt),
    );
  }

  factory UserTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
      role: $UsersTableTable.$converterrole
          .fromJson(serializer.fromJson<String>(json['role'])),
      unitNumber: serializer.fromJson<String?>(json['unitNumber']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String>(email),
      'role': serializer
          .toJson<String>($UsersTableTable.$converterrole.toJson(role)),
      'unitNumber': serializer.toJson<String?>(unitNumber),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  UserTableData copyWith(
          {String? id,
          String? name,
          String? email,
          UserRole? role,
          Value<String?> unitNumber = const Value.absent(),
          DateTime? createdAt}) =>
      UserTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        role: role ?? this.role,
        unitNumber: unitNumber.present ? unitNumber.value : this.unitNumber,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('UserTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('role: $role, ')
          ..write('unitNumber: $unitNumber, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, email, role, unitNumber, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.email == this.email &&
          other.role == this.role &&
          other.unitNumber == this.unitNumber &&
          other.createdAt == this.createdAt);
}

class UsersTableCompanion extends UpdateCompanion<UserTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> email;
  final Value<UserRole> role;
  final Value<String?> unitNumber;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const UsersTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.role = const Value.absent(),
    this.unitNumber = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersTableCompanion.insert({
    required String id,
    required String name,
    required String email,
    required UserRole role,
    this.unitNumber = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        email = Value(email),
        role = Value(role);
  static Insertable<UserTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? role,
    Expression<String>? unitNumber,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (role != null) 'role': role,
      if (unitNumber != null) 'unit_number': unitNumber,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? email,
      Value<UserRole>? role,
      Value<String?>? unitNumber,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return UsersTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
      unitNumber: unitNumber ?? this.unitNumber,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (role.present) {
      map['role'] =
          Variable<String>($UsersTableTable.$converterrole.toSql(role.value));
    }
    if (unitNumber.present) {
      map['unit_number'] = Variable<String>(unitNumber.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('role: $role, ')
          ..write('unitNumber: $unitNumber, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PropertiesTableTable extends PropertiesTable
    with TableInfo<$PropertiesTableTable, PropertiesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PropertiesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ownerIdMeta =
      const VerificationMeta('ownerId');
  @override
  late final GeneratedColumn<String> ownerId = GeneratedColumn<String>(
      'owner_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users_table (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, name, address, ownerId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'properties_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<PropertiesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('owner_id')) {
      context.handle(_ownerIdMeta,
          ownerId.isAcceptableOrUnknown(data['owner_id']!, _ownerIdMeta));
    } else if (isInserting) {
      context.missing(_ownerIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PropertiesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PropertiesTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address'])!,
      ownerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}owner_id'])!,
    );
  }

  @override
  $PropertiesTableTable createAlias(String alias) {
    return $PropertiesTableTable(attachedDatabase, alias);
  }
}

class PropertiesTableData extends DataClass
    implements Insertable<PropertiesTableData> {
  final String id;
  final String name;
  final String address;
  final String ownerId;
  const PropertiesTableData(
      {required this.id,
      required this.name,
      required this.address,
      required this.ownerId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['address'] = Variable<String>(address);
    map['owner_id'] = Variable<String>(ownerId);
    return map;
  }

  PropertiesTableCompanion toCompanion(bool nullToAbsent) {
    return PropertiesTableCompanion(
      id: Value(id),
      name: Value(name),
      address: Value(address),
      ownerId: Value(ownerId),
    );
  }

  factory PropertiesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PropertiesTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      address: serializer.fromJson<String>(json['address']),
      ownerId: serializer.fromJson<String>(json['ownerId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'address': serializer.toJson<String>(address),
      'ownerId': serializer.toJson<String>(ownerId),
    };
  }

  PropertiesTableData copyWith(
          {String? id, String? name, String? address, String? ownerId}) =>
      PropertiesTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        address: address ?? this.address,
        ownerId: ownerId ?? this.ownerId,
      );
  @override
  String toString() {
    return (StringBuffer('PropertiesTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('ownerId: $ownerId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, address, ownerId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PropertiesTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.address == this.address &&
          other.ownerId == this.ownerId);
}

class PropertiesTableCompanion extends UpdateCompanion<PropertiesTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> address;
  final Value<String> ownerId;
  final Value<int> rowid;
  const PropertiesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.address = const Value.absent(),
    this.ownerId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PropertiesTableCompanion.insert({
    required String id,
    required String name,
    required String address,
    required String ownerId,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        address = Value(address),
        ownerId = Value(ownerId);
  static Insertable<PropertiesTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? address,
    Expression<String>? ownerId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (address != null) 'address': address,
      if (ownerId != null) 'owner_id': ownerId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PropertiesTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? address,
      Value<String>? ownerId,
      Value<int>? rowid}) {
    return PropertiesTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      ownerId: ownerId ?? this.ownerId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (ownerId.present) {
      map['owner_id'] = Variable<String>(ownerId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PropertiesTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('ownerId: $ownerId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RentTransactionsTableTable extends RentTransactionsTable
    with TableInfo<$RentTransactionsTableTable, RentTransactionsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RentTransactionsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _propertyIdMeta =
      const VerificationMeta('propertyId');
  @override
  late final GeneratedColumn<String> propertyId = GeneratedColumn<String>(
      'property_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES properties_table (id)'));
  static const VerificationMeta _residentIdMeta =
      const VerificationMeta('residentId');
  @override
  late final GeneratedColumn<String> residentId = GeneratedColumn<String>(
      'resident_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users_table (id)'));
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _dueDateMeta =
      const VerificationMeta('dueDate');
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
      'due_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isPaidMeta = const VerificationMeta('isPaid');
  @override
  late final GeneratedColumn<bool> isPaid = GeneratedColumn<bool>(
      'is_paid', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_paid" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _paidAtMeta = const VerificationMeta('paidAt');
  @override
  late final GeneratedColumn<DateTime> paidAt = GeneratedColumn<DateTime>(
      'paid_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, propertyId, residentId, amount, dueDate, isPaid, paidAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'rent_transactions_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<RentTransactionsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('property_id')) {
      context.handle(
          _propertyIdMeta,
          propertyId.isAcceptableOrUnknown(
              data['property_id']!, _propertyIdMeta));
    } else if (isInserting) {
      context.missing(_propertyIdMeta);
    }
    if (data.containsKey('resident_id')) {
      context.handle(
          _residentIdMeta,
          residentId.isAcceptableOrUnknown(
              data['resident_id']!, _residentIdMeta));
    } else if (isInserting) {
      context.missing(_residentIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('due_date')) {
      context.handle(_dueDateMeta,
          dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta));
    } else if (isInserting) {
      context.missing(_dueDateMeta);
    }
    if (data.containsKey('is_paid')) {
      context.handle(_isPaidMeta,
          isPaid.isAcceptableOrUnknown(data['is_paid']!, _isPaidMeta));
    }
    if (data.containsKey('paid_at')) {
      context.handle(_paidAtMeta,
          paidAt.isAcceptableOrUnknown(data['paid_at']!, _paidAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RentTransactionsTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RentTransactionsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      propertyId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}property_id'])!,
      residentId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}resident_id'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      dueDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}due_date'])!,
      isPaid: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_paid'])!,
      paidAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}paid_at']),
    );
  }

  @override
  $RentTransactionsTableTable createAlias(String alias) {
    return $RentTransactionsTableTable(attachedDatabase, alias);
  }
}

class RentTransactionsTableData extends DataClass
    implements Insertable<RentTransactionsTableData> {
  final String id;
  final String propertyId;
  final String residentId;
  final double amount;
  final DateTime dueDate;
  final bool isPaid;
  final DateTime? paidAt;
  const RentTransactionsTableData(
      {required this.id,
      required this.propertyId,
      required this.residentId,
      required this.amount,
      required this.dueDate,
      required this.isPaid,
      this.paidAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['property_id'] = Variable<String>(propertyId);
    map['resident_id'] = Variable<String>(residentId);
    map['amount'] = Variable<double>(amount);
    map['due_date'] = Variable<DateTime>(dueDate);
    map['is_paid'] = Variable<bool>(isPaid);
    if (!nullToAbsent || paidAt != null) {
      map['paid_at'] = Variable<DateTime>(paidAt);
    }
    return map;
  }

  RentTransactionsTableCompanion toCompanion(bool nullToAbsent) {
    return RentTransactionsTableCompanion(
      id: Value(id),
      propertyId: Value(propertyId),
      residentId: Value(residentId),
      amount: Value(amount),
      dueDate: Value(dueDate),
      isPaid: Value(isPaid),
      paidAt:
          paidAt == null && nullToAbsent ? const Value.absent() : Value(paidAt),
    );
  }

  factory RentTransactionsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RentTransactionsTableData(
      id: serializer.fromJson<String>(json['id']),
      propertyId: serializer.fromJson<String>(json['propertyId']),
      residentId: serializer.fromJson<String>(json['residentId']),
      amount: serializer.fromJson<double>(json['amount']),
      dueDate: serializer.fromJson<DateTime>(json['dueDate']),
      isPaid: serializer.fromJson<bool>(json['isPaid']),
      paidAt: serializer.fromJson<DateTime?>(json['paidAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'propertyId': serializer.toJson<String>(propertyId),
      'residentId': serializer.toJson<String>(residentId),
      'amount': serializer.toJson<double>(amount),
      'dueDate': serializer.toJson<DateTime>(dueDate),
      'isPaid': serializer.toJson<bool>(isPaid),
      'paidAt': serializer.toJson<DateTime?>(paidAt),
    };
  }

  RentTransactionsTableData copyWith(
          {String? id,
          String? propertyId,
          String? residentId,
          double? amount,
          DateTime? dueDate,
          bool? isPaid,
          Value<DateTime?> paidAt = const Value.absent()}) =>
      RentTransactionsTableData(
        id: id ?? this.id,
        propertyId: propertyId ?? this.propertyId,
        residentId: residentId ?? this.residentId,
        amount: amount ?? this.amount,
        dueDate: dueDate ?? this.dueDate,
        isPaid: isPaid ?? this.isPaid,
        paidAt: paidAt.present ? paidAt.value : this.paidAt,
      );
  @override
  String toString() {
    return (StringBuffer('RentTransactionsTableData(')
          ..write('id: $id, ')
          ..write('propertyId: $propertyId, ')
          ..write('residentId: $residentId, ')
          ..write('amount: $amount, ')
          ..write('dueDate: $dueDate, ')
          ..write('isPaid: $isPaid, ')
          ..write('paidAt: $paidAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, propertyId, residentId, amount, dueDate, isPaid, paidAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RentTransactionsTableData &&
          other.id == this.id &&
          other.propertyId == this.propertyId &&
          other.residentId == this.residentId &&
          other.amount == this.amount &&
          other.dueDate == this.dueDate &&
          other.isPaid == this.isPaid &&
          other.paidAt == this.paidAt);
}

class RentTransactionsTableCompanion
    extends UpdateCompanion<RentTransactionsTableData> {
  final Value<String> id;
  final Value<String> propertyId;
  final Value<String> residentId;
  final Value<double> amount;
  final Value<DateTime> dueDate;
  final Value<bool> isPaid;
  final Value<DateTime?> paidAt;
  final Value<int> rowid;
  const RentTransactionsTableCompanion({
    this.id = const Value.absent(),
    this.propertyId = const Value.absent(),
    this.residentId = const Value.absent(),
    this.amount = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.isPaid = const Value.absent(),
    this.paidAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RentTransactionsTableCompanion.insert({
    required String id,
    required String propertyId,
    required String residentId,
    required double amount,
    required DateTime dueDate,
    this.isPaid = const Value.absent(),
    this.paidAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        propertyId = Value(propertyId),
        residentId = Value(residentId),
        amount = Value(amount),
        dueDate = Value(dueDate);
  static Insertable<RentTransactionsTableData> custom({
    Expression<String>? id,
    Expression<String>? propertyId,
    Expression<String>? residentId,
    Expression<double>? amount,
    Expression<DateTime>? dueDate,
    Expression<bool>? isPaid,
    Expression<DateTime>? paidAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (propertyId != null) 'property_id': propertyId,
      if (residentId != null) 'resident_id': residentId,
      if (amount != null) 'amount': amount,
      if (dueDate != null) 'due_date': dueDate,
      if (isPaid != null) 'is_paid': isPaid,
      if (paidAt != null) 'paid_at': paidAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RentTransactionsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? propertyId,
      Value<String>? residentId,
      Value<double>? amount,
      Value<DateTime>? dueDate,
      Value<bool>? isPaid,
      Value<DateTime?>? paidAt,
      Value<int>? rowid}) {
    return RentTransactionsTableCompanion(
      id: id ?? this.id,
      propertyId: propertyId ?? this.propertyId,
      residentId: residentId ?? this.residentId,
      amount: amount ?? this.amount,
      dueDate: dueDate ?? this.dueDate,
      isPaid: isPaid ?? this.isPaid,
      paidAt: paidAt ?? this.paidAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (propertyId.present) {
      map['property_id'] = Variable<String>(propertyId.value);
    }
    if (residentId.present) {
      map['resident_id'] = Variable<String>(residentId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (isPaid.present) {
      map['is_paid'] = Variable<bool>(isPaid.value);
    }
    if (paidAt.present) {
      map['paid_at'] = Variable<DateTime>(paidAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RentTransactionsTableCompanion(')
          ..write('id: $id, ')
          ..write('propertyId: $propertyId, ')
          ..write('residentId: $residentId, ')
          ..write('amount: $amount, ')
          ..write('dueDate: $dueDate, ')
          ..write('isPaid: $isPaid, ')
          ..write('paidAt: $paidAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MaintenanceTicketsTableTable extends MaintenanceTicketsTable
    with TableInfo<$MaintenanceTicketsTableTable, MaintenanceTicketsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MaintenanceTicketsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 150),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priorityMeta =
      const VerificationMeta('priority');
  @override
  late final GeneratedColumnWithTypeConverter<TicketPriority, String> priority =
      GeneratedColumn<String>('priority', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<TicketPriority>(
              $MaintenanceTicketsTableTable.$converterpriority);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumnWithTypeConverter<TicketStatus, String> status =
      GeneratedColumn<String>('status', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<TicketStatus>(
              $MaintenanceTicketsTableTable.$converterstatus);
  static const VerificationMeta _residentIdMeta =
      const VerificationMeta('residentId');
  @override
  late final GeneratedColumn<String> residentId = GeneratedColumn<String>(
      'resident_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users_table (id)'));
  static const VerificationMeta _propertyIdMeta =
      const VerificationMeta('propertyId');
  @override
  late final GeneratedColumn<String> propertyId = GeneratedColumn<String>(
      'property_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES properties_table (id)'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        description,
        priority,
        status,
        residentId,
        propertyId,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'maintenance_tickets_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<MaintenanceTicketsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    context.handle(_priorityMeta, const VerificationResult.success());
    context.handle(_statusMeta, const VerificationResult.success());
    if (data.containsKey('resident_id')) {
      context.handle(
          _residentIdMeta,
          residentId.isAcceptableOrUnknown(
              data['resident_id']!, _residentIdMeta));
    } else if (isInserting) {
      context.missing(_residentIdMeta);
    }
    if (data.containsKey('property_id')) {
      context.handle(
          _propertyIdMeta,
          propertyId.isAcceptableOrUnknown(
              data['property_id']!, _propertyIdMeta));
    } else if (isInserting) {
      context.missing(_propertyIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MaintenanceTicketsTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MaintenanceTicketsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      priority: $MaintenanceTicketsTableTable.$converterpriority.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}priority'])!),
      status: $MaintenanceTicketsTableTable.$converterstatus.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}status'])!),
      residentId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}resident_id'])!,
      propertyId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}property_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $MaintenanceTicketsTableTable createAlias(String alias) {
    return $MaintenanceTicketsTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<TicketPriority, String, String> $converterpriority =
      const EnumNameConverter<TicketPriority>(TicketPriority.values);
  static JsonTypeConverter2<TicketStatus, String, String> $converterstatus =
      const EnumNameConverter<TicketStatus>(TicketStatus.values);
}

class MaintenanceTicketsTableData extends DataClass
    implements Insertable<MaintenanceTicketsTableData> {
  final String id;
  final String title;
  final String description;
  final TicketPriority priority;
  final TicketStatus status;
  final String residentId;
  final String propertyId;
  final DateTime createdAt;
  const MaintenanceTicketsTableData(
      {required this.id,
      required this.title,
      required this.description,
      required this.priority,
      required this.status,
      required this.residentId,
      required this.propertyId,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    {
      map['priority'] = Variable<String>(
          $MaintenanceTicketsTableTable.$converterpriority.toSql(priority));
    }
    {
      map['status'] = Variable<String>(
          $MaintenanceTicketsTableTable.$converterstatus.toSql(status));
    }
    map['resident_id'] = Variable<String>(residentId);
    map['property_id'] = Variable<String>(propertyId);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  MaintenanceTicketsTableCompanion toCompanion(bool nullToAbsent) {
    return MaintenanceTicketsTableCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      priority: Value(priority),
      status: Value(status),
      residentId: Value(residentId),
      propertyId: Value(propertyId),
      createdAt: Value(createdAt),
    );
  }

  factory MaintenanceTicketsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MaintenanceTicketsTableData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      priority: $MaintenanceTicketsTableTable.$converterpriority
          .fromJson(serializer.fromJson<String>(json['priority'])),
      status: $MaintenanceTicketsTableTable.$converterstatus
          .fromJson(serializer.fromJson<String>(json['status'])),
      residentId: serializer.fromJson<String>(json['residentId']),
      propertyId: serializer.fromJson<String>(json['propertyId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'priority': serializer.toJson<String>(
          $MaintenanceTicketsTableTable.$converterpriority.toJson(priority)),
      'status': serializer.toJson<String>(
          $MaintenanceTicketsTableTable.$converterstatus.toJson(status)),
      'residentId': serializer.toJson<String>(residentId),
      'propertyId': serializer.toJson<String>(propertyId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  MaintenanceTicketsTableData copyWith(
          {String? id,
          String? title,
          String? description,
          TicketPriority? priority,
          TicketStatus? status,
          String? residentId,
          String? propertyId,
          DateTime? createdAt}) =>
      MaintenanceTicketsTableData(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        priority: priority ?? this.priority,
        status: status ?? this.status,
        residentId: residentId ?? this.residentId,
        propertyId: propertyId ?? this.propertyId,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('MaintenanceTicketsTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('priority: $priority, ')
          ..write('status: $status, ')
          ..write('residentId: $residentId, ')
          ..write('propertyId: $propertyId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, priority, status,
      residentId, propertyId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MaintenanceTicketsTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.priority == this.priority &&
          other.status == this.status &&
          other.residentId == this.residentId &&
          other.propertyId == this.propertyId &&
          other.createdAt == this.createdAt);
}

class MaintenanceTicketsTableCompanion
    extends UpdateCompanion<MaintenanceTicketsTableData> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> description;
  final Value<TicketPriority> priority;
  final Value<TicketStatus> status;
  final Value<String> residentId;
  final Value<String> propertyId;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const MaintenanceTicketsTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.priority = const Value.absent(),
    this.status = const Value.absent(),
    this.residentId = const Value.absent(),
    this.propertyId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MaintenanceTicketsTableCompanion.insert({
    required String id,
    required String title,
    required String description,
    required TicketPriority priority,
    required TicketStatus status,
    required String residentId,
    required String propertyId,
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        description = Value(description),
        priority = Value(priority),
        status = Value(status),
        residentId = Value(residentId),
        propertyId = Value(propertyId);
  static Insertable<MaintenanceTicketsTableData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? priority,
    Expression<String>? status,
    Expression<String>? residentId,
    Expression<String>? propertyId,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (priority != null) 'priority': priority,
      if (status != null) 'status': status,
      if (residentId != null) 'resident_id': residentId,
      if (propertyId != null) 'property_id': propertyId,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MaintenanceTicketsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String>? description,
      Value<TicketPriority>? priority,
      Value<TicketStatus>? status,
      Value<String>? residentId,
      Value<String>? propertyId,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return MaintenanceTicketsTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      priority: priority ?? this.priority,
      status: status ?? this.status,
      residentId: residentId ?? this.residentId,
      propertyId: propertyId ?? this.propertyId,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (priority.present) {
      map['priority'] = Variable<String>($MaintenanceTicketsTableTable
          .$converterpriority
          .toSql(priority.value));
    }
    if (status.present) {
      map['status'] = Variable<String>(
          $MaintenanceTicketsTableTable.$converterstatus.toSql(status.value));
    }
    if (residentId.present) {
      map['resident_id'] = Variable<String>(residentId.value);
    }
    if (propertyId.present) {
      map['property_id'] = Variable<String>(propertyId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MaintenanceTicketsTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('priority: $priority, ')
          ..write('status: $status, ')
          ..write('residentId: $residentId, ')
          ..write('propertyId: $propertyId, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NoticesTableTable extends NoticesTable
    with TableInfo<$NoticesTableTable, NoticesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NoticesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 150),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _authorIdMeta =
      const VerificationMeta('authorId');
  @override
  late final GeneratedColumn<String> authorId = GeneratedColumn<String>(
      'author_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users_table (id)'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, content, authorId, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notices_table';
  @override
  VerificationContext validateIntegrity(Insertable<NoticesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('author_id')) {
      context.handle(_authorIdMeta,
          authorId.isAcceptableOrUnknown(data['author_id']!, _authorIdMeta));
    } else if (isInserting) {
      context.missing(_authorIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NoticesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NoticesTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      authorId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}author_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $NoticesTableTable createAlias(String alias) {
    return $NoticesTableTable(attachedDatabase, alias);
  }
}

class NoticesTableData extends DataClass
    implements Insertable<NoticesTableData> {
  final String id;
  final String title;
  final String content;
  final String authorId;
  final DateTime createdAt;
  const NoticesTableData(
      {required this.id,
      required this.title,
      required this.content,
      required this.authorId,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    map['author_id'] = Variable<String>(authorId);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  NoticesTableCompanion toCompanion(bool nullToAbsent) {
    return NoticesTableCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
      authorId: Value(authorId),
      createdAt: Value(createdAt),
    );
  }

  factory NoticesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NoticesTableData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      authorId: serializer.fromJson<String>(json['authorId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'authorId': serializer.toJson<String>(authorId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  NoticesTableData copyWith(
          {String? id,
          String? title,
          String? content,
          String? authorId,
          DateTime? createdAt}) =>
      NoticesTableData(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        authorId: authorId ?? this.authorId,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('NoticesTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('authorId: $authorId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, content, authorId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NoticesTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.authorId == this.authorId &&
          other.createdAt == this.createdAt);
}

class NoticesTableCompanion extends UpdateCompanion<NoticesTableData> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> content;
  final Value<String> authorId;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const NoticesTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.authorId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NoticesTableCompanion.insert({
    required String id,
    required String title,
    required String content,
    required String authorId,
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        content = Value(content),
        authorId = Value(authorId);
  static Insertable<NoticesTableData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? content,
    Expression<String>? authorId,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (authorId != null) 'author_id': authorId,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NoticesTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String>? content,
      Value<String>? authorId,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return NoticesTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      authorId: authorId ?? this.authorId,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (authorId.present) {
      map['author_id'] = Variable<String>(authorId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NoticesTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('authorId: $authorId, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $UsersTableTable usersTable = $UsersTableTable(this);
  late final $PropertiesTableTable propertiesTable =
      $PropertiesTableTable(this);
  late final $RentTransactionsTableTable rentTransactionsTable =
      $RentTransactionsTableTable(this);
  late final $MaintenanceTicketsTableTable maintenanceTicketsTable =
      $MaintenanceTicketsTableTable(this);
  late final $NoticesTableTable noticesTable = $NoticesTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        usersTable,
        propertiesTable,
        rentTransactionsTable,
        maintenanceTicketsTable,
        noticesTable
      ];
}
