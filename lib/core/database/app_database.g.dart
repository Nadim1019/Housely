// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $PropertiesTableTable extends PropertiesTable
    with TableInfo<$PropertiesTableTable, Property> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PropertiesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _propertyTypeMeta =
      const VerificationMeta('propertyType');
  @override
  late final GeneratedColumn<String> propertyType = GeneratedColumn<String>(
      'property_type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Apartment'));
  static const VerificationMeta _monthlyRentMeta =
      const VerificationMeta('monthlyRent');
  @override
  late final GeneratedColumn<double> monthlyRent = GeneratedColumn<double>(
      'monthly_rent', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _isOccupiedMeta =
      const VerificationMeta('isOccupied');
  @override
  late final GeneratedColumn<bool> isOccupied = GeneratedColumn<bool>(
      'is_occupied', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_occupied" IN (0, 1))'),
      defaultValue: const Constant(false));
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
      [id, name, address, propertyType, monthlyRent, isOccupied, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'properties_table';
  @override
  VerificationContext validateIntegrity(Insertable<Property> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
    if (data.containsKey('property_type')) {
      context.handle(
          _propertyTypeMeta,
          propertyType.isAcceptableOrUnknown(
              data['property_type']!, _propertyTypeMeta));
    }
    if (data.containsKey('monthly_rent')) {
      context.handle(
          _monthlyRentMeta,
          monthlyRent.isAcceptableOrUnknown(
              data['monthly_rent']!, _monthlyRentMeta));
    } else if (isInserting) {
      context.missing(_monthlyRentMeta);
    }
    if (data.containsKey('is_occupied')) {
      context.handle(
          _isOccupiedMeta,
          isOccupied.isAcceptableOrUnknown(
              data['is_occupied']!, _isOccupiedMeta));
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
  Property map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Property(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address'])!,
      propertyType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}property_type'])!,
      monthlyRent: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}monthly_rent'])!,
      isOccupied: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_occupied'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $PropertiesTableTable createAlias(String alias) {
    return $PropertiesTableTable(attachedDatabase, alias);
  }
}

class Property extends DataClass implements Insertable<Property> {
  final int id;
  final String name;
  final String address;
  final String propertyType;
  final double monthlyRent;
  final bool isOccupied;
  final DateTime createdAt;
  const Property(
      {required this.id,
      required this.name,
      required this.address,
      required this.propertyType,
      required this.monthlyRent,
      required this.isOccupied,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['address'] = Variable<String>(address);
    map['property_type'] = Variable<String>(propertyType);
    map['monthly_rent'] = Variable<double>(monthlyRent);
    map['is_occupied'] = Variable<bool>(isOccupied);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PropertiesTableCompanion toCompanion(bool nullToAbsent) {
    return PropertiesTableCompanion(
      id: Value(id),
      name: Value(name),
      address: Value(address),
      propertyType: Value(propertyType),
      monthlyRent: Value(monthlyRent),
      isOccupied: Value(isOccupied),
      createdAt: Value(createdAt),
    );
  }

  factory Property.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Property(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      address: serializer.fromJson<String>(json['address']),
      propertyType: serializer.fromJson<String>(json['propertyType']),
      monthlyRent: serializer.fromJson<double>(json['monthlyRent']),
      isOccupied: serializer.fromJson<bool>(json['isOccupied']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'address': serializer.toJson<String>(address),
      'propertyType': serializer.toJson<String>(propertyType),
      'monthlyRent': serializer.toJson<double>(monthlyRent),
      'isOccupied': serializer.toJson<bool>(isOccupied),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Property copyWith(
          {int? id,
          String? name,
          String? address,
          String? propertyType,
          double? monthlyRent,
          bool? isOccupied,
          DateTime? createdAt}) =>
      Property(
        id: id ?? this.id,
        name: name ?? this.name,
        address: address ?? this.address,
        propertyType: propertyType ?? this.propertyType,
        monthlyRent: monthlyRent ?? this.monthlyRent,
        isOccupied: isOccupied ?? this.isOccupied,
        createdAt: createdAt ?? this.createdAt,
      );
  Property copyWithCompanion(PropertiesTableCompanion data) {
    return Property(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      address: data.address.present ? data.address.value : this.address,
      propertyType: data.propertyType.present
          ? data.propertyType.value
          : this.propertyType,
      monthlyRent:
          data.monthlyRent.present ? data.monthlyRent.value : this.monthlyRent,
      isOccupied:
          data.isOccupied.present ? data.isOccupied.value : this.isOccupied,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Property(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('propertyType: $propertyType, ')
          ..write('monthlyRent: $monthlyRent, ')
          ..write('isOccupied: $isOccupied, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, address, propertyType, monthlyRent, isOccupied, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Property &&
          other.id == this.id &&
          other.name == this.name &&
          other.address == this.address &&
          other.propertyType == this.propertyType &&
          other.monthlyRent == this.monthlyRent &&
          other.isOccupied == this.isOccupied &&
          other.createdAt == this.createdAt);
}

class PropertiesTableCompanion extends UpdateCompanion<Property> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> address;
  final Value<String> propertyType;
  final Value<double> monthlyRent;
  final Value<bool> isOccupied;
  final Value<DateTime> createdAt;
  const PropertiesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.address = const Value.absent(),
    this.propertyType = const Value.absent(),
    this.monthlyRent = const Value.absent(),
    this.isOccupied = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  PropertiesTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String address,
    this.propertyType = const Value.absent(),
    required double monthlyRent,
    this.isOccupied = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : name = Value(name),
        address = Value(address),
        monthlyRent = Value(monthlyRent);
  static Insertable<Property> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? address,
    Expression<String>? propertyType,
    Expression<double>? monthlyRent,
    Expression<bool>? isOccupied,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (address != null) 'address': address,
      if (propertyType != null) 'property_type': propertyType,
      if (monthlyRent != null) 'monthly_rent': monthlyRent,
      if (isOccupied != null) 'is_occupied': isOccupied,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  PropertiesTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? address,
      Value<String>? propertyType,
      Value<double>? monthlyRent,
      Value<bool>? isOccupied,
      Value<DateTime>? createdAt}) {
    return PropertiesTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      propertyType: propertyType ?? this.propertyType,
      monthlyRent: monthlyRent ?? this.monthlyRent,
      isOccupied: isOccupied ?? this.isOccupied,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (propertyType.present) {
      map['property_type'] = Variable<String>(propertyType.value);
    }
    if (monthlyRent.present) {
      map['monthly_rent'] = Variable<double>(monthlyRent.value);
    }
    if (isOccupied.present) {
      map['is_occupied'] = Variable<bool>(isOccupied.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PropertiesTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('propertyType: $propertyType, ')
          ..write('monthlyRent: $monthlyRent, ')
          ..write('isOccupied: $isOccupied, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $TenantsTableTable extends TenantsTable
    with TableInfo<$TenantsTableTable, Tenant> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TenantsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _propertyIdMeta =
      const VerificationMeta('propertyId');
  @override
  late final GeneratedColumn<int> propertyId = GeneratedColumn<int>(
      'property_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES properties_table (id)'));
  static const VerificationMeta _fullNameMeta =
      const VerificationMeta('fullName');
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
      'full_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
      'phone_number', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 30),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _leaseStartDateMeta =
      const VerificationMeta('leaseStartDate');
  @override
  late final GeneratedColumn<DateTime> leaseStartDate =
      GeneratedColumn<DateTime>('lease_start_date', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _leaseEndDateMeta =
      const VerificationMeta('leaseEndDate');
  @override
  late final GeneratedColumn<DateTime> leaseEndDate = GeneratedColumn<DateTime>(
      'lease_end_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _securityDepositMeta =
      const VerificationMeta('securityDeposit');
  @override
  late final GeneratedColumn<double> securityDeposit = GeneratedColumn<double>(
      'security_deposit', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _emergencyContactMeta =
      const VerificationMeta('emergencyContact');
  @override
  late final GeneratedColumn<String> emergencyContact = GeneratedColumn<String>(
      'emergency_contact', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
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
  List<GeneratedColumn> get $columns => [
        id,
        propertyId,
        fullName,
        phoneNumber,
        leaseStartDate,
        leaseEndDate,
        securityDeposit,
        emergencyContact,
        notes,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tenants_table';
  @override
  VerificationContext validateIntegrity(Insertable<Tenant> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('property_id')) {
      context.handle(
          _propertyIdMeta,
          propertyId.isAcceptableOrUnknown(
              data['property_id']!, _propertyIdMeta));
    } else if (isInserting) {
      context.missing(_propertyIdMeta);
    }
    if (data.containsKey('full_name')) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta));
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number']!, _phoneNumberMeta));
    } else if (isInserting) {
      context.missing(_phoneNumberMeta);
    }
    if (data.containsKey('lease_start_date')) {
      context.handle(
          _leaseStartDateMeta,
          leaseStartDate.isAcceptableOrUnknown(
              data['lease_start_date']!, _leaseStartDateMeta));
    } else if (isInserting) {
      context.missing(_leaseStartDateMeta);
    }
    if (data.containsKey('lease_end_date')) {
      context.handle(
          _leaseEndDateMeta,
          leaseEndDate.isAcceptableOrUnknown(
              data['lease_end_date']!, _leaseEndDateMeta));
    } else if (isInserting) {
      context.missing(_leaseEndDateMeta);
    }
    if (data.containsKey('security_deposit')) {
      context.handle(
          _securityDepositMeta,
          securityDeposit.isAcceptableOrUnknown(
              data['security_deposit']!, _securityDepositMeta));
    }
    if (data.containsKey('emergency_contact')) {
      context.handle(
          _emergencyContactMeta,
          emergencyContact.isAcceptableOrUnknown(
              data['emergency_contact']!, _emergencyContactMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
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
  Tenant map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Tenant(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      propertyId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}property_id'])!,
      fullName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}full_name'])!,
      phoneNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone_number'])!,
      leaseStartDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}lease_start_date'])!,
      leaseEndDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}lease_end_date'])!,
      securityDeposit: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}security_deposit'])!,
      emergencyContact: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}emergency_contact']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $TenantsTableTable createAlias(String alias) {
    return $TenantsTableTable(attachedDatabase, alias);
  }
}

class Tenant extends DataClass implements Insertable<Tenant> {
  /// Unique identifier for the tenant record.
  final int id;

  /// Foreign key pointing to the assigned property unit.
  final int propertyId;

  /// Full legal name of the tenant.
  final String fullName;

  /// Primary phone contact number.
  final String phoneNumber;

  /// Start date of the tenancy lease.
  final DateTime leaseStartDate;

  /// Expiration date of the tenancy lease.
  final DateTime leaseEndDate;

  /// Security deposit amount collected at lease sign-up.
  final double securityDeposit;

  /// Emergency contact phone or details.
  final String? emergencyContact;

  /// Additional notes or special lease terms.
  final String? notes;

  /// Timestamp when tenant was added.
  final DateTime createdAt;
  const Tenant(
      {required this.id,
      required this.propertyId,
      required this.fullName,
      required this.phoneNumber,
      required this.leaseStartDate,
      required this.leaseEndDate,
      required this.securityDeposit,
      this.emergencyContact,
      this.notes,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['property_id'] = Variable<int>(propertyId);
    map['full_name'] = Variable<String>(fullName);
    map['phone_number'] = Variable<String>(phoneNumber);
    map['lease_start_date'] = Variable<DateTime>(leaseStartDate);
    map['lease_end_date'] = Variable<DateTime>(leaseEndDate);
    map['security_deposit'] = Variable<double>(securityDeposit);
    if (!nullToAbsent || emergencyContact != null) {
      map['emergency_contact'] = Variable<String>(emergencyContact);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TenantsTableCompanion toCompanion(bool nullToAbsent) {
    return TenantsTableCompanion(
      id: Value(id),
      propertyId: Value(propertyId),
      fullName: Value(fullName),
      phoneNumber: Value(phoneNumber),
      leaseStartDate: Value(leaseStartDate),
      leaseEndDate: Value(leaseEndDate),
      securityDeposit: Value(securityDeposit),
      emergencyContact: emergencyContact == null && nullToAbsent
          ? const Value.absent()
          : Value(emergencyContact),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory Tenant.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Tenant(
      id: serializer.fromJson<int>(json['id']),
      propertyId: serializer.fromJson<int>(json['propertyId']),
      fullName: serializer.fromJson<String>(json['fullName']),
      phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
      leaseStartDate: serializer.fromJson<DateTime>(json['leaseStartDate']),
      leaseEndDate: serializer.fromJson<DateTime>(json['leaseEndDate']),
      securityDeposit: serializer.fromJson<double>(json['securityDeposit']),
      emergencyContact: serializer.fromJson<String?>(json['emergencyContact']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'propertyId': serializer.toJson<int>(propertyId),
      'fullName': serializer.toJson<String>(fullName),
      'phoneNumber': serializer.toJson<String>(phoneNumber),
      'leaseStartDate': serializer.toJson<DateTime>(leaseStartDate),
      'leaseEndDate': serializer.toJson<DateTime>(leaseEndDate),
      'securityDeposit': serializer.toJson<double>(securityDeposit),
      'emergencyContact': serializer.toJson<String?>(emergencyContact),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Tenant copyWith(
          {int? id,
          int? propertyId,
          String? fullName,
          String? phoneNumber,
          DateTime? leaseStartDate,
          DateTime? leaseEndDate,
          double? securityDeposit,
          Value<String?> emergencyContact = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          DateTime? createdAt}) =>
      Tenant(
        id: id ?? this.id,
        propertyId: propertyId ?? this.propertyId,
        fullName: fullName ?? this.fullName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        leaseStartDate: leaseStartDate ?? this.leaseStartDate,
        leaseEndDate: leaseEndDate ?? this.leaseEndDate,
        securityDeposit: securityDeposit ?? this.securityDeposit,
        emergencyContact: emergencyContact.present
            ? emergencyContact.value
            : this.emergencyContact,
        notes: notes.present ? notes.value : this.notes,
        createdAt: createdAt ?? this.createdAt,
      );
  Tenant copyWithCompanion(TenantsTableCompanion data) {
    return Tenant(
      id: data.id.present ? data.id.value : this.id,
      propertyId:
          data.propertyId.present ? data.propertyId.value : this.propertyId,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      phoneNumber:
          data.phoneNumber.present ? data.phoneNumber.value : this.phoneNumber,
      leaseStartDate: data.leaseStartDate.present
          ? data.leaseStartDate.value
          : this.leaseStartDate,
      leaseEndDate: data.leaseEndDate.present
          ? data.leaseEndDate.value
          : this.leaseEndDate,
      securityDeposit: data.securityDeposit.present
          ? data.securityDeposit.value
          : this.securityDeposit,
      emergencyContact: data.emergencyContact.present
          ? data.emergencyContact.value
          : this.emergencyContact,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Tenant(')
          ..write('id: $id, ')
          ..write('propertyId: $propertyId, ')
          ..write('fullName: $fullName, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('leaseStartDate: $leaseStartDate, ')
          ..write('leaseEndDate: $leaseEndDate, ')
          ..write('securityDeposit: $securityDeposit, ')
          ..write('emergencyContact: $emergencyContact, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      propertyId,
      fullName,
      phoneNumber,
      leaseStartDate,
      leaseEndDate,
      securityDeposit,
      emergencyContact,
      notes,
      createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tenant &&
          other.id == this.id &&
          other.propertyId == this.propertyId &&
          other.fullName == this.fullName &&
          other.phoneNumber == this.phoneNumber &&
          other.leaseStartDate == this.leaseStartDate &&
          other.leaseEndDate == this.leaseEndDate &&
          other.securityDeposit == this.securityDeposit &&
          other.emergencyContact == this.emergencyContact &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class TenantsTableCompanion extends UpdateCompanion<Tenant> {
  final Value<int> id;
  final Value<int> propertyId;
  final Value<String> fullName;
  final Value<String> phoneNumber;
  final Value<DateTime> leaseStartDate;
  final Value<DateTime> leaseEndDate;
  final Value<double> securityDeposit;
  final Value<String?> emergencyContact;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  const TenantsTableCompanion({
    this.id = const Value.absent(),
    this.propertyId = const Value.absent(),
    this.fullName = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.leaseStartDate = const Value.absent(),
    this.leaseEndDate = const Value.absent(),
    this.securityDeposit = const Value.absent(),
    this.emergencyContact = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  TenantsTableCompanion.insert({
    this.id = const Value.absent(),
    required int propertyId,
    required String fullName,
    required String phoneNumber,
    required DateTime leaseStartDate,
    required DateTime leaseEndDate,
    this.securityDeposit = const Value.absent(),
    this.emergencyContact = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : propertyId = Value(propertyId),
        fullName = Value(fullName),
        phoneNumber = Value(phoneNumber),
        leaseStartDate = Value(leaseStartDate),
        leaseEndDate = Value(leaseEndDate);
  static Insertable<Tenant> custom({
    Expression<int>? id,
    Expression<int>? propertyId,
    Expression<String>? fullName,
    Expression<String>? phoneNumber,
    Expression<DateTime>? leaseStartDate,
    Expression<DateTime>? leaseEndDate,
    Expression<double>? securityDeposit,
    Expression<String>? emergencyContact,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (propertyId != null) 'property_id': propertyId,
      if (fullName != null) 'full_name': fullName,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (leaseStartDate != null) 'lease_start_date': leaseStartDate,
      if (leaseEndDate != null) 'lease_end_date': leaseEndDate,
      if (securityDeposit != null) 'security_deposit': securityDeposit,
      if (emergencyContact != null) 'emergency_contact': emergencyContact,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TenantsTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? propertyId,
      Value<String>? fullName,
      Value<String>? phoneNumber,
      Value<DateTime>? leaseStartDate,
      Value<DateTime>? leaseEndDate,
      Value<double>? securityDeposit,
      Value<String?>? emergencyContact,
      Value<String?>? notes,
      Value<DateTime>? createdAt}) {
    return TenantsTableCompanion(
      id: id ?? this.id,
      propertyId: propertyId ?? this.propertyId,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      leaseStartDate: leaseStartDate ?? this.leaseStartDate,
      leaseEndDate: leaseEndDate ?? this.leaseEndDate,
      securityDeposit: securityDeposit ?? this.securityDeposit,
      emergencyContact: emergencyContact ?? this.emergencyContact,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (propertyId.present) {
      map['property_id'] = Variable<int>(propertyId.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (leaseStartDate.present) {
      map['lease_start_date'] = Variable<DateTime>(leaseStartDate.value);
    }
    if (leaseEndDate.present) {
      map['lease_end_date'] = Variable<DateTime>(leaseEndDate.value);
    }
    if (securityDeposit.present) {
      map['security_deposit'] = Variable<double>(securityDeposit.value);
    }
    if (emergencyContact.present) {
      map['emergency_contact'] = Variable<String>(emergencyContact.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TenantsTableCompanion(')
          ..write('id: $id, ')
          ..write('propertyId: $propertyId, ')
          ..write('fullName: $fullName, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('leaseStartDate: $leaseStartDate, ')
          ..write('leaseEndDate: $leaseEndDate, ')
          ..write('securityDeposit: $securityDeposit, ')
          ..write('emergencyContact: $emergencyContact, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $RentLedgerTableTable extends RentLedgerTable
    with TableInfo<$RentLedgerTableTable, RentLedgerRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RentLedgerTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _propertyIdMeta =
      const VerificationMeta('propertyId');
  @override
  late final GeneratedColumn<int> propertyId = GeneratedColumn<int>(
      'property_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES properties_table (id)'));
  static const VerificationMeta _tenantIdMeta =
      const VerificationMeta('tenantId');
  @override
  late final GeneratedColumn<int> tenantId = GeneratedColumn<int>(
      'tenant_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tenants_table (id)'));
  static const VerificationMeta _periodMonthMeta =
      const VerificationMeta('periodMonth');
  @override
  late final GeneratedColumn<String> periodMonth = GeneratedColumn<String>(
      'period_month', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 7, maxTextLength: 7),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _amountDueMeta =
      const VerificationMeta('amountDue');
  @override
  late final GeneratedColumn<double> amountDue = GeneratedColumn<double>(
      'amount_due', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _amountPaidMeta =
      const VerificationMeta('amountPaid');
  @override
  late final GeneratedColumn<double> amountPaid = GeneratedColumn<double>(
      'amount_paid', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Pending'));
  static const VerificationMeta _paymentDateMeta =
      const VerificationMeta('paymentDate');
  @override
  late final GeneratedColumn<DateTime> paymentDate = GeneratedColumn<DateTime>(
      'payment_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _paymentMethodMeta =
      const VerificationMeta('paymentMethod');
  @override
  late final GeneratedColumn<String> paymentMethod = GeneratedColumn<String>(
      'payment_method', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _receiptPathMeta =
      const VerificationMeta('receiptPath');
  @override
  late final GeneratedColumn<String> receiptPath = GeneratedColumn<String>(
      'receipt_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        propertyId,
        tenantId,
        periodMonth,
        amountDue,
        amountPaid,
        status,
        paymentDate,
        paymentMethod,
        receiptPath
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'rent_ledger_table';
  @override
  VerificationContext validateIntegrity(Insertable<RentLedgerRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('property_id')) {
      context.handle(
          _propertyIdMeta,
          propertyId.isAcceptableOrUnknown(
              data['property_id']!, _propertyIdMeta));
    } else if (isInserting) {
      context.missing(_propertyIdMeta);
    }
    if (data.containsKey('tenant_id')) {
      context.handle(_tenantIdMeta,
          tenantId.isAcceptableOrUnknown(data['tenant_id']!, _tenantIdMeta));
    } else if (isInserting) {
      context.missing(_tenantIdMeta);
    }
    if (data.containsKey('period_month')) {
      context.handle(
          _periodMonthMeta,
          periodMonth.isAcceptableOrUnknown(
              data['period_month']!, _periodMonthMeta));
    } else if (isInserting) {
      context.missing(_periodMonthMeta);
    }
    if (data.containsKey('amount_due')) {
      context.handle(_amountDueMeta,
          amountDue.isAcceptableOrUnknown(data['amount_due']!, _amountDueMeta));
    } else if (isInserting) {
      context.missing(_amountDueMeta);
    }
    if (data.containsKey('amount_paid')) {
      context.handle(
          _amountPaidMeta,
          amountPaid.isAcceptableOrUnknown(
              data['amount_paid']!, _amountPaidMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('payment_date')) {
      context.handle(
          _paymentDateMeta,
          paymentDate.isAcceptableOrUnknown(
              data['payment_date']!, _paymentDateMeta));
    }
    if (data.containsKey('payment_method')) {
      context.handle(
          _paymentMethodMeta,
          paymentMethod.isAcceptableOrUnknown(
              data['payment_method']!, _paymentMethodMeta));
    }
    if (data.containsKey('receipt_path')) {
      context.handle(
          _receiptPathMeta,
          receiptPath.isAcceptableOrUnknown(
              data['receipt_path']!, _receiptPathMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RentLedgerRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RentLedgerRecord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      propertyId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}property_id'])!,
      tenantId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tenant_id'])!,
      periodMonth: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}period_month'])!,
      amountDue: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount_due'])!,
      amountPaid: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount_paid'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      paymentDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}payment_date']),
      paymentMethod: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payment_method']),
      receiptPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}receipt_path']),
    );
  }

  @override
  $RentLedgerTableTable createAlias(String alias) {
    return $RentLedgerTableTable(attachedDatabase, alias);
  }
}

class RentLedgerRecord extends DataClass
    implements Insertable<RentLedgerRecord> {
  /// Unique identifier for the rent record entry.
  final int id;

  /// Foreign key linking to the property unit.
  final int propertyId;

  /// Foreign key linking to the associated tenant.
  final int tenantId;

  /// Target year and month for the rent payment (e.g., "2026-07").
  final String periodMonth;

  /// Amount due for the period.
  final double amountDue;

  /// Amount actually paid by tenant.
  final double amountPaid;

  /// Payment status (e.g., 'Paid', 'Pending', 'Overdue').
  final String status;

  /// Actual date when payment was received.
  final DateTime? paymentDate;

  /// Payment channel used (e.g., 'bKash', 'Bank Transfer', 'Cash').
  final String? paymentMethod;

  /// Local path to digital payment receipt or screenshot image.
  final String? receiptPath;
  const RentLedgerRecord(
      {required this.id,
      required this.propertyId,
      required this.tenantId,
      required this.periodMonth,
      required this.amountDue,
      required this.amountPaid,
      required this.status,
      this.paymentDate,
      this.paymentMethod,
      this.receiptPath});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['property_id'] = Variable<int>(propertyId);
    map['tenant_id'] = Variable<int>(tenantId);
    map['period_month'] = Variable<String>(periodMonth);
    map['amount_due'] = Variable<double>(amountDue);
    map['amount_paid'] = Variable<double>(amountPaid);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || paymentDate != null) {
      map['payment_date'] = Variable<DateTime>(paymentDate);
    }
    if (!nullToAbsent || paymentMethod != null) {
      map['payment_method'] = Variable<String>(paymentMethod);
    }
    if (!nullToAbsent || receiptPath != null) {
      map['receipt_path'] = Variable<String>(receiptPath);
    }
    return map;
  }

  RentLedgerTableCompanion toCompanion(bool nullToAbsent) {
    return RentLedgerTableCompanion(
      id: Value(id),
      propertyId: Value(propertyId),
      tenantId: Value(tenantId),
      periodMonth: Value(periodMonth),
      amountDue: Value(amountDue),
      amountPaid: Value(amountPaid),
      status: Value(status),
      paymentDate: paymentDate == null && nullToAbsent
          ? const Value.absent()
          : Value(paymentDate),
      paymentMethod: paymentMethod == null && nullToAbsent
          ? const Value.absent()
          : Value(paymentMethod),
      receiptPath: receiptPath == null && nullToAbsent
          ? const Value.absent()
          : Value(receiptPath),
    );
  }

  factory RentLedgerRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RentLedgerRecord(
      id: serializer.fromJson<int>(json['id']),
      propertyId: serializer.fromJson<int>(json['propertyId']),
      tenantId: serializer.fromJson<int>(json['tenantId']),
      periodMonth: serializer.fromJson<String>(json['periodMonth']),
      amountDue: serializer.fromJson<double>(json['amountDue']),
      amountPaid: serializer.fromJson<double>(json['amountPaid']),
      status: serializer.fromJson<String>(json['status']),
      paymentDate: serializer.fromJson<DateTime?>(json['paymentDate']),
      paymentMethod: serializer.fromJson<String?>(json['paymentMethod']),
      receiptPath: serializer.fromJson<String?>(json['receiptPath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'propertyId': serializer.toJson<int>(propertyId),
      'tenantId': serializer.toJson<int>(tenantId),
      'periodMonth': serializer.toJson<String>(periodMonth),
      'amountDue': serializer.toJson<double>(amountDue),
      'amountPaid': serializer.toJson<double>(amountPaid),
      'status': serializer.toJson<String>(status),
      'paymentDate': serializer.toJson<DateTime?>(paymentDate),
      'paymentMethod': serializer.toJson<String?>(paymentMethod),
      'receiptPath': serializer.toJson<String?>(receiptPath),
    };
  }

  RentLedgerRecord copyWith(
          {int? id,
          int? propertyId,
          int? tenantId,
          String? periodMonth,
          double? amountDue,
          double? amountPaid,
          String? status,
          Value<DateTime?> paymentDate = const Value.absent(),
          Value<String?> paymentMethod = const Value.absent(),
          Value<String?> receiptPath = const Value.absent()}) =>
      RentLedgerRecord(
        id: id ?? this.id,
        propertyId: propertyId ?? this.propertyId,
        tenantId: tenantId ?? this.tenantId,
        periodMonth: periodMonth ?? this.periodMonth,
        amountDue: amountDue ?? this.amountDue,
        amountPaid: amountPaid ?? this.amountPaid,
        status: status ?? this.status,
        paymentDate: paymentDate.present ? paymentDate.value : this.paymentDate,
        paymentMethod:
            paymentMethod.present ? paymentMethod.value : this.paymentMethod,
        receiptPath: receiptPath.present ? receiptPath.value : this.receiptPath,
      );
  RentLedgerRecord copyWithCompanion(RentLedgerTableCompanion data) {
    return RentLedgerRecord(
      id: data.id.present ? data.id.value : this.id,
      propertyId:
          data.propertyId.present ? data.propertyId.value : this.propertyId,
      tenantId: data.tenantId.present ? data.tenantId.value : this.tenantId,
      periodMonth:
          data.periodMonth.present ? data.periodMonth.value : this.periodMonth,
      amountDue: data.amountDue.present ? data.amountDue.value : this.amountDue,
      amountPaid:
          data.amountPaid.present ? data.amountPaid.value : this.amountPaid,
      status: data.status.present ? data.status.value : this.status,
      paymentDate:
          data.paymentDate.present ? data.paymentDate.value : this.paymentDate,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
      receiptPath:
          data.receiptPath.present ? data.receiptPath.value : this.receiptPath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RentLedgerRecord(')
          ..write('id: $id, ')
          ..write('propertyId: $propertyId, ')
          ..write('tenantId: $tenantId, ')
          ..write('periodMonth: $periodMonth, ')
          ..write('amountDue: $amountDue, ')
          ..write('amountPaid: $amountPaid, ')
          ..write('status: $status, ')
          ..write('paymentDate: $paymentDate, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('receiptPath: $receiptPath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, propertyId, tenantId, periodMonth,
      amountDue, amountPaid, status, paymentDate, paymentMethod, receiptPath);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RentLedgerRecord &&
          other.id == this.id &&
          other.propertyId == this.propertyId &&
          other.tenantId == this.tenantId &&
          other.periodMonth == this.periodMonth &&
          other.amountDue == this.amountDue &&
          other.amountPaid == this.amountPaid &&
          other.status == this.status &&
          other.paymentDate == this.paymentDate &&
          other.paymentMethod == this.paymentMethod &&
          other.receiptPath == this.receiptPath);
}

class RentLedgerTableCompanion extends UpdateCompanion<RentLedgerRecord> {
  final Value<int> id;
  final Value<int> propertyId;
  final Value<int> tenantId;
  final Value<String> periodMonth;
  final Value<double> amountDue;
  final Value<double> amountPaid;
  final Value<String> status;
  final Value<DateTime?> paymentDate;
  final Value<String?> paymentMethod;
  final Value<String?> receiptPath;
  const RentLedgerTableCompanion({
    this.id = const Value.absent(),
    this.propertyId = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.periodMonth = const Value.absent(),
    this.amountDue = const Value.absent(),
    this.amountPaid = const Value.absent(),
    this.status = const Value.absent(),
    this.paymentDate = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.receiptPath = const Value.absent(),
  });
  RentLedgerTableCompanion.insert({
    this.id = const Value.absent(),
    required int propertyId,
    required int tenantId,
    required String periodMonth,
    required double amountDue,
    this.amountPaid = const Value.absent(),
    this.status = const Value.absent(),
    this.paymentDate = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.receiptPath = const Value.absent(),
  })  : propertyId = Value(propertyId),
        tenantId = Value(tenantId),
        periodMonth = Value(periodMonth),
        amountDue = Value(amountDue);
  static Insertable<RentLedgerRecord> custom({
    Expression<int>? id,
    Expression<int>? propertyId,
    Expression<int>? tenantId,
    Expression<String>? periodMonth,
    Expression<double>? amountDue,
    Expression<double>? amountPaid,
    Expression<String>? status,
    Expression<DateTime>? paymentDate,
    Expression<String>? paymentMethod,
    Expression<String>? receiptPath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (propertyId != null) 'property_id': propertyId,
      if (tenantId != null) 'tenant_id': tenantId,
      if (periodMonth != null) 'period_month': periodMonth,
      if (amountDue != null) 'amount_due': amountDue,
      if (amountPaid != null) 'amount_paid': amountPaid,
      if (status != null) 'status': status,
      if (paymentDate != null) 'payment_date': paymentDate,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (receiptPath != null) 'receipt_path': receiptPath,
    });
  }

  RentLedgerTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? propertyId,
      Value<int>? tenantId,
      Value<String>? periodMonth,
      Value<double>? amountDue,
      Value<double>? amountPaid,
      Value<String>? status,
      Value<DateTime?>? paymentDate,
      Value<String?>? paymentMethod,
      Value<String?>? receiptPath}) {
    return RentLedgerTableCompanion(
      id: id ?? this.id,
      propertyId: propertyId ?? this.propertyId,
      tenantId: tenantId ?? this.tenantId,
      periodMonth: periodMonth ?? this.periodMonth,
      amountDue: amountDue ?? this.amountDue,
      amountPaid: amountPaid ?? this.amountPaid,
      status: status ?? this.status,
      paymentDate: paymentDate ?? this.paymentDate,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      receiptPath: receiptPath ?? this.receiptPath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (propertyId.present) {
      map['property_id'] = Variable<int>(propertyId.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<int>(tenantId.value);
    }
    if (periodMonth.present) {
      map['period_month'] = Variable<String>(periodMonth.value);
    }
    if (amountDue.present) {
      map['amount_due'] = Variable<double>(amountDue.value);
    }
    if (amountPaid.present) {
      map['amount_paid'] = Variable<double>(amountPaid.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (paymentDate.present) {
      map['payment_date'] = Variable<DateTime>(paymentDate.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    if (receiptPath.present) {
      map['receipt_path'] = Variable<String>(receiptPath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RentLedgerTableCompanion(')
          ..write('id: $id, ')
          ..write('propertyId: $propertyId, ')
          ..write('tenantId: $tenantId, ')
          ..write('periodMonth: $periodMonth, ')
          ..write('amountDue: $amountDue, ')
          ..write('amountPaid: $amountPaid, ')
          ..write('status: $status, ')
          ..write('paymentDate: $paymentDate, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('receiptPath: $receiptPath')
          ..write(')'))
        .toString();
  }
}

class $AssetsTableTable extends AssetsTable
    with TableInfo<$AssetsTableTable, PropertyAsset> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AssetsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _propertyIdMeta =
      const VerificationMeta('propertyId');
  @override
  late final GeneratedColumn<int> propertyId = GeneratedColumn<int>(
      'property_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES properties_table (id)'));
  static const VerificationMeta _assetNameMeta =
      const VerificationMeta('assetName');
  @override
  late final GeneratedColumn<String> assetName = GeneratedColumn<String>(
      'asset_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Appliance'));
  static const VerificationMeta _purchasePriceMeta =
      const VerificationMeta('purchasePrice');
  @override
  late final GeneratedColumn<double> purchasePrice = GeneratedColumn<double>(
      'purchase_price', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _purchaseDateMeta =
      const VerificationMeta('purchaseDate');
  @override
  late final GeneratedColumn<DateTime> purchaseDate = GeneratedColumn<DateTime>(
      'purchase_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _warrantyExpiryMeta =
      const VerificationMeta('warrantyExpiry');
  @override
  late final GeneratedColumn<DateTime> warrantyExpiry =
      GeneratedColumn<DateTime>('warranty_expiry', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _conditionMeta =
      const VerificationMeta('condition');
  @override
  late final GeneratedColumn<String> condition = GeneratedColumn<String>(
      'condition', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Good'));
  static const VerificationMeta _serviceHistoryMeta =
      const VerificationMeta('serviceHistory');
  @override
  late final GeneratedColumn<String> serviceHistory = GeneratedColumn<String>(
      'service_history', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        propertyId,
        assetName,
        category,
        purchasePrice,
        purchaseDate,
        warrantyExpiry,
        condition,
        serviceHistory
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'assets_table';
  @override
  VerificationContext validateIntegrity(Insertable<PropertyAsset> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('property_id')) {
      context.handle(
          _propertyIdMeta,
          propertyId.isAcceptableOrUnknown(
              data['property_id']!, _propertyIdMeta));
    } else if (isInserting) {
      context.missing(_propertyIdMeta);
    }
    if (data.containsKey('asset_name')) {
      context.handle(_assetNameMeta,
          assetName.isAcceptableOrUnknown(data['asset_name']!, _assetNameMeta));
    } else if (isInserting) {
      context.missing(_assetNameMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    }
    if (data.containsKey('purchase_price')) {
      context.handle(
          _purchasePriceMeta,
          purchasePrice.isAcceptableOrUnknown(
              data['purchase_price']!, _purchasePriceMeta));
    }
    if (data.containsKey('purchase_date')) {
      context.handle(
          _purchaseDateMeta,
          purchaseDate.isAcceptableOrUnknown(
              data['purchase_date']!, _purchaseDateMeta));
    }
    if (data.containsKey('warranty_expiry')) {
      context.handle(
          _warrantyExpiryMeta,
          warrantyExpiry.isAcceptableOrUnknown(
              data['warranty_expiry']!, _warrantyExpiryMeta));
    }
    if (data.containsKey('condition')) {
      context.handle(_conditionMeta,
          condition.isAcceptableOrUnknown(data['condition']!, _conditionMeta));
    }
    if (data.containsKey('service_history')) {
      context.handle(
          _serviceHistoryMeta,
          serviceHistory.isAcceptableOrUnknown(
              data['service_history']!, _serviceHistoryMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PropertyAsset map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PropertyAsset(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      propertyId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}property_id'])!,
      assetName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}asset_name'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      purchasePrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}purchase_price']),
      purchaseDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}purchase_date']),
      warrantyExpiry: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}warranty_expiry']),
      condition: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}condition'])!,
      serviceHistory: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}service_history']),
    );
  }

  @override
  $AssetsTableTable createAlias(String alias) {
    return $AssetsTableTable(attachedDatabase, alias);
  }
}

class PropertyAsset extends DataClass implements Insertable<PropertyAsset> {
  /// Unique identifier for the asset item.
  final int id;

  /// Foreign key linking the asset to a specific property unit.
  final int propertyId;

  /// Name of the asset item (e.g., "Inverter AC", "Samsung Fridge").
  final String assetName;

  /// Category classification (e.g., 'Appliance', 'Furniture', 'Electronics').
  final String category;

  /// Estimated current monetary value or purchase cost.
  final double? purchasePrice;

  /// Date when the asset was purchased.
  final DateTime? purchaseDate;

  /// Expiration date for the brand or store warranty.
  final DateTime? warrantyExpiry;

  /// Physical condition state (e.g., 'New', 'Good', 'Needs Repair').
  final String condition;

  /// Historical service, repair, or maintenance logs.
  final String? serviceHistory;
  const PropertyAsset(
      {required this.id,
      required this.propertyId,
      required this.assetName,
      required this.category,
      this.purchasePrice,
      this.purchaseDate,
      this.warrantyExpiry,
      required this.condition,
      this.serviceHistory});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['property_id'] = Variable<int>(propertyId);
    map['asset_name'] = Variable<String>(assetName);
    map['category'] = Variable<String>(category);
    if (!nullToAbsent || purchasePrice != null) {
      map['purchase_price'] = Variable<double>(purchasePrice);
    }
    if (!nullToAbsent || purchaseDate != null) {
      map['purchase_date'] = Variable<DateTime>(purchaseDate);
    }
    if (!nullToAbsent || warrantyExpiry != null) {
      map['warranty_expiry'] = Variable<DateTime>(warrantyExpiry);
    }
    map['condition'] = Variable<String>(condition);
    if (!nullToAbsent || serviceHistory != null) {
      map['service_history'] = Variable<String>(serviceHistory);
    }
    return map;
  }

  AssetsTableCompanion toCompanion(bool nullToAbsent) {
    return AssetsTableCompanion(
      id: Value(id),
      propertyId: Value(propertyId),
      assetName: Value(assetName),
      category: Value(category),
      purchasePrice: purchasePrice == null && nullToAbsent
          ? const Value.absent()
          : Value(purchasePrice),
      purchaseDate: purchaseDate == null && nullToAbsent
          ? const Value.absent()
          : Value(purchaseDate),
      warrantyExpiry: warrantyExpiry == null && nullToAbsent
          ? const Value.absent()
          : Value(warrantyExpiry),
      condition: Value(condition),
      serviceHistory: serviceHistory == null && nullToAbsent
          ? const Value.absent()
          : Value(serviceHistory),
    );
  }

  factory PropertyAsset.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PropertyAsset(
      id: serializer.fromJson<int>(json['id']),
      propertyId: serializer.fromJson<int>(json['propertyId']),
      assetName: serializer.fromJson<String>(json['assetName']),
      category: serializer.fromJson<String>(json['category']),
      purchasePrice: serializer.fromJson<double?>(json['purchasePrice']),
      purchaseDate: serializer.fromJson<DateTime?>(json['purchaseDate']),
      warrantyExpiry: serializer.fromJson<DateTime?>(json['warrantyExpiry']),
      condition: serializer.fromJson<String>(json['condition']),
      serviceHistory: serializer.fromJson<String?>(json['serviceHistory']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'propertyId': serializer.toJson<int>(propertyId),
      'assetName': serializer.toJson<String>(assetName),
      'category': serializer.toJson<String>(category),
      'purchasePrice': serializer.toJson<double?>(purchasePrice),
      'purchaseDate': serializer.toJson<DateTime?>(purchaseDate),
      'warrantyExpiry': serializer.toJson<DateTime?>(warrantyExpiry),
      'condition': serializer.toJson<String>(condition),
      'serviceHistory': serializer.toJson<String?>(serviceHistory),
    };
  }

  PropertyAsset copyWith(
          {int? id,
          int? propertyId,
          String? assetName,
          String? category,
          Value<double?> purchasePrice = const Value.absent(),
          Value<DateTime?> purchaseDate = const Value.absent(),
          Value<DateTime?> warrantyExpiry = const Value.absent(),
          String? condition,
          Value<String?> serviceHistory = const Value.absent()}) =>
      PropertyAsset(
        id: id ?? this.id,
        propertyId: propertyId ?? this.propertyId,
        assetName: assetName ?? this.assetName,
        category: category ?? this.category,
        purchasePrice:
            purchasePrice.present ? purchasePrice.value : this.purchasePrice,
        purchaseDate:
            purchaseDate.present ? purchaseDate.value : this.purchaseDate,
        warrantyExpiry:
            warrantyExpiry.present ? warrantyExpiry.value : this.warrantyExpiry,
        condition: condition ?? this.condition,
        serviceHistory:
            serviceHistory.present ? serviceHistory.value : this.serviceHistory,
      );
  PropertyAsset copyWithCompanion(AssetsTableCompanion data) {
    return PropertyAsset(
      id: data.id.present ? data.id.value : this.id,
      propertyId:
          data.propertyId.present ? data.propertyId.value : this.propertyId,
      assetName: data.assetName.present ? data.assetName.value : this.assetName,
      category: data.category.present ? data.category.value : this.category,
      purchasePrice: data.purchasePrice.present
          ? data.purchasePrice.value
          : this.purchasePrice,
      purchaseDate: data.purchaseDate.present
          ? data.purchaseDate.value
          : this.purchaseDate,
      warrantyExpiry: data.warrantyExpiry.present
          ? data.warrantyExpiry.value
          : this.warrantyExpiry,
      condition: data.condition.present ? data.condition.value : this.condition,
      serviceHistory: data.serviceHistory.present
          ? data.serviceHistory.value
          : this.serviceHistory,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PropertyAsset(')
          ..write('id: $id, ')
          ..write('propertyId: $propertyId, ')
          ..write('assetName: $assetName, ')
          ..write('category: $category, ')
          ..write('purchasePrice: $purchasePrice, ')
          ..write('purchaseDate: $purchaseDate, ')
          ..write('warrantyExpiry: $warrantyExpiry, ')
          ..write('condition: $condition, ')
          ..write('serviceHistory: $serviceHistory')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, propertyId, assetName, category,
      purchasePrice, purchaseDate, warrantyExpiry, condition, serviceHistory);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PropertyAsset &&
          other.id == this.id &&
          other.propertyId == this.propertyId &&
          other.assetName == this.assetName &&
          other.category == this.category &&
          other.purchasePrice == this.purchasePrice &&
          other.purchaseDate == this.purchaseDate &&
          other.warrantyExpiry == this.warrantyExpiry &&
          other.condition == this.condition &&
          other.serviceHistory == this.serviceHistory);
}

class AssetsTableCompanion extends UpdateCompanion<PropertyAsset> {
  final Value<int> id;
  final Value<int> propertyId;
  final Value<String> assetName;
  final Value<String> category;
  final Value<double?> purchasePrice;
  final Value<DateTime?> purchaseDate;
  final Value<DateTime?> warrantyExpiry;
  final Value<String> condition;
  final Value<String?> serviceHistory;
  const AssetsTableCompanion({
    this.id = const Value.absent(),
    this.propertyId = const Value.absent(),
    this.assetName = const Value.absent(),
    this.category = const Value.absent(),
    this.purchasePrice = const Value.absent(),
    this.purchaseDate = const Value.absent(),
    this.warrantyExpiry = const Value.absent(),
    this.condition = const Value.absent(),
    this.serviceHistory = const Value.absent(),
  });
  AssetsTableCompanion.insert({
    this.id = const Value.absent(),
    required int propertyId,
    required String assetName,
    this.category = const Value.absent(),
    this.purchasePrice = const Value.absent(),
    this.purchaseDate = const Value.absent(),
    this.warrantyExpiry = const Value.absent(),
    this.condition = const Value.absent(),
    this.serviceHistory = const Value.absent(),
  })  : propertyId = Value(propertyId),
        assetName = Value(assetName);
  static Insertable<PropertyAsset> custom({
    Expression<int>? id,
    Expression<int>? propertyId,
    Expression<String>? assetName,
    Expression<String>? category,
    Expression<double>? purchasePrice,
    Expression<DateTime>? purchaseDate,
    Expression<DateTime>? warrantyExpiry,
    Expression<String>? condition,
    Expression<String>? serviceHistory,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (propertyId != null) 'property_id': propertyId,
      if (assetName != null) 'asset_name': assetName,
      if (category != null) 'category': category,
      if (purchasePrice != null) 'purchase_price': purchasePrice,
      if (purchaseDate != null) 'purchase_date': purchaseDate,
      if (warrantyExpiry != null) 'warranty_expiry': warrantyExpiry,
      if (condition != null) 'condition': condition,
      if (serviceHistory != null) 'service_history': serviceHistory,
    });
  }

  AssetsTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? propertyId,
      Value<String>? assetName,
      Value<String>? category,
      Value<double?>? purchasePrice,
      Value<DateTime?>? purchaseDate,
      Value<DateTime?>? warrantyExpiry,
      Value<String>? condition,
      Value<String?>? serviceHistory}) {
    return AssetsTableCompanion(
      id: id ?? this.id,
      propertyId: propertyId ?? this.propertyId,
      assetName: assetName ?? this.assetName,
      category: category ?? this.category,
      purchasePrice: purchasePrice ?? this.purchasePrice,
      purchaseDate: purchaseDate ?? this.purchaseDate,
      warrantyExpiry: warrantyExpiry ?? this.warrantyExpiry,
      condition: condition ?? this.condition,
      serviceHistory: serviceHistory ?? this.serviceHistory,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (propertyId.present) {
      map['property_id'] = Variable<int>(propertyId.value);
    }
    if (assetName.present) {
      map['asset_name'] = Variable<String>(assetName.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (purchasePrice.present) {
      map['purchase_price'] = Variable<double>(purchasePrice.value);
    }
    if (purchaseDate.present) {
      map['purchase_date'] = Variable<DateTime>(purchaseDate.value);
    }
    if (warrantyExpiry.present) {
      map['warranty_expiry'] = Variable<DateTime>(warrantyExpiry.value);
    }
    if (condition.present) {
      map['condition'] = Variable<String>(condition.value);
    }
    if (serviceHistory.present) {
      map['service_history'] = Variable<String>(serviceHistory.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AssetsTableCompanion(')
          ..write('id: $id, ')
          ..write('propertyId: $propertyId, ')
          ..write('assetName: $assetName, ')
          ..write('category: $category, ')
          ..write('purchasePrice: $purchasePrice, ')
          ..write('purchaseDate: $purchaseDate, ')
          ..write('warrantyExpiry: $warrantyExpiry, ')
          ..write('condition: $condition, ')
          ..write('serviceHistory: $serviceHistory')
          ..write(')'))
        .toString();
  }
}

class $MaintenanceTableTable extends MaintenanceTable
    with TableInfo<$MaintenanceTableTable, MaintenanceRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MaintenanceTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _propertyIdMeta =
      const VerificationMeta('propertyId');
  @override
  late final GeneratedColumn<int> propertyId = GeneratedColumn<int>(
      'property_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES properties_table (id)'));
  static const VerificationMeta _problemDescriptionMeta =
      const VerificationMeta('problemDescription');
  @override
  late final GeneratedColumn<String> problemDescription =
      GeneratedColumn<String>('problem_description', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
            minTextLength: 1,
          ),
          type: DriftSqlType.string,
          requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Pending'));
  static const VerificationMeta _costMeta = const VerificationMeta('cost');
  @override
  late final GeneratedColumn<double> cost = GeneratedColumn<double>(
      'cost', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _technicianInfoMeta =
      const VerificationMeta('technicianInfo');
  @override
  late final GeneratedColumn<String> technicianInfo = GeneratedColumn<String>(
      'technician_info', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _requestDateMeta =
      const VerificationMeta('requestDate');
  @override
  late final GeneratedColumn<DateTime> requestDate = GeneratedColumn<DateTime>(
      'request_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _completionDateMeta =
      const VerificationMeta('completionDate');
  @override
  late final GeneratedColumn<DateTime> completionDate =
      GeneratedColumn<DateTime>('completion_date', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _invoicePathMeta =
      const VerificationMeta('invoicePath');
  @override
  late final GeneratedColumn<String> invoicePath = GeneratedColumn<String>(
      'invoice_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        propertyId,
        problemDescription,
        status,
        cost,
        technicianInfo,
        requestDate,
        completionDate,
        invoicePath
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'maintenance_table';
  @override
  VerificationContext validateIntegrity(Insertable<MaintenanceRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('property_id')) {
      context.handle(
          _propertyIdMeta,
          propertyId.isAcceptableOrUnknown(
              data['property_id']!, _propertyIdMeta));
    } else if (isInserting) {
      context.missing(_propertyIdMeta);
    }
    if (data.containsKey('problem_description')) {
      context.handle(
          _problemDescriptionMeta,
          problemDescription.isAcceptableOrUnknown(
              data['problem_description']!, _problemDescriptionMeta));
    } else if (isInserting) {
      context.missing(_problemDescriptionMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('cost')) {
      context.handle(
          _costMeta, cost.isAcceptableOrUnknown(data['cost']!, _costMeta));
    }
    if (data.containsKey('technician_info')) {
      context.handle(
          _technicianInfoMeta,
          technicianInfo.isAcceptableOrUnknown(
              data['technician_info']!, _technicianInfoMeta));
    }
    if (data.containsKey('request_date')) {
      context.handle(
          _requestDateMeta,
          requestDate.isAcceptableOrUnknown(
              data['request_date']!, _requestDateMeta));
    }
    if (data.containsKey('completion_date')) {
      context.handle(
          _completionDateMeta,
          completionDate.isAcceptableOrUnknown(
              data['completion_date']!, _completionDateMeta));
    }
    if (data.containsKey('invoice_path')) {
      context.handle(
          _invoicePathMeta,
          invoicePath.isAcceptableOrUnknown(
              data['invoice_path']!, _invoicePathMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MaintenanceRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MaintenanceRecord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      propertyId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}property_id'])!,
      problemDescription: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}problem_description'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      cost: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}cost'])!,
      technicianInfo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}technician_info']),
      requestDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}request_date'])!,
      completionDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}completion_date']),
      invoicePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}invoice_path']),
    );
  }

  @override
  $MaintenanceTableTable createAlias(String alias) {
    return $MaintenanceTableTable(attachedDatabase, alias);
  }
}

class MaintenanceRecord extends DataClass
    implements Insertable<MaintenanceRecord> {
  /// Unique identifier for the maintenance task.
  final int id;

  /// Foreign key linking the repair record to a specific property unit.
  final int propertyId;

  /// Detailed description of the problem or repair request.
  final String problemDescription;

  /// Repair status (e.g., 'Pending', 'In Progress', 'Completed').
  final String status;

  /// Total cost incurred for the repair service.
  final double cost;

  /// Contact or company name of the technician performing work.
  final String? technicianInfo;

  /// Date when the repair was requested or reported.
  final DateTime requestDate;

  /// Date when the repair task was fully resolved.
  final DateTime? completionDate;

  /// Local path to receipt or repair invoice image.
  final String? invoicePath;
  const MaintenanceRecord(
      {required this.id,
      required this.propertyId,
      required this.problemDescription,
      required this.status,
      required this.cost,
      this.technicianInfo,
      required this.requestDate,
      this.completionDate,
      this.invoicePath});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['property_id'] = Variable<int>(propertyId);
    map['problem_description'] = Variable<String>(problemDescription);
    map['status'] = Variable<String>(status);
    map['cost'] = Variable<double>(cost);
    if (!nullToAbsent || technicianInfo != null) {
      map['technician_info'] = Variable<String>(technicianInfo);
    }
    map['request_date'] = Variable<DateTime>(requestDate);
    if (!nullToAbsent || completionDate != null) {
      map['completion_date'] = Variable<DateTime>(completionDate);
    }
    if (!nullToAbsent || invoicePath != null) {
      map['invoice_path'] = Variable<String>(invoicePath);
    }
    return map;
  }

  MaintenanceTableCompanion toCompanion(bool nullToAbsent) {
    return MaintenanceTableCompanion(
      id: Value(id),
      propertyId: Value(propertyId),
      problemDescription: Value(problemDescription),
      status: Value(status),
      cost: Value(cost),
      technicianInfo: technicianInfo == null && nullToAbsent
          ? const Value.absent()
          : Value(technicianInfo),
      requestDate: Value(requestDate),
      completionDate: completionDate == null && nullToAbsent
          ? const Value.absent()
          : Value(completionDate),
      invoicePath: invoicePath == null && nullToAbsent
          ? const Value.absent()
          : Value(invoicePath),
    );
  }

  factory MaintenanceRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MaintenanceRecord(
      id: serializer.fromJson<int>(json['id']),
      propertyId: serializer.fromJson<int>(json['propertyId']),
      problemDescription:
          serializer.fromJson<String>(json['problemDescription']),
      status: serializer.fromJson<String>(json['status']),
      cost: serializer.fromJson<double>(json['cost']),
      technicianInfo: serializer.fromJson<String?>(json['technicianInfo']),
      requestDate: serializer.fromJson<DateTime>(json['requestDate']),
      completionDate: serializer.fromJson<DateTime?>(json['completionDate']),
      invoicePath: serializer.fromJson<String?>(json['invoicePath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'propertyId': serializer.toJson<int>(propertyId),
      'problemDescription': serializer.toJson<String>(problemDescription),
      'status': serializer.toJson<String>(status),
      'cost': serializer.toJson<double>(cost),
      'technicianInfo': serializer.toJson<String?>(technicianInfo),
      'requestDate': serializer.toJson<DateTime>(requestDate),
      'completionDate': serializer.toJson<DateTime?>(completionDate),
      'invoicePath': serializer.toJson<String?>(invoicePath),
    };
  }

  MaintenanceRecord copyWith(
          {int? id,
          int? propertyId,
          String? problemDescription,
          String? status,
          double? cost,
          Value<String?> technicianInfo = const Value.absent(),
          DateTime? requestDate,
          Value<DateTime?> completionDate = const Value.absent(),
          Value<String?> invoicePath = const Value.absent()}) =>
      MaintenanceRecord(
        id: id ?? this.id,
        propertyId: propertyId ?? this.propertyId,
        problemDescription: problemDescription ?? this.problemDescription,
        status: status ?? this.status,
        cost: cost ?? this.cost,
        technicianInfo:
            technicianInfo.present ? technicianInfo.value : this.technicianInfo,
        requestDate: requestDate ?? this.requestDate,
        completionDate:
            completionDate.present ? completionDate.value : this.completionDate,
        invoicePath: invoicePath.present ? invoicePath.value : this.invoicePath,
      );
  MaintenanceRecord copyWithCompanion(MaintenanceTableCompanion data) {
    return MaintenanceRecord(
      id: data.id.present ? data.id.value : this.id,
      propertyId:
          data.propertyId.present ? data.propertyId.value : this.propertyId,
      problemDescription: data.problemDescription.present
          ? data.problemDescription.value
          : this.problemDescription,
      status: data.status.present ? data.status.value : this.status,
      cost: data.cost.present ? data.cost.value : this.cost,
      technicianInfo: data.technicianInfo.present
          ? data.technicianInfo.value
          : this.technicianInfo,
      requestDate:
          data.requestDate.present ? data.requestDate.value : this.requestDate,
      completionDate: data.completionDate.present
          ? data.completionDate.value
          : this.completionDate,
      invoicePath:
          data.invoicePath.present ? data.invoicePath.value : this.invoicePath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MaintenanceRecord(')
          ..write('id: $id, ')
          ..write('propertyId: $propertyId, ')
          ..write('problemDescription: $problemDescription, ')
          ..write('status: $status, ')
          ..write('cost: $cost, ')
          ..write('technicianInfo: $technicianInfo, ')
          ..write('requestDate: $requestDate, ')
          ..write('completionDate: $completionDate, ')
          ..write('invoicePath: $invoicePath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, propertyId, problemDescription, status,
      cost, technicianInfo, requestDate, completionDate, invoicePath);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MaintenanceRecord &&
          other.id == this.id &&
          other.propertyId == this.propertyId &&
          other.problemDescription == this.problemDescription &&
          other.status == this.status &&
          other.cost == this.cost &&
          other.technicianInfo == this.technicianInfo &&
          other.requestDate == this.requestDate &&
          other.completionDate == this.completionDate &&
          other.invoicePath == this.invoicePath);
}

class MaintenanceTableCompanion extends UpdateCompanion<MaintenanceRecord> {
  final Value<int> id;
  final Value<int> propertyId;
  final Value<String> problemDescription;
  final Value<String> status;
  final Value<double> cost;
  final Value<String?> technicianInfo;
  final Value<DateTime> requestDate;
  final Value<DateTime?> completionDate;
  final Value<String?> invoicePath;
  const MaintenanceTableCompanion({
    this.id = const Value.absent(),
    this.propertyId = const Value.absent(),
    this.problemDescription = const Value.absent(),
    this.status = const Value.absent(),
    this.cost = const Value.absent(),
    this.technicianInfo = const Value.absent(),
    this.requestDate = const Value.absent(),
    this.completionDate = const Value.absent(),
    this.invoicePath = const Value.absent(),
  });
  MaintenanceTableCompanion.insert({
    this.id = const Value.absent(),
    required int propertyId,
    required String problemDescription,
    this.status = const Value.absent(),
    this.cost = const Value.absent(),
    this.technicianInfo = const Value.absent(),
    this.requestDate = const Value.absent(),
    this.completionDate = const Value.absent(),
    this.invoicePath = const Value.absent(),
  })  : propertyId = Value(propertyId),
        problemDescription = Value(problemDescription);
  static Insertable<MaintenanceRecord> custom({
    Expression<int>? id,
    Expression<int>? propertyId,
    Expression<String>? problemDescription,
    Expression<String>? status,
    Expression<double>? cost,
    Expression<String>? technicianInfo,
    Expression<DateTime>? requestDate,
    Expression<DateTime>? completionDate,
    Expression<String>? invoicePath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (propertyId != null) 'property_id': propertyId,
      if (problemDescription != null) 'problem_description': problemDescription,
      if (status != null) 'status': status,
      if (cost != null) 'cost': cost,
      if (technicianInfo != null) 'technician_info': technicianInfo,
      if (requestDate != null) 'request_date': requestDate,
      if (completionDate != null) 'completion_date': completionDate,
      if (invoicePath != null) 'invoice_path': invoicePath,
    });
  }

  MaintenanceTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? propertyId,
      Value<String>? problemDescription,
      Value<String>? status,
      Value<double>? cost,
      Value<String?>? technicianInfo,
      Value<DateTime>? requestDate,
      Value<DateTime?>? completionDate,
      Value<String?>? invoicePath}) {
    return MaintenanceTableCompanion(
      id: id ?? this.id,
      propertyId: propertyId ?? this.propertyId,
      problemDescription: problemDescription ?? this.problemDescription,
      status: status ?? this.status,
      cost: cost ?? this.cost,
      technicianInfo: technicianInfo ?? this.technicianInfo,
      requestDate: requestDate ?? this.requestDate,
      completionDate: completionDate ?? this.completionDate,
      invoicePath: invoicePath ?? this.invoicePath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (propertyId.present) {
      map['property_id'] = Variable<int>(propertyId.value);
    }
    if (problemDescription.present) {
      map['problem_description'] = Variable<String>(problemDescription.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (cost.present) {
      map['cost'] = Variable<double>(cost.value);
    }
    if (technicianInfo.present) {
      map['technician_info'] = Variable<String>(technicianInfo.value);
    }
    if (requestDate.present) {
      map['request_date'] = Variable<DateTime>(requestDate.value);
    }
    if (completionDate.present) {
      map['completion_date'] = Variable<DateTime>(completionDate.value);
    }
    if (invoicePath.present) {
      map['invoice_path'] = Variable<String>(invoicePath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MaintenanceTableCompanion(')
          ..write('id: $id, ')
          ..write('propertyId: $propertyId, ')
          ..write('problemDescription: $problemDescription, ')
          ..write('status: $status, ')
          ..write('cost: $cost, ')
          ..write('technicianInfo: $technicianInfo, ')
          ..write('requestDate: $requestDate, ')
          ..write('completionDate: $completionDate, ')
          ..write('invoicePath: $invoicePath')
          ..write(')'))
        .toString();
  }
}

class $ExpensesTableTable extends ExpensesTable
    with TableInfo<$ExpensesTableTable, PropertyExpense> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExpensesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _propertyIdMeta =
      const VerificationMeta('propertyId');
  @override
  late final GeneratedColumn<int> propertyId = GeneratedColumn<int>(
      'property_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES properties_table (id)'));
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _expenseDateMeta =
      const VerificationMeta('expenseDate');
  @override
  late final GeneratedColumn<DateTime> expenseDate = GeneratedColumn<DateTime>(
      'expense_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _receiptPathMeta =
      const VerificationMeta('receiptPath');
  @override
  late final GeneratedColumn<String> receiptPath = GeneratedColumn<String>(
      'receipt_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, propertyId, category, amount, expenseDate, description, receiptPath];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'expenses_table';
  @override
  VerificationContext validateIntegrity(Insertable<PropertyExpense> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('property_id')) {
      context.handle(
          _propertyIdMeta,
          propertyId.isAcceptableOrUnknown(
              data['property_id']!, _propertyIdMeta));
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('expense_date')) {
      context.handle(
          _expenseDateMeta,
          expenseDate.isAcceptableOrUnknown(
              data['expense_date']!, _expenseDateMeta));
    } else if (isInserting) {
      context.missing(_expenseDateMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('receipt_path')) {
      context.handle(
          _receiptPathMeta,
          receiptPath.isAcceptableOrUnknown(
              data['receipt_path']!, _receiptPathMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PropertyExpense map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PropertyExpense(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      propertyId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}property_id']),
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      expenseDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}expense_date'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      receiptPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}receipt_path']),
    );
  }

  @override
  $ExpensesTableTable createAlias(String alias) {
    return $ExpensesTableTable(attachedDatabase, alias);
  }
}

class PropertyExpense extends DataClass implements Insertable<PropertyExpense> {
  /// Unique identifier for the expense entry.
  final int id;

  /// Optional foreign key linking to a unit (null for whole building).
  final int? propertyId;

  /// Expense category (e.g., 'Cleaning', 'Security', 'Taxes', 'Utilities').
  final String category;

  /// Amount spent on this expense item.
  final double amount;

  /// Date when the expense was incurred.
  final DateTime expenseDate;

  /// Brief explanation or vendor details for the expense.
  final String? description;

  /// Local path to physical receipt photo or digital document.
  final String? receiptPath;
  const PropertyExpense(
      {required this.id,
      this.propertyId,
      required this.category,
      required this.amount,
      required this.expenseDate,
      this.description,
      this.receiptPath});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || propertyId != null) {
      map['property_id'] = Variable<int>(propertyId);
    }
    map['category'] = Variable<String>(category);
    map['amount'] = Variable<double>(amount);
    map['expense_date'] = Variable<DateTime>(expenseDate);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || receiptPath != null) {
      map['receipt_path'] = Variable<String>(receiptPath);
    }
    return map;
  }

  ExpensesTableCompanion toCompanion(bool nullToAbsent) {
    return ExpensesTableCompanion(
      id: Value(id),
      propertyId: propertyId == null && nullToAbsent
          ? const Value.absent()
          : Value(propertyId),
      category: Value(category),
      amount: Value(amount),
      expenseDate: Value(expenseDate),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      receiptPath: receiptPath == null && nullToAbsent
          ? const Value.absent()
          : Value(receiptPath),
    );
  }

  factory PropertyExpense.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PropertyExpense(
      id: serializer.fromJson<int>(json['id']),
      propertyId: serializer.fromJson<int?>(json['propertyId']),
      category: serializer.fromJson<String>(json['category']),
      amount: serializer.fromJson<double>(json['amount']),
      expenseDate: serializer.fromJson<DateTime>(json['expenseDate']),
      description: serializer.fromJson<String?>(json['description']),
      receiptPath: serializer.fromJson<String?>(json['receiptPath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'propertyId': serializer.toJson<int?>(propertyId),
      'category': serializer.toJson<String>(category),
      'amount': serializer.toJson<double>(amount),
      'expenseDate': serializer.toJson<DateTime>(expenseDate),
      'description': serializer.toJson<String?>(description),
      'receiptPath': serializer.toJson<String?>(receiptPath),
    };
  }

  PropertyExpense copyWith(
          {int? id,
          Value<int?> propertyId = const Value.absent(),
          String? category,
          double? amount,
          DateTime? expenseDate,
          Value<String?> description = const Value.absent(),
          Value<String?> receiptPath = const Value.absent()}) =>
      PropertyExpense(
        id: id ?? this.id,
        propertyId: propertyId.present ? propertyId.value : this.propertyId,
        category: category ?? this.category,
        amount: amount ?? this.amount,
        expenseDate: expenseDate ?? this.expenseDate,
        description: description.present ? description.value : this.description,
        receiptPath: receiptPath.present ? receiptPath.value : this.receiptPath,
      );
  PropertyExpense copyWithCompanion(ExpensesTableCompanion data) {
    return PropertyExpense(
      id: data.id.present ? data.id.value : this.id,
      propertyId:
          data.propertyId.present ? data.propertyId.value : this.propertyId,
      category: data.category.present ? data.category.value : this.category,
      amount: data.amount.present ? data.amount.value : this.amount,
      expenseDate:
          data.expenseDate.present ? data.expenseDate.value : this.expenseDate,
      description:
          data.description.present ? data.description.value : this.description,
      receiptPath:
          data.receiptPath.present ? data.receiptPath.value : this.receiptPath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PropertyExpense(')
          ..write('id: $id, ')
          ..write('propertyId: $propertyId, ')
          ..write('category: $category, ')
          ..write('amount: $amount, ')
          ..write('expenseDate: $expenseDate, ')
          ..write('description: $description, ')
          ..write('receiptPath: $receiptPath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, propertyId, category, amount, expenseDate, description, receiptPath);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PropertyExpense &&
          other.id == this.id &&
          other.propertyId == this.propertyId &&
          other.category == this.category &&
          other.amount == this.amount &&
          other.expenseDate == this.expenseDate &&
          other.description == this.description &&
          other.receiptPath == this.receiptPath);
}

class ExpensesTableCompanion extends UpdateCompanion<PropertyExpense> {
  final Value<int> id;
  final Value<int?> propertyId;
  final Value<String> category;
  final Value<double> amount;
  final Value<DateTime> expenseDate;
  final Value<String?> description;
  final Value<String?> receiptPath;
  const ExpensesTableCompanion({
    this.id = const Value.absent(),
    this.propertyId = const Value.absent(),
    this.category = const Value.absent(),
    this.amount = const Value.absent(),
    this.expenseDate = const Value.absent(),
    this.description = const Value.absent(),
    this.receiptPath = const Value.absent(),
  });
  ExpensesTableCompanion.insert({
    this.id = const Value.absent(),
    this.propertyId = const Value.absent(),
    required String category,
    required double amount,
    required DateTime expenseDate,
    this.description = const Value.absent(),
    this.receiptPath = const Value.absent(),
  })  : category = Value(category),
        amount = Value(amount),
        expenseDate = Value(expenseDate);
  static Insertable<PropertyExpense> custom({
    Expression<int>? id,
    Expression<int>? propertyId,
    Expression<String>? category,
    Expression<double>? amount,
    Expression<DateTime>? expenseDate,
    Expression<String>? description,
    Expression<String>? receiptPath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (propertyId != null) 'property_id': propertyId,
      if (category != null) 'category': category,
      if (amount != null) 'amount': amount,
      if (expenseDate != null) 'expense_date': expenseDate,
      if (description != null) 'description': description,
      if (receiptPath != null) 'receipt_path': receiptPath,
    });
  }

  ExpensesTableCompanion copyWith(
      {Value<int>? id,
      Value<int?>? propertyId,
      Value<String>? category,
      Value<double>? amount,
      Value<DateTime>? expenseDate,
      Value<String?>? description,
      Value<String?>? receiptPath}) {
    return ExpensesTableCompanion(
      id: id ?? this.id,
      propertyId: propertyId ?? this.propertyId,
      category: category ?? this.category,
      amount: amount ?? this.amount,
      expenseDate: expenseDate ?? this.expenseDate,
      description: description ?? this.description,
      receiptPath: receiptPath ?? this.receiptPath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (propertyId.present) {
      map['property_id'] = Variable<int>(propertyId.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (expenseDate.present) {
      map['expense_date'] = Variable<DateTime>(expenseDate.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (receiptPath.present) {
      map['receipt_path'] = Variable<String>(receiptPath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExpensesTableCompanion(')
          ..write('id: $id, ')
          ..write('propertyId: $propertyId, ')
          ..write('category: $category, ')
          ..write('amount: $amount, ')
          ..write('expenseDate: $expenseDate, ')
          ..write('description: $description, ')
          ..write('receiptPath: $receiptPath')
          ..write(')'))
        .toString();
  }
}

class $TenantHistoryTableTable extends TenantHistoryTable
    with TableInfo<$TenantHistoryTableTable, TenantHistory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TenantHistoryTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _propertyIdMeta =
      const VerificationMeta('propertyId');
  @override
  late final GeneratedColumn<int> propertyId = GeneratedColumn<int>(
      'property_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES properties_table (id)'));
  static const VerificationMeta _tenantNameMeta =
      const VerificationMeta('tenantName');
  @override
  late final GeneratedColumn<String> tenantName = GeneratedColumn<String>(
      'tenant_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _moveInDateMeta =
      const VerificationMeta('moveInDate');
  @override
  late final GeneratedColumn<DateTime> moveInDate = GeneratedColumn<DateTime>(
      'move_in_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _moveOutDateMeta =
      const VerificationMeta('moveOutDate');
  @override
  late final GeneratedColumn<DateTime> moveOutDate = GeneratedColumn<DateTime>(
      'move_out_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _depositReturnedMeta =
      const VerificationMeta('depositReturned');
  @override
  late final GeneratedColumn<double> depositReturned = GeneratedColumn<double>(
      'deposit_returned', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _departureNotesMeta =
      const VerificationMeta('departureNotes');
  @override
  late final GeneratedColumn<String> departureNotes = GeneratedColumn<String>(
      'departure_notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        propertyId,
        tenantName,
        moveInDate,
        moveOutDate,
        depositReturned,
        departureNotes
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tenant_history_table';
  @override
  VerificationContext validateIntegrity(Insertable<TenantHistory> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('property_id')) {
      context.handle(
          _propertyIdMeta,
          propertyId.isAcceptableOrUnknown(
              data['property_id']!, _propertyIdMeta));
    } else if (isInserting) {
      context.missing(_propertyIdMeta);
    }
    if (data.containsKey('tenant_name')) {
      context.handle(
          _tenantNameMeta,
          tenantName.isAcceptableOrUnknown(
              data['tenant_name']!, _tenantNameMeta));
    } else if (isInserting) {
      context.missing(_tenantNameMeta);
    }
    if (data.containsKey('move_in_date')) {
      context.handle(
          _moveInDateMeta,
          moveInDate.isAcceptableOrUnknown(
              data['move_in_date']!, _moveInDateMeta));
    } else if (isInserting) {
      context.missing(_moveInDateMeta);
    }
    if (data.containsKey('move_out_date')) {
      context.handle(
          _moveOutDateMeta,
          moveOutDate.isAcceptableOrUnknown(
              data['move_out_date']!, _moveOutDateMeta));
    } else if (isInserting) {
      context.missing(_moveOutDateMeta);
    }
    if (data.containsKey('deposit_returned')) {
      context.handle(
          _depositReturnedMeta,
          depositReturned.isAcceptableOrUnknown(
              data['deposit_returned']!, _depositReturnedMeta));
    }
    if (data.containsKey('departure_notes')) {
      context.handle(
          _departureNotesMeta,
          departureNotes.isAcceptableOrUnknown(
              data['departure_notes']!, _departureNotesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TenantHistory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TenantHistory(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      propertyId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}property_id'])!,
      tenantName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tenant_name'])!,
      moveInDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}move_in_date'])!,
      moveOutDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}move_out_date'])!,
      depositReturned: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}deposit_returned'])!,
      departureNotes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}departure_notes']),
    );
  }

  @override
  $TenantHistoryTableTable createAlias(String alias) {
    return $TenantHistoryTableTable(attachedDatabase, alias);
  }
}

class TenantHistory extends DataClass implements Insertable<TenantHistory> {
  /// Unique identifier for the historical tenancy record.
  final int id;

  /// Foreign key linking the history record to the target property unit.
  final int propertyId;

  /// Full name of the former tenant.
  final String tenantName;

  /// Date when the tenancy officially started.
  final DateTime moveInDate;

  /// Date when the tenant vacated the property.
  final DateTime moveOutDate;

  /// Security deposit amount settled or refunded upon departure.
  final double depositReturned;

  /// Additional departure notes, tenancy summary, or checkout condition.
  final String? departureNotes;
  const TenantHistory(
      {required this.id,
      required this.propertyId,
      required this.tenantName,
      required this.moveInDate,
      required this.moveOutDate,
      required this.depositReturned,
      this.departureNotes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['property_id'] = Variable<int>(propertyId);
    map['tenant_name'] = Variable<String>(tenantName);
    map['move_in_date'] = Variable<DateTime>(moveInDate);
    map['move_out_date'] = Variable<DateTime>(moveOutDate);
    map['deposit_returned'] = Variable<double>(depositReturned);
    if (!nullToAbsent || departureNotes != null) {
      map['departure_notes'] = Variable<String>(departureNotes);
    }
    return map;
  }

  TenantHistoryTableCompanion toCompanion(bool nullToAbsent) {
    return TenantHistoryTableCompanion(
      id: Value(id),
      propertyId: Value(propertyId),
      tenantName: Value(tenantName),
      moveInDate: Value(moveInDate),
      moveOutDate: Value(moveOutDate),
      depositReturned: Value(depositReturned),
      departureNotes: departureNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(departureNotes),
    );
  }

  factory TenantHistory.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TenantHistory(
      id: serializer.fromJson<int>(json['id']),
      propertyId: serializer.fromJson<int>(json['propertyId']),
      tenantName: serializer.fromJson<String>(json['tenantName']),
      moveInDate: serializer.fromJson<DateTime>(json['moveInDate']),
      moveOutDate: serializer.fromJson<DateTime>(json['moveOutDate']),
      depositReturned: serializer.fromJson<double>(json['depositReturned']),
      departureNotes: serializer.fromJson<String?>(json['departureNotes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'propertyId': serializer.toJson<int>(propertyId),
      'tenantName': serializer.toJson<String>(tenantName),
      'moveInDate': serializer.toJson<DateTime>(moveInDate),
      'moveOutDate': serializer.toJson<DateTime>(moveOutDate),
      'depositReturned': serializer.toJson<double>(depositReturned),
      'departureNotes': serializer.toJson<String?>(departureNotes),
    };
  }

  TenantHistory copyWith(
          {int? id,
          int? propertyId,
          String? tenantName,
          DateTime? moveInDate,
          DateTime? moveOutDate,
          double? depositReturned,
          Value<String?> departureNotes = const Value.absent()}) =>
      TenantHistory(
        id: id ?? this.id,
        propertyId: propertyId ?? this.propertyId,
        tenantName: tenantName ?? this.tenantName,
        moveInDate: moveInDate ?? this.moveInDate,
        moveOutDate: moveOutDate ?? this.moveOutDate,
        depositReturned: depositReturned ?? this.depositReturned,
        departureNotes:
            departureNotes.present ? departureNotes.value : this.departureNotes,
      );
  TenantHistory copyWithCompanion(TenantHistoryTableCompanion data) {
    return TenantHistory(
      id: data.id.present ? data.id.value : this.id,
      propertyId:
          data.propertyId.present ? data.propertyId.value : this.propertyId,
      tenantName:
          data.tenantName.present ? data.tenantName.value : this.tenantName,
      moveInDate:
          data.moveInDate.present ? data.moveInDate.value : this.moveInDate,
      moveOutDate:
          data.moveOutDate.present ? data.moveOutDate.value : this.moveOutDate,
      depositReturned: data.depositReturned.present
          ? data.depositReturned.value
          : this.depositReturned,
      departureNotes: data.departureNotes.present
          ? data.departureNotes.value
          : this.departureNotes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TenantHistory(')
          ..write('id: $id, ')
          ..write('propertyId: $propertyId, ')
          ..write('tenantName: $tenantName, ')
          ..write('moveInDate: $moveInDate, ')
          ..write('moveOutDate: $moveOutDate, ')
          ..write('depositReturned: $depositReturned, ')
          ..write('departureNotes: $departureNotes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, propertyId, tenantName, moveInDate,
      moveOutDate, depositReturned, departureNotes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TenantHistory &&
          other.id == this.id &&
          other.propertyId == this.propertyId &&
          other.tenantName == this.tenantName &&
          other.moveInDate == this.moveInDate &&
          other.moveOutDate == this.moveOutDate &&
          other.depositReturned == this.depositReturned &&
          other.departureNotes == this.departureNotes);
}

class TenantHistoryTableCompanion extends UpdateCompanion<TenantHistory> {
  final Value<int> id;
  final Value<int> propertyId;
  final Value<String> tenantName;
  final Value<DateTime> moveInDate;
  final Value<DateTime> moveOutDate;
  final Value<double> depositReturned;
  final Value<String?> departureNotes;
  const TenantHistoryTableCompanion({
    this.id = const Value.absent(),
    this.propertyId = const Value.absent(),
    this.tenantName = const Value.absent(),
    this.moveInDate = const Value.absent(),
    this.moveOutDate = const Value.absent(),
    this.depositReturned = const Value.absent(),
    this.departureNotes = const Value.absent(),
  });
  TenantHistoryTableCompanion.insert({
    this.id = const Value.absent(),
    required int propertyId,
    required String tenantName,
    required DateTime moveInDate,
    required DateTime moveOutDate,
    this.depositReturned = const Value.absent(),
    this.departureNotes = const Value.absent(),
  })  : propertyId = Value(propertyId),
        tenantName = Value(tenantName),
        moveInDate = Value(moveInDate),
        moveOutDate = Value(moveOutDate);
  static Insertable<TenantHistory> custom({
    Expression<int>? id,
    Expression<int>? propertyId,
    Expression<String>? tenantName,
    Expression<DateTime>? moveInDate,
    Expression<DateTime>? moveOutDate,
    Expression<double>? depositReturned,
    Expression<String>? departureNotes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (propertyId != null) 'property_id': propertyId,
      if (tenantName != null) 'tenant_name': tenantName,
      if (moveInDate != null) 'move_in_date': moveInDate,
      if (moveOutDate != null) 'move_out_date': moveOutDate,
      if (depositReturned != null) 'deposit_returned': depositReturned,
      if (departureNotes != null) 'departure_notes': departureNotes,
    });
  }

  TenantHistoryTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? propertyId,
      Value<String>? tenantName,
      Value<DateTime>? moveInDate,
      Value<DateTime>? moveOutDate,
      Value<double>? depositReturned,
      Value<String?>? departureNotes}) {
    return TenantHistoryTableCompanion(
      id: id ?? this.id,
      propertyId: propertyId ?? this.propertyId,
      tenantName: tenantName ?? this.tenantName,
      moveInDate: moveInDate ?? this.moveInDate,
      moveOutDate: moveOutDate ?? this.moveOutDate,
      depositReturned: depositReturned ?? this.depositReturned,
      departureNotes: departureNotes ?? this.departureNotes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (propertyId.present) {
      map['property_id'] = Variable<int>(propertyId.value);
    }
    if (tenantName.present) {
      map['tenant_name'] = Variable<String>(tenantName.value);
    }
    if (moveInDate.present) {
      map['move_in_date'] = Variable<DateTime>(moveInDate.value);
    }
    if (moveOutDate.present) {
      map['move_out_date'] = Variable<DateTime>(moveOutDate.value);
    }
    if (depositReturned.present) {
      map['deposit_returned'] = Variable<double>(depositReturned.value);
    }
    if (departureNotes.present) {
      map['departure_notes'] = Variable<String>(departureNotes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TenantHistoryTableCompanion(')
          ..write('id: $id, ')
          ..write('propertyId: $propertyId, ')
          ..write('tenantName: $tenantName, ')
          ..write('moveInDate: $moveInDate, ')
          ..write('moveOutDate: $moveOutDate, ')
          ..write('depositReturned: $depositReturned, ')
          ..write('departureNotes: $departureNotes')
          ..write(')'))
        .toString();
  }
}

class $DocumentsTableTable extends DocumentsTable
    with TableInfo<$DocumentsTableTable, PropertyDocument> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DocumentsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _propertyIdMeta =
      const VerificationMeta('propertyId');
  @override
  late final GeneratedColumn<int> propertyId = GeneratedColumn<int>(
      'property_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES properties_table (id)'));
  static const VerificationMeta _documentTitleMeta =
      const VerificationMeta('documentTitle');
  @override
  late final GeneratedColumn<String> documentTitle = GeneratedColumn<String>(
      'document_title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Lease'));
  static const VerificationMeta _filePathMeta =
      const VerificationMeta('filePath');
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
      'file_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fileTypeMeta =
      const VerificationMeta('fileType');
  @override
  late final GeneratedColumn<String> fileType = GeneratedColumn<String>(
      'file_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _expiryDateMeta =
      const VerificationMeta('expiryDate');
  @override
  late final GeneratedColumn<DateTime> expiryDate = GeneratedColumn<DateTime>(
      'expiry_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _uploadedAtMeta =
      const VerificationMeta('uploadedAt');
  @override
  late final GeneratedColumn<DateTime> uploadedAt = GeneratedColumn<DateTime>(
      'uploaded_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        propertyId,
        documentTitle,
        category,
        filePath,
        fileType,
        expiryDate,
        uploadedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'documents_table';
  @override
  VerificationContext validateIntegrity(Insertable<PropertyDocument> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('property_id')) {
      context.handle(
          _propertyIdMeta,
          propertyId.isAcceptableOrUnknown(
              data['property_id']!, _propertyIdMeta));
    }
    if (data.containsKey('document_title')) {
      context.handle(
          _documentTitleMeta,
          documentTitle.isAcceptableOrUnknown(
              data['document_title']!, _documentTitleMeta));
    } else if (isInserting) {
      context.missing(_documentTitleMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    }
    if (data.containsKey('file_path')) {
      context.handle(_filePathMeta,
          filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta));
    } else if (isInserting) {
      context.missing(_filePathMeta);
    }
    if (data.containsKey('file_type')) {
      context.handle(_fileTypeMeta,
          fileType.isAcceptableOrUnknown(data['file_type']!, _fileTypeMeta));
    }
    if (data.containsKey('expiry_date')) {
      context.handle(
          _expiryDateMeta,
          expiryDate.isAcceptableOrUnknown(
              data['expiry_date']!, _expiryDateMeta));
    }
    if (data.containsKey('uploaded_at')) {
      context.handle(
          _uploadedAtMeta,
          uploadedAt.isAcceptableOrUnknown(
              data['uploaded_at']!, _uploadedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PropertyDocument map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PropertyDocument(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      propertyId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}property_id']),
      documentTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}document_title'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      filePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_path'])!,
      fileType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_type']),
      expiryDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}expiry_date']),
      uploadedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}uploaded_at'])!,
    );
  }

  @override
  $DocumentsTableTable createAlias(String alias) {
    return $DocumentsTableTable(attachedDatabase, alias);
  }
}

class PropertyDocument extends DataClass
    implements Insertable<PropertyDocument> {
  /// Unique identifier for the document entry.
  final int id;

  /// Optional foreign key linking to a property unit (null for global docs).
  final int? propertyId;

  /// User-defined title for the document.
  final String documentTitle;

  /// Document classification (e.g., 'Lease', 'Tax', 'Insurance', 'Permit').
  final String category;

  /// Local storage path or file URI for the physical document file.
  final String filePath;

  /// File extension or mime type (e.g., 'pdf', 'png', 'jpg').
  final String? fileType;

  /// Optional expiration or renewal deadline for the document.
  final DateTime? expiryDate;

  /// Timestamp when the document was uploaded or recorded.
  final DateTime uploadedAt;
  const PropertyDocument(
      {required this.id,
      this.propertyId,
      required this.documentTitle,
      required this.category,
      required this.filePath,
      this.fileType,
      this.expiryDate,
      required this.uploadedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || propertyId != null) {
      map['property_id'] = Variable<int>(propertyId);
    }
    map['document_title'] = Variable<String>(documentTitle);
    map['category'] = Variable<String>(category);
    map['file_path'] = Variable<String>(filePath);
    if (!nullToAbsent || fileType != null) {
      map['file_type'] = Variable<String>(fileType);
    }
    if (!nullToAbsent || expiryDate != null) {
      map['expiry_date'] = Variable<DateTime>(expiryDate);
    }
    map['uploaded_at'] = Variable<DateTime>(uploadedAt);
    return map;
  }

  DocumentsTableCompanion toCompanion(bool nullToAbsent) {
    return DocumentsTableCompanion(
      id: Value(id),
      propertyId: propertyId == null && nullToAbsent
          ? const Value.absent()
          : Value(propertyId),
      documentTitle: Value(documentTitle),
      category: Value(category),
      filePath: Value(filePath),
      fileType: fileType == null && nullToAbsent
          ? const Value.absent()
          : Value(fileType),
      expiryDate: expiryDate == null && nullToAbsent
          ? const Value.absent()
          : Value(expiryDate),
      uploadedAt: Value(uploadedAt),
    );
  }

  factory PropertyDocument.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PropertyDocument(
      id: serializer.fromJson<int>(json['id']),
      propertyId: serializer.fromJson<int?>(json['propertyId']),
      documentTitle: serializer.fromJson<String>(json['documentTitle']),
      category: serializer.fromJson<String>(json['category']),
      filePath: serializer.fromJson<String>(json['filePath']),
      fileType: serializer.fromJson<String?>(json['fileType']),
      expiryDate: serializer.fromJson<DateTime?>(json['expiryDate']),
      uploadedAt: serializer.fromJson<DateTime>(json['uploadedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'propertyId': serializer.toJson<int?>(propertyId),
      'documentTitle': serializer.toJson<String>(documentTitle),
      'category': serializer.toJson<String>(category),
      'filePath': serializer.toJson<String>(filePath),
      'fileType': serializer.toJson<String?>(fileType),
      'expiryDate': serializer.toJson<DateTime?>(expiryDate),
      'uploadedAt': serializer.toJson<DateTime>(uploadedAt),
    };
  }

  PropertyDocument copyWith(
          {int? id,
          Value<int?> propertyId = const Value.absent(),
          String? documentTitle,
          String? category,
          String? filePath,
          Value<String?> fileType = const Value.absent(),
          Value<DateTime?> expiryDate = const Value.absent(),
          DateTime? uploadedAt}) =>
      PropertyDocument(
        id: id ?? this.id,
        propertyId: propertyId.present ? propertyId.value : this.propertyId,
        documentTitle: documentTitle ?? this.documentTitle,
        category: category ?? this.category,
        filePath: filePath ?? this.filePath,
        fileType: fileType.present ? fileType.value : this.fileType,
        expiryDate: expiryDate.present ? expiryDate.value : this.expiryDate,
        uploadedAt: uploadedAt ?? this.uploadedAt,
      );
  PropertyDocument copyWithCompanion(DocumentsTableCompanion data) {
    return PropertyDocument(
      id: data.id.present ? data.id.value : this.id,
      propertyId:
          data.propertyId.present ? data.propertyId.value : this.propertyId,
      documentTitle: data.documentTitle.present
          ? data.documentTitle.value
          : this.documentTitle,
      category: data.category.present ? data.category.value : this.category,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      fileType: data.fileType.present ? data.fileType.value : this.fileType,
      expiryDate:
          data.expiryDate.present ? data.expiryDate.value : this.expiryDate,
      uploadedAt:
          data.uploadedAt.present ? data.uploadedAt.value : this.uploadedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PropertyDocument(')
          ..write('id: $id, ')
          ..write('propertyId: $propertyId, ')
          ..write('documentTitle: $documentTitle, ')
          ..write('category: $category, ')
          ..write('filePath: $filePath, ')
          ..write('fileType: $fileType, ')
          ..write('expiryDate: $expiryDate, ')
          ..write('uploadedAt: $uploadedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, propertyId, documentTitle, category,
      filePath, fileType, expiryDate, uploadedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PropertyDocument &&
          other.id == this.id &&
          other.propertyId == this.propertyId &&
          other.documentTitle == this.documentTitle &&
          other.category == this.category &&
          other.filePath == this.filePath &&
          other.fileType == this.fileType &&
          other.expiryDate == this.expiryDate &&
          other.uploadedAt == this.uploadedAt);
}

class DocumentsTableCompanion extends UpdateCompanion<PropertyDocument> {
  final Value<int> id;
  final Value<int?> propertyId;
  final Value<String> documentTitle;
  final Value<String> category;
  final Value<String> filePath;
  final Value<String?> fileType;
  final Value<DateTime?> expiryDate;
  final Value<DateTime> uploadedAt;
  const DocumentsTableCompanion({
    this.id = const Value.absent(),
    this.propertyId = const Value.absent(),
    this.documentTitle = const Value.absent(),
    this.category = const Value.absent(),
    this.filePath = const Value.absent(),
    this.fileType = const Value.absent(),
    this.expiryDate = const Value.absent(),
    this.uploadedAt = const Value.absent(),
  });
  DocumentsTableCompanion.insert({
    this.id = const Value.absent(),
    this.propertyId = const Value.absent(),
    required String documentTitle,
    this.category = const Value.absent(),
    required String filePath,
    this.fileType = const Value.absent(),
    this.expiryDate = const Value.absent(),
    this.uploadedAt = const Value.absent(),
  })  : documentTitle = Value(documentTitle),
        filePath = Value(filePath);
  static Insertable<PropertyDocument> custom({
    Expression<int>? id,
    Expression<int>? propertyId,
    Expression<String>? documentTitle,
    Expression<String>? category,
    Expression<String>? filePath,
    Expression<String>? fileType,
    Expression<DateTime>? expiryDate,
    Expression<DateTime>? uploadedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (propertyId != null) 'property_id': propertyId,
      if (documentTitle != null) 'document_title': documentTitle,
      if (category != null) 'category': category,
      if (filePath != null) 'file_path': filePath,
      if (fileType != null) 'file_type': fileType,
      if (expiryDate != null) 'expiry_date': expiryDate,
      if (uploadedAt != null) 'uploaded_at': uploadedAt,
    });
  }

  DocumentsTableCompanion copyWith(
      {Value<int>? id,
      Value<int?>? propertyId,
      Value<String>? documentTitle,
      Value<String>? category,
      Value<String>? filePath,
      Value<String?>? fileType,
      Value<DateTime?>? expiryDate,
      Value<DateTime>? uploadedAt}) {
    return DocumentsTableCompanion(
      id: id ?? this.id,
      propertyId: propertyId ?? this.propertyId,
      documentTitle: documentTitle ?? this.documentTitle,
      category: category ?? this.category,
      filePath: filePath ?? this.filePath,
      fileType: fileType ?? this.fileType,
      expiryDate: expiryDate ?? this.expiryDate,
      uploadedAt: uploadedAt ?? this.uploadedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (propertyId.present) {
      map['property_id'] = Variable<int>(propertyId.value);
    }
    if (documentTitle.present) {
      map['document_title'] = Variable<String>(documentTitle.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (fileType.present) {
      map['file_type'] = Variable<String>(fileType.value);
    }
    if (expiryDate.present) {
      map['expiry_date'] = Variable<DateTime>(expiryDate.value);
    }
    if (uploadedAt.present) {
      map['uploaded_at'] = Variable<DateTime>(uploadedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DocumentsTableCompanion(')
          ..write('id: $id, ')
          ..write('propertyId: $propertyId, ')
          ..write('documentTitle: $documentTitle, ')
          ..write('category: $category, ')
          ..write('filePath: $filePath, ')
          ..write('fileType: $fileType, ')
          ..write('expiryDate: $expiryDate, ')
          ..write('uploadedAt: $uploadedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PropertiesTableTable propertiesTable =
      $PropertiesTableTable(this);
  late final $TenantsTableTable tenantsTable = $TenantsTableTable(this);
  late final $RentLedgerTableTable rentLedgerTable =
      $RentLedgerTableTable(this);
  late final $AssetsTableTable assetsTable = $AssetsTableTable(this);
  late final $MaintenanceTableTable maintenanceTable =
      $MaintenanceTableTable(this);
  late final $ExpensesTableTable expensesTable = $ExpensesTableTable(this);
  late final $TenantHistoryTableTable tenantHistoryTable =
      $TenantHistoryTableTable(this);
  late final $DocumentsTableTable documentsTable = $DocumentsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        propertiesTable,
        tenantsTable,
        rentLedgerTable,
        assetsTable,
        maintenanceTable,
        expensesTable,
        tenantHistoryTable,
        documentsTable
      ];
}

typedef $$PropertiesTableTableCreateCompanionBuilder = PropertiesTableCompanion
    Function({
  Value<int> id,
  required String name,
  required String address,
  Value<String> propertyType,
  required double monthlyRent,
  Value<bool> isOccupied,
  Value<DateTime> createdAt,
});
typedef $$PropertiesTableTableUpdateCompanionBuilder = PropertiesTableCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String> address,
  Value<String> propertyType,
  Value<double> monthlyRent,
  Value<bool> isOccupied,
  Value<DateTime> createdAt,
});

final class $$PropertiesTableTableReferences
    extends BaseReferences<_$AppDatabase, $PropertiesTableTable, Property> {
  $$PropertiesTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TenantsTableTable, List<Tenant>>
      _tenantsTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.tenantsTable,
              aliasName: 'properties_table__id__tenants_table__property_id');

  $$TenantsTableTableProcessedTableManager get tenantsTableRefs {
    final manager = $$TenantsTableTableTableManager($_db, $_db.tenantsTable)
        .filter((f) => f.propertyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_tenantsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$RentLedgerTableTable, List<RentLedgerRecord>>
      _rentLedgerTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.rentLedgerTable,
              aliasName:
                  'properties_table__id__rent_ledger_table__property_id');

  $$RentLedgerTableTableProcessedTableManager get rentLedgerTableRefs {
    final manager =
        $$RentLedgerTableTableTableManager($_db, $_db.rentLedgerTable)
            .filter((f) => f.propertyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_rentLedgerTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$AssetsTableTable, List<PropertyAsset>>
      _assetsTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.assetsTable,
              aliasName: 'properties_table__id__assets_table__property_id');

  $$AssetsTableTableProcessedTableManager get assetsTableRefs {
    final manager = $$AssetsTableTableTableManager($_db, $_db.assetsTable)
        .filter((f) => f.propertyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_assetsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$MaintenanceTableTable, List<MaintenanceRecord>>
      _maintenanceTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.maintenanceTable,
              aliasName:
                  'properties_table__id__maintenance_table__property_id');

  $$MaintenanceTableTableProcessedTableManager get maintenanceTableRefs {
    final manager =
        $$MaintenanceTableTableTableManager($_db, $_db.maintenanceTable)
            .filter((f) => f.propertyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_maintenanceTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ExpensesTableTable, List<PropertyExpense>>
      _expensesTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.expensesTable,
              aliasName: 'properties_table__id__expenses_table__property_id');

  $$ExpensesTableTableProcessedTableManager get expensesTableRefs {
    final manager = $$ExpensesTableTableTableManager($_db, $_db.expensesTable)
        .filter((f) => f.propertyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_expensesTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TenantHistoryTableTable, List<TenantHistory>>
      _tenantHistoryTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.tenantHistoryTable,
              aliasName:
                  'properties_table__id__tenant_history_table__property_id');

  $$TenantHistoryTableTableProcessedTableManager get tenantHistoryTableRefs {
    final manager =
        $$TenantHistoryTableTableTableManager($_db, $_db.tenantHistoryTable)
            .filter((f) => f.propertyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_tenantHistoryTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$DocumentsTableTable, List<PropertyDocument>>
      _documentsTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.documentsTable,
              aliasName: 'properties_table__id__documents_table__property_id');

  $$DocumentsTableTableProcessedTableManager get documentsTableRefs {
    final manager = $$DocumentsTableTableTableManager($_db, $_db.documentsTable)
        .filter((f) => f.propertyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_documentsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$PropertiesTableTableFilterComposer
    extends Composer<_$AppDatabase, $PropertiesTableTable> {
  $$PropertiesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get propertyType => $composableBuilder(
      column: $table.propertyType, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get monthlyRent => $composableBuilder(
      column: $table.monthlyRent, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isOccupied => $composableBuilder(
      column: $table.isOccupied, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  Expression<bool> tenantsTableRefs(
      Expression<bool> Function($$TenantsTableTableFilterComposer f) f) {
    final $$TenantsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.tenantsTable,
        getReferencedColumn: (t) => t.propertyId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TenantsTableTableFilterComposer(
              $db: $db,
              $table: $db.tenantsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> rentLedgerTableRefs(
      Expression<bool> Function($$RentLedgerTableTableFilterComposer f) f) {
    final $$RentLedgerTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.rentLedgerTable,
        getReferencedColumn: (t) => t.propertyId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RentLedgerTableTableFilterComposer(
              $db: $db,
              $table: $db.rentLedgerTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> assetsTableRefs(
      Expression<bool> Function($$AssetsTableTableFilterComposer f) f) {
    final $$AssetsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.assetsTable,
        getReferencedColumn: (t) => t.propertyId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AssetsTableTableFilterComposer(
              $db: $db,
              $table: $db.assetsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> maintenanceTableRefs(
      Expression<bool> Function($$MaintenanceTableTableFilterComposer f) f) {
    final $$MaintenanceTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.maintenanceTable,
        getReferencedColumn: (t) => t.propertyId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MaintenanceTableTableFilterComposer(
              $db: $db,
              $table: $db.maintenanceTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> expensesTableRefs(
      Expression<bool> Function($$ExpensesTableTableFilterComposer f) f) {
    final $$ExpensesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.expensesTable,
        getReferencedColumn: (t) => t.propertyId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExpensesTableTableFilterComposer(
              $db: $db,
              $table: $db.expensesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> tenantHistoryTableRefs(
      Expression<bool> Function($$TenantHistoryTableTableFilterComposer f) f) {
    final $$TenantHistoryTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.tenantHistoryTable,
        getReferencedColumn: (t) => t.propertyId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TenantHistoryTableTableFilterComposer(
              $db: $db,
              $table: $db.tenantHistoryTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> documentsTableRefs(
      Expression<bool> Function($$DocumentsTableTableFilterComposer f) f) {
    final $$DocumentsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.documentsTable,
        getReferencedColumn: (t) => t.propertyId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DocumentsTableTableFilterComposer(
              $db: $db,
              $table: $db.documentsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PropertiesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PropertiesTableTable> {
  $$PropertiesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get propertyType => $composableBuilder(
      column: $table.propertyType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get monthlyRent => $composableBuilder(
      column: $table.monthlyRent, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isOccupied => $composableBuilder(
      column: $table.isOccupied, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$PropertiesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PropertiesTableTable> {
  $$PropertiesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get propertyType => $composableBuilder(
      column: $table.propertyType, builder: (column) => column);

  GeneratedColumn<double> get monthlyRent => $composableBuilder(
      column: $table.monthlyRent, builder: (column) => column);

  GeneratedColumn<bool> get isOccupied => $composableBuilder(
      column: $table.isOccupied, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> tenantsTableRefs<T extends Object>(
      Expression<T> Function($$TenantsTableTableAnnotationComposer a) f) {
    final $$TenantsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.tenantsTable,
        getReferencedColumn: (t) => t.propertyId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TenantsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.tenantsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> rentLedgerTableRefs<T extends Object>(
      Expression<T> Function($$RentLedgerTableTableAnnotationComposer a) f) {
    final $$RentLedgerTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.rentLedgerTable,
        getReferencedColumn: (t) => t.propertyId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RentLedgerTableTableAnnotationComposer(
              $db: $db,
              $table: $db.rentLedgerTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> assetsTableRefs<T extends Object>(
      Expression<T> Function($$AssetsTableTableAnnotationComposer a) f) {
    final $$AssetsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.assetsTable,
        getReferencedColumn: (t) => t.propertyId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AssetsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.assetsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> maintenanceTableRefs<T extends Object>(
      Expression<T> Function($$MaintenanceTableTableAnnotationComposer a) f) {
    final $$MaintenanceTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.maintenanceTable,
        getReferencedColumn: (t) => t.propertyId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MaintenanceTableTableAnnotationComposer(
              $db: $db,
              $table: $db.maintenanceTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> expensesTableRefs<T extends Object>(
      Expression<T> Function($$ExpensesTableTableAnnotationComposer a) f) {
    final $$ExpensesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.expensesTable,
        getReferencedColumn: (t) => t.propertyId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExpensesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.expensesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> tenantHistoryTableRefs<T extends Object>(
      Expression<T> Function($$TenantHistoryTableTableAnnotationComposer a) f) {
    final $$TenantHistoryTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.tenantHistoryTable,
            getReferencedColumn: (t) => t.propertyId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TenantHistoryTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.tenantHistoryTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> documentsTableRefs<T extends Object>(
      Expression<T> Function($$DocumentsTableTableAnnotationComposer a) f) {
    final $$DocumentsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.documentsTable,
        getReferencedColumn: (t) => t.propertyId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DocumentsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.documentsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PropertiesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PropertiesTableTable,
    Property,
    $$PropertiesTableTableFilterComposer,
    $$PropertiesTableTableOrderingComposer,
    $$PropertiesTableTableAnnotationComposer,
    $$PropertiesTableTableCreateCompanionBuilder,
    $$PropertiesTableTableUpdateCompanionBuilder,
    (Property, $$PropertiesTableTableReferences),
    Property,
    PrefetchHooks Function(
        {bool tenantsTableRefs,
        bool rentLedgerTableRefs,
        bool assetsTableRefs,
        bool maintenanceTableRefs,
        bool expensesTableRefs,
        bool tenantHistoryTableRefs,
        bool documentsTableRefs})> {
  $$PropertiesTableTableTableManager(
      _$AppDatabase db, $PropertiesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PropertiesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PropertiesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PropertiesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> address = const Value.absent(),
            Value<String> propertyType = const Value.absent(),
            Value<double> monthlyRent = const Value.absent(),
            Value<bool> isOccupied = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              PropertiesTableCompanion(
            id: id,
            name: name,
            address: address,
            propertyType: propertyType,
            monthlyRent: monthlyRent,
            isOccupied: isOccupied,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String address,
            Value<String> propertyType = const Value.absent(),
            required double monthlyRent,
            Value<bool> isOccupied = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              PropertiesTableCompanion.insert(
            id: id,
            name: name,
            address: address,
            propertyType: propertyType,
            monthlyRent: monthlyRent,
            isOccupied: isOccupied,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$PropertiesTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {tenantsTableRefs = false,
              rentLedgerTableRefs = false,
              assetsTableRefs = false,
              maintenanceTableRefs = false,
              expensesTableRefs = false,
              tenantHistoryTableRefs = false,
              documentsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (tenantsTableRefs) db.tenantsTable,
                if (rentLedgerTableRefs) db.rentLedgerTable,
                if (assetsTableRefs) db.assetsTable,
                if (maintenanceTableRefs) db.maintenanceTable,
                if (expensesTableRefs) db.expensesTable,
                if (tenantHistoryTableRefs) db.tenantHistoryTable,
                if (documentsTableRefs) db.documentsTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (tenantsTableRefs)
                    await $_getPrefetchedData<Property, $PropertiesTableTable,
                            Tenant>(
                        currentTable: table,
                        referencedTable: $$PropertiesTableTableReferences
                            ._tenantsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PropertiesTableTableReferences(db, table, p0)
                                .tenantsTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.propertyId == item.id),
                        typedResults: items),
                  if (rentLedgerTableRefs)
                    await $_getPrefetchedData<Property, $PropertiesTableTable, RentLedgerRecord>(
                        currentTable: table,
                        referencedTable: $$PropertiesTableTableReferences
                            ._rentLedgerTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PropertiesTableTableReferences(db, table, p0)
                                .rentLedgerTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.propertyId == item.id),
                        typedResults: items),
                  if (assetsTableRefs)
                    await $_getPrefetchedData<Property, $PropertiesTableTable,
                            PropertyAsset>(
                        currentTable: table,
                        referencedTable: $$PropertiesTableTableReferences
                            ._assetsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PropertiesTableTableReferences(db, table, p0)
                                .assetsTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.propertyId == item.id),
                        typedResults: items),
                  if (maintenanceTableRefs)
                    await $_getPrefetchedData<Property, $PropertiesTableTable,
                            MaintenanceRecord>(
                        currentTable: table,
                        referencedTable: $$PropertiesTableTableReferences
                            ._maintenanceTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PropertiesTableTableReferences(db, table, p0)
                                .maintenanceTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.propertyId == item.id),
                        typedResults: items),
                  if (expensesTableRefs)
                    await $_getPrefetchedData<Property, $PropertiesTableTable,
                            PropertyExpense>(
                        currentTable: table,
                        referencedTable: $$PropertiesTableTableReferences
                            ._expensesTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PropertiesTableTableReferences(db, table, p0)
                                .expensesTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.propertyId == item.id),
                        typedResults: items),
                  if (tenantHistoryTableRefs)
                    await $_getPrefetchedData<Property, $PropertiesTableTable,
                            TenantHistory>(
                        currentTable: table,
                        referencedTable: $$PropertiesTableTableReferences
                            ._tenantHistoryTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PropertiesTableTableReferences(db, table, p0)
                                .tenantHistoryTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.propertyId == item.id),
                        typedResults: items),
                  if (documentsTableRefs)
                    await $_getPrefetchedData<Property, $PropertiesTableTable, PropertyDocument>(
                        currentTable: table,
                        referencedTable: $$PropertiesTableTableReferences
                            ._documentsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PropertiesTableTableReferences(db, table, p0)
                                .documentsTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.propertyId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$PropertiesTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PropertiesTableTable,
    Property,
    $$PropertiesTableTableFilterComposer,
    $$PropertiesTableTableOrderingComposer,
    $$PropertiesTableTableAnnotationComposer,
    $$PropertiesTableTableCreateCompanionBuilder,
    $$PropertiesTableTableUpdateCompanionBuilder,
    (Property, $$PropertiesTableTableReferences),
    Property,
    PrefetchHooks Function(
        {bool tenantsTableRefs,
        bool rentLedgerTableRefs,
        bool assetsTableRefs,
        bool maintenanceTableRefs,
        bool expensesTableRefs,
        bool tenantHistoryTableRefs,
        bool documentsTableRefs})>;
typedef $$TenantsTableTableCreateCompanionBuilder = TenantsTableCompanion
    Function({
  Value<int> id,
  required int propertyId,
  required String fullName,
  required String phoneNumber,
  required DateTime leaseStartDate,
  required DateTime leaseEndDate,
  Value<double> securityDeposit,
  Value<String?> emergencyContact,
  Value<String?> notes,
  Value<DateTime> createdAt,
});
typedef $$TenantsTableTableUpdateCompanionBuilder = TenantsTableCompanion
    Function({
  Value<int> id,
  Value<int> propertyId,
  Value<String> fullName,
  Value<String> phoneNumber,
  Value<DateTime> leaseStartDate,
  Value<DateTime> leaseEndDate,
  Value<double> securityDeposit,
  Value<String?> emergencyContact,
  Value<String?> notes,
  Value<DateTime> createdAt,
});

final class $$TenantsTableTableReferences
    extends BaseReferences<_$AppDatabase, $TenantsTableTable, Tenant> {
  $$TenantsTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PropertiesTableTable _propertyIdTable(_$AppDatabase db) =>
      db.propertiesTable
          .createAlias('tenants_table__property_id__properties_table__id');

  $$PropertiesTableTableProcessedTableManager get propertyId {
    final $_column = $_itemColumn<int>('property_id')!;

    final manager =
        $$PropertiesTableTableTableManager($_db, $_db.propertiesTable)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_propertyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$RentLedgerTableTable, List<RentLedgerRecord>>
      _rentLedgerTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.rentLedgerTable,
              aliasName: 'tenants_table__id__rent_ledger_table__tenant_id');

  $$RentLedgerTableTableProcessedTableManager get rentLedgerTableRefs {
    final manager =
        $$RentLedgerTableTableTableManager($_db, $_db.rentLedgerTable)
            .filter((f) => f.tenantId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_rentLedgerTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TenantsTableTableFilterComposer
    extends Composer<_$AppDatabase, $TenantsTableTable> {
  $$TenantsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get leaseStartDate => $composableBuilder(
      column: $table.leaseStartDate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get leaseEndDate => $composableBuilder(
      column: $table.leaseEndDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get securityDeposit => $composableBuilder(
      column: $table.securityDeposit,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get emergencyContact => $composableBuilder(
      column: $table.emergencyContact,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  $$PropertiesTableTableFilterComposer get propertyId {
    final $$PropertiesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.propertyId,
        referencedTable: $db.propertiesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PropertiesTableTableFilterComposer(
              $db: $db,
              $table: $db.propertiesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> rentLedgerTableRefs(
      Expression<bool> Function($$RentLedgerTableTableFilterComposer f) f) {
    final $$RentLedgerTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.rentLedgerTable,
        getReferencedColumn: (t) => t.tenantId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RentLedgerTableTableFilterComposer(
              $db: $db,
              $table: $db.rentLedgerTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TenantsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TenantsTableTable> {
  $$TenantsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get leaseStartDate => $composableBuilder(
      column: $table.leaseStartDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get leaseEndDate => $composableBuilder(
      column: $table.leaseEndDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get securityDeposit => $composableBuilder(
      column: $table.securityDeposit,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get emergencyContact => $composableBuilder(
      column: $table.emergencyContact,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  $$PropertiesTableTableOrderingComposer get propertyId {
    final $$PropertiesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.propertyId,
        referencedTable: $db.propertiesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PropertiesTableTableOrderingComposer(
              $db: $db,
              $table: $db.propertiesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TenantsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TenantsTableTable> {
  $$TenantsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => column);

  GeneratedColumn<DateTime> get leaseStartDate => $composableBuilder(
      column: $table.leaseStartDate, builder: (column) => column);

  GeneratedColumn<DateTime> get leaseEndDate => $composableBuilder(
      column: $table.leaseEndDate, builder: (column) => column);

  GeneratedColumn<double> get securityDeposit => $composableBuilder(
      column: $table.securityDeposit, builder: (column) => column);

  GeneratedColumn<String> get emergencyContact => $composableBuilder(
      column: $table.emergencyContact, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$PropertiesTableTableAnnotationComposer get propertyId {
    final $$PropertiesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.propertyId,
        referencedTable: $db.propertiesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PropertiesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.propertiesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> rentLedgerTableRefs<T extends Object>(
      Expression<T> Function($$RentLedgerTableTableAnnotationComposer a) f) {
    final $$RentLedgerTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.rentLedgerTable,
        getReferencedColumn: (t) => t.tenantId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RentLedgerTableTableAnnotationComposer(
              $db: $db,
              $table: $db.rentLedgerTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TenantsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TenantsTableTable,
    Tenant,
    $$TenantsTableTableFilterComposer,
    $$TenantsTableTableOrderingComposer,
    $$TenantsTableTableAnnotationComposer,
    $$TenantsTableTableCreateCompanionBuilder,
    $$TenantsTableTableUpdateCompanionBuilder,
    (Tenant, $$TenantsTableTableReferences),
    Tenant,
    PrefetchHooks Function({bool propertyId, bool rentLedgerTableRefs})> {
  $$TenantsTableTableTableManager(_$AppDatabase db, $TenantsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TenantsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TenantsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TenantsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> propertyId = const Value.absent(),
            Value<String> fullName = const Value.absent(),
            Value<String> phoneNumber = const Value.absent(),
            Value<DateTime> leaseStartDate = const Value.absent(),
            Value<DateTime> leaseEndDate = const Value.absent(),
            Value<double> securityDeposit = const Value.absent(),
            Value<String?> emergencyContact = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              TenantsTableCompanion(
            id: id,
            propertyId: propertyId,
            fullName: fullName,
            phoneNumber: phoneNumber,
            leaseStartDate: leaseStartDate,
            leaseEndDate: leaseEndDate,
            securityDeposit: securityDeposit,
            emergencyContact: emergencyContact,
            notes: notes,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int propertyId,
            required String fullName,
            required String phoneNumber,
            required DateTime leaseStartDate,
            required DateTime leaseEndDate,
            Value<double> securityDeposit = const Value.absent(),
            Value<String?> emergencyContact = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              TenantsTableCompanion.insert(
            id: id,
            propertyId: propertyId,
            fullName: fullName,
            phoneNumber: phoneNumber,
            leaseStartDate: leaseStartDate,
            leaseEndDate: leaseEndDate,
            securityDeposit: securityDeposit,
            emergencyContact: emergencyContact,
            notes: notes,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TenantsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {propertyId = false, rentLedgerTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (rentLedgerTableRefs) db.rentLedgerTable
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (propertyId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.propertyId,
                    referencedTable:
                        $$TenantsTableTableReferences._propertyIdTable(db),
                    referencedColumn:
                        $$TenantsTableTableReferences._propertyIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (rentLedgerTableRefs)
                    await $_getPrefetchedData<Tenant, $TenantsTableTable,
                            RentLedgerRecord>(
                        currentTable: table,
                        referencedTable: $$TenantsTableTableReferences
                            ._rentLedgerTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TenantsTableTableReferences(db, table, p0)
                                .rentLedgerTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.tenantId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TenantsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TenantsTableTable,
    Tenant,
    $$TenantsTableTableFilterComposer,
    $$TenantsTableTableOrderingComposer,
    $$TenantsTableTableAnnotationComposer,
    $$TenantsTableTableCreateCompanionBuilder,
    $$TenantsTableTableUpdateCompanionBuilder,
    (Tenant, $$TenantsTableTableReferences),
    Tenant,
    PrefetchHooks Function({bool propertyId, bool rentLedgerTableRefs})>;
typedef $$RentLedgerTableTableCreateCompanionBuilder = RentLedgerTableCompanion
    Function({
  Value<int> id,
  required int propertyId,
  required int tenantId,
  required String periodMonth,
  required double amountDue,
  Value<double> amountPaid,
  Value<String> status,
  Value<DateTime?> paymentDate,
  Value<String?> paymentMethod,
  Value<String?> receiptPath,
});
typedef $$RentLedgerTableTableUpdateCompanionBuilder = RentLedgerTableCompanion
    Function({
  Value<int> id,
  Value<int> propertyId,
  Value<int> tenantId,
  Value<String> periodMonth,
  Value<double> amountDue,
  Value<double> amountPaid,
  Value<String> status,
  Value<DateTime?> paymentDate,
  Value<String?> paymentMethod,
  Value<String?> receiptPath,
});

final class $$RentLedgerTableTableReferences extends BaseReferences<
    _$AppDatabase, $RentLedgerTableTable, RentLedgerRecord> {
  $$RentLedgerTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $PropertiesTableTable _propertyIdTable(_$AppDatabase db) =>
      db.propertiesTable
          .createAlias('rent_ledger_table__property_id__properties_table__id');

  $$PropertiesTableTableProcessedTableManager get propertyId {
    final $_column = $_itemColumn<int>('property_id')!;

    final manager =
        $$PropertiesTableTableTableManager($_db, $_db.propertiesTable)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_propertyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $TenantsTableTable _tenantIdTable(_$AppDatabase db) => db.tenantsTable
      .createAlias('rent_ledger_table__tenant_id__tenants_table__id');

  $$TenantsTableTableProcessedTableManager get tenantId {
    final $_column = $_itemColumn<int>('tenant_id')!;

    final manager = $$TenantsTableTableTableManager($_db, $_db.tenantsTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tenantIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$RentLedgerTableTableFilterComposer
    extends Composer<_$AppDatabase, $RentLedgerTableTable> {
  $$RentLedgerTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get periodMonth => $composableBuilder(
      column: $table.periodMonth, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amountDue => $composableBuilder(
      column: $table.amountDue, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amountPaid => $composableBuilder(
      column: $table.amountPaid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get paymentDate => $composableBuilder(
      column: $table.paymentDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get receiptPath => $composableBuilder(
      column: $table.receiptPath, builder: (column) => ColumnFilters(column));

  $$PropertiesTableTableFilterComposer get propertyId {
    final $$PropertiesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.propertyId,
        referencedTable: $db.propertiesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PropertiesTableTableFilterComposer(
              $db: $db,
              $table: $db.propertiesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TenantsTableTableFilterComposer get tenantId {
    final $$TenantsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tenantId,
        referencedTable: $db.tenantsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TenantsTableTableFilterComposer(
              $db: $db,
              $table: $db.tenantsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RentLedgerTableTableOrderingComposer
    extends Composer<_$AppDatabase, $RentLedgerTableTable> {
  $$RentLedgerTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get periodMonth => $composableBuilder(
      column: $table.periodMonth, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amountDue => $composableBuilder(
      column: $table.amountDue, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amountPaid => $composableBuilder(
      column: $table.amountPaid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get paymentDate => $composableBuilder(
      column: $table.paymentDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get receiptPath => $composableBuilder(
      column: $table.receiptPath, builder: (column) => ColumnOrderings(column));

  $$PropertiesTableTableOrderingComposer get propertyId {
    final $$PropertiesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.propertyId,
        referencedTable: $db.propertiesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PropertiesTableTableOrderingComposer(
              $db: $db,
              $table: $db.propertiesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TenantsTableTableOrderingComposer get tenantId {
    final $$TenantsTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tenantId,
        referencedTable: $db.tenantsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TenantsTableTableOrderingComposer(
              $db: $db,
              $table: $db.tenantsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RentLedgerTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $RentLedgerTableTable> {
  $$RentLedgerTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get periodMonth => $composableBuilder(
      column: $table.periodMonth, builder: (column) => column);

  GeneratedColumn<double> get amountDue =>
      $composableBuilder(column: $table.amountDue, builder: (column) => column);

  GeneratedColumn<double> get amountPaid => $composableBuilder(
      column: $table.amountPaid, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get paymentDate => $composableBuilder(
      column: $table.paymentDate, builder: (column) => column);

  GeneratedColumn<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => column);

  GeneratedColumn<String> get receiptPath => $composableBuilder(
      column: $table.receiptPath, builder: (column) => column);

  $$PropertiesTableTableAnnotationComposer get propertyId {
    final $$PropertiesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.propertyId,
        referencedTable: $db.propertiesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PropertiesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.propertiesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TenantsTableTableAnnotationComposer get tenantId {
    final $$TenantsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tenantId,
        referencedTable: $db.tenantsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TenantsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.tenantsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RentLedgerTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RentLedgerTableTable,
    RentLedgerRecord,
    $$RentLedgerTableTableFilterComposer,
    $$RentLedgerTableTableOrderingComposer,
    $$RentLedgerTableTableAnnotationComposer,
    $$RentLedgerTableTableCreateCompanionBuilder,
    $$RentLedgerTableTableUpdateCompanionBuilder,
    (RentLedgerRecord, $$RentLedgerTableTableReferences),
    RentLedgerRecord,
    PrefetchHooks Function({bool propertyId, bool tenantId})> {
  $$RentLedgerTableTableTableManager(
      _$AppDatabase db, $RentLedgerTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RentLedgerTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RentLedgerTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RentLedgerTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> propertyId = const Value.absent(),
            Value<int> tenantId = const Value.absent(),
            Value<String> periodMonth = const Value.absent(),
            Value<double> amountDue = const Value.absent(),
            Value<double> amountPaid = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime?> paymentDate = const Value.absent(),
            Value<String?> paymentMethod = const Value.absent(),
            Value<String?> receiptPath = const Value.absent(),
          }) =>
              RentLedgerTableCompanion(
            id: id,
            propertyId: propertyId,
            tenantId: tenantId,
            periodMonth: periodMonth,
            amountDue: amountDue,
            amountPaid: amountPaid,
            status: status,
            paymentDate: paymentDate,
            paymentMethod: paymentMethod,
            receiptPath: receiptPath,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int propertyId,
            required int tenantId,
            required String periodMonth,
            required double amountDue,
            Value<double> amountPaid = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime?> paymentDate = const Value.absent(),
            Value<String?> paymentMethod = const Value.absent(),
            Value<String?> receiptPath = const Value.absent(),
          }) =>
              RentLedgerTableCompanion.insert(
            id: id,
            propertyId: propertyId,
            tenantId: tenantId,
            periodMonth: periodMonth,
            amountDue: amountDue,
            amountPaid: amountPaid,
            status: status,
            paymentDate: paymentDate,
            paymentMethod: paymentMethod,
            receiptPath: receiptPath,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$RentLedgerTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({propertyId = false, tenantId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (propertyId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.propertyId,
                    referencedTable:
                        $$RentLedgerTableTableReferences._propertyIdTable(db),
                    referencedColumn: $$RentLedgerTableTableReferences
                        ._propertyIdTable(db)
                        .id,
                  ) as T;
                }
                if (tenantId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.tenantId,
                    referencedTable:
                        $$RentLedgerTableTableReferences._tenantIdTable(db),
                    referencedColumn:
                        $$RentLedgerTableTableReferences._tenantIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$RentLedgerTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RentLedgerTableTable,
    RentLedgerRecord,
    $$RentLedgerTableTableFilterComposer,
    $$RentLedgerTableTableOrderingComposer,
    $$RentLedgerTableTableAnnotationComposer,
    $$RentLedgerTableTableCreateCompanionBuilder,
    $$RentLedgerTableTableUpdateCompanionBuilder,
    (RentLedgerRecord, $$RentLedgerTableTableReferences),
    RentLedgerRecord,
    PrefetchHooks Function({bool propertyId, bool tenantId})>;
typedef $$AssetsTableTableCreateCompanionBuilder = AssetsTableCompanion
    Function({
  Value<int> id,
  required int propertyId,
  required String assetName,
  Value<String> category,
  Value<double?> purchasePrice,
  Value<DateTime?> purchaseDate,
  Value<DateTime?> warrantyExpiry,
  Value<String> condition,
  Value<String?> serviceHistory,
});
typedef $$AssetsTableTableUpdateCompanionBuilder = AssetsTableCompanion
    Function({
  Value<int> id,
  Value<int> propertyId,
  Value<String> assetName,
  Value<String> category,
  Value<double?> purchasePrice,
  Value<DateTime?> purchaseDate,
  Value<DateTime?> warrantyExpiry,
  Value<String> condition,
  Value<String?> serviceHistory,
});

final class $$AssetsTableTableReferences
    extends BaseReferences<_$AppDatabase, $AssetsTableTable, PropertyAsset> {
  $$AssetsTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PropertiesTableTable _propertyIdTable(_$AppDatabase db) =>
      db.propertiesTable
          .createAlias('assets_table__property_id__properties_table__id');

  $$PropertiesTableTableProcessedTableManager get propertyId {
    final $_column = $_itemColumn<int>('property_id')!;

    final manager =
        $$PropertiesTableTableTableManager($_db, $_db.propertiesTable)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_propertyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$AssetsTableTableFilterComposer
    extends Composer<_$AppDatabase, $AssetsTableTable> {
  $$AssetsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get assetName => $composableBuilder(
      column: $table.assetName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get purchasePrice => $composableBuilder(
      column: $table.purchasePrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get purchaseDate => $composableBuilder(
      column: $table.purchaseDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get warrantyExpiry => $composableBuilder(
      column: $table.warrantyExpiry,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get condition => $composableBuilder(
      column: $table.condition, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get serviceHistory => $composableBuilder(
      column: $table.serviceHistory,
      builder: (column) => ColumnFilters(column));

  $$PropertiesTableTableFilterComposer get propertyId {
    final $$PropertiesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.propertyId,
        referencedTable: $db.propertiesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PropertiesTableTableFilterComposer(
              $db: $db,
              $table: $db.propertiesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AssetsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AssetsTableTable> {
  $$AssetsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get assetName => $composableBuilder(
      column: $table.assetName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get purchasePrice => $composableBuilder(
      column: $table.purchasePrice,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get purchaseDate => $composableBuilder(
      column: $table.purchaseDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get warrantyExpiry => $composableBuilder(
      column: $table.warrantyExpiry,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get condition => $composableBuilder(
      column: $table.condition, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get serviceHistory => $composableBuilder(
      column: $table.serviceHistory,
      builder: (column) => ColumnOrderings(column));

  $$PropertiesTableTableOrderingComposer get propertyId {
    final $$PropertiesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.propertyId,
        referencedTable: $db.propertiesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PropertiesTableTableOrderingComposer(
              $db: $db,
              $table: $db.propertiesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AssetsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AssetsTableTable> {
  $$AssetsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get assetName =>
      $composableBuilder(column: $table.assetName, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<double> get purchasePrice => $composableBuilder(
      column: $table.purchasePrice, builder: (column) => column);

  GeneratedColumn<DateTime> get purchaseDate => $composableBuilder(
      column: $table.purchaseDate, builder: (column) => column);

  GeneratedColumn<DateTime> get warrantyExpiry => $composableBuilder(
      column: $table.warrantyExpiry, builder: (column) => column);

  GeneratedColumn<String> get condition =>
      $composableBuilder(column: $table.condition, builder: (column) => column);

  GeneratedColumn<String> get serviceHistory => $composableBuilder(
      column: $table.serviceHistory, builder: (column) => column);

  $$PropertiesTableTableAnnotationComposer get propertyId {
    final $$PropertiesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.propertyId,
        referencedTable: $db.propertiesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PropertiesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.propertiesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AssetsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AssetsTableTable,
    PropertyAsset,
    $$AssetsTableTableFilterComposer,
    $$AssetsTableTableOrderingComposer,
    $$AssetsTableTableAnnotationComposer,
    $$AssetsTableTableCreateCompanionBuilder,
    $$AssetsTableTableUpdateCompanionBuilder,
    (PropertyAsset, $$AssetsTableTableReferences),
    PropertyAsset,
    PrefetchHooks Function({bool propertyId})> {
  $$AssetsTableTableTableManager(_$AppDatabase db, $AssetsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AssetsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AssetsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AssetsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> propertyId = const Value.absent(),
            Value<String> assetName = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<double?> purchasePrice = const Value.absent(),
            Value<DateTime?> purchaseDate = const Value.absent(),
            Value<DateTime?> warrantyExpiry = const Value.absent(),
            Value<String> condition = const Value.absent(),
            Value<String?> serviceHistory = const Value.absent(),
          }) =>
              AssetsTableCompanion(
            id: id,
            propertyId: propertyId,
            assetName: assetName,
            category: category,
            purchasePrice: purchasePrice,
            purchaseDate: purchaseDate,
            warrantyExpiry: warrantyExpiry,
            condition: condition,
            serviceHistory: serviceHistory,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int propertyId,
            required String assetName,
            Value<String> category = const Value.absent(),
            Value<double?> purchasePrice = const Value.absent(),
            Value<DateTime?> purchaseDate = const Value.absent(),
            Value<DateTime?> warrantyExpiry = const Value.absent(),
            Value<String> condition = const Value.absent(),
            Value<String?> serviceHistory = const Value.absent(),
          }) =>
              AssetsTableCompanion.insert(
            id: id,
            propertyId: propertyId,
            assetName: assetName,
            category: category,
            purchasePrice: purchasePrice,
            purchaseDate: purchaseDate,
            warrantyExpiry: warrantyExpiry,
            condition: condition,
            serviceHistory: serviceHistory,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$AssetsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({propertyId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (propertyId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.propertyId,
                    referencedTable:
                        $$AssetsTableTableReferences._propertyIdTable(db),
                    referencedColumn:
                        $$AssetsTableTableReferences._propertyIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$AssetsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AssetsTableTable,
    PropertyAsset,
    $$AssetsTableTableFilterComposer,
    $$AssetsTableTableOrderingComposer,
    $$AssetsTableTableAnnotationComposer,
    $$AssetsTableTableCreateCompanionBuilder,
    $$AssetsTableTableUpdateCompanionBuilder,
    (PropertyAsset, $$AssetsTableTableReferences),
    PropertyAsset,
    PrefetchHooks Function({bool propertyId})>;
typedef $$MaintenanceTableTableCreateCompanionBuilder
    = MaintenanceTableCompanion Function({
  Value<int> id,
  required int propertyId,
  required String problemDescription,
  Value<String> status,
  Value<double> cost,
  Value<String?> technicianInfo,
  Value<DateTime> requestDate,
  Value<DateTime?> completionDate,
  Value<String?> invoicePath,
});
typedef $$MaintenanceTableTableUpdateCompanionBuilder
    = MaintenanceTableCompanion Function({
  Value<int> id,
  Value<int> propertyId,
  Value<String> problemDescription,
  Value<String> status,
  Value<double> cost,
  Value<String?> technicianInfo,
  Value<DateTime> requestDate,
  Value<DateTime?> completionDate,
  Value<String?> invoicePath,
});

final class $$MaintenanceTableTableReferences extends BaseReferences<
    _$AppDatabase, $MaintenanceTableTable, MaintenanceRecord> {
  $$MaintenanceTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $PropertiesTableTable _propertyIdTable(_$AppDatabase db) =>
      db.propertiesTable
          .createAlias('maintenance_table__property_id__properties_table__id');

  $$PropertiesTableTableProcessedTableManager get propertyId {
    final $_column = $_itemColumn<int>('property_id')!;

    final manager =
        $$PropertiesTableTableTableManager($_db, $_db.propertiesTable)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_propertyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$MaintenanceTableTableFilterComposer
    extends Composer<_$AppDatabase, $MaintenanceTableTable> {
  $$MaintenanceTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get problemDescription => $composableBuilder(
      column: $table.problemDescription,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get cost => $composableBuilder(
      column: $table.cost, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get technicianInfo => $composableBuilder(
      column: $table.technicianInfo,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get requestDate => $composableBuilder(
      column: $table.requestDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get completionDate => $composableBuilder(
      column: $table.completionDate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get invoicePath => $composableBuilder(
      column: $table.invoicePath, builder: (column) => ColumnFilters(column));

  $$PropertiesTableTableFilterComposer get propertyId {
    final $$PropertiesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.propertyId,
        referencedTable: $db.propertiesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PropertiesTableTableFilterComposer(
              $db: $db,
              $table: $db.propertiesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MaintenanceTableTableOrderingComposer
    extends Composer<_$AppDatabase, $MaintenanceTableTable> {
  $$MaintenanceTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get problemDescription => $composableBuilder(
      column: $table.problemDescription,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get cost => $composableBuilder(
      column: $table.cost, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get technicianInfo => $composableBuilder(
      column: $table.technicianInfo,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get requestDate => $composableBuilder(
      column: $table.requestDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get completionDate => $composableBuilder(
      column: $table.completionDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get invoicePath => $composableBuilder(
      column: $table.invoicePath, builder: (column) => ColumnOrderings(column));

  $$PropertiesTableTableOrderingComposer get propertyId {
    final $$PropertiesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.propertyId,
        referencedTable: $db.propertiesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PropertiesTableTableOrderingComposer(
              $db: $db,
              $table: $db.propertiesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MaintenanceTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $MaintenanceTableTable> {
  $$MaintenanceTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get problemDescription => $composableBuilder(
      column: $table.problemDescription, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<double> get cost =>
      $composableBuilder(column: $table.cost, builder: (column) => column);

  GeneratedColumn<String> get technicianInfo => $composableBuilder(
      column: $table.technicianInfo, builder: (column) => column);

  GeneratedColumn<DateTime> get requestDate => $composableBuilder(
      column: $table.requestDate, builder: (column) => column);

  GeneratedColumn<DateTime> get completionDate => $composableBuilder(
      column: $table.completionDate, builder: (column) => column);

  GeneratedColumn<String> get invoicePath => $composableBuilder(
      column: $table.invoicePath, builder: (column) => column);

  $$PropertiesTableTableAnnotationComposer get propertyId {
    final $$PropertiesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.propertyId,
        referencedTable: $db.propertiesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PropertiesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.propertiesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MaintenanceTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MaintenanceTableTable,
    MaintenanceRecord,
    $$MaintenanceTableTableFilterComposer,
    $$MaintenanceTableTableOrderingComposer,
    $$MaintenanceTableTableAnnotationComposer,
    $$MaintenanceTableTableCreateCompanionBuilder,
    $$MaintenanceTableTableUpdateCompanionBuilder,
    (MaintenanceRecord, $$MaintenanceTableTableReferences),
    MaintenanceRecord,
    PrefetchHooks Function({bool propertyId})> {
  $$MaintenanceTableTableTableManager(
      _$AppDatabase db, $MaintenanceTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MaintenanceTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MaintenanceTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MaintenanceTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> propertyId = const Value.absent(),
            Value<String> problemDescription = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<double> cost = const Value.absent(),
            Value<String?> technicianInfo = const Value.absent(),
            Value<DateTime> requestDate = const Value.absent(),
            Value<DateTime?> completionDate = const Value.absent(),
            Value<String?> invoicePath = const Value.absent(),
          }) =>
              MaintenanceTableCompanion(
            id: id,
            propertyId: propertyId,
            problemDescription: problemDescription,
            status: status,
            cost: cost,
            technicianInfo: technicianInfo,
            requestDate: requestDate,
            completionDate: completionDate,
            invoicePath: invoicePath,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int propertyId,
            required String problemDescription,
            Value<String> status = const Value.absent(),
            Value<double> cost = const Value.absent(),
            Value<String?> technicianInfo = const Value.absent(),
            Value<DateTime> requestDate = const Value.absent(),
            Value<DateTime?> completionDate = const Value.absent(),
            Value<String?> invoicePath = const Value.absent(),
          }) =>
              MaintenanceTableCompanion.insert(
            id: id,
            propertyId: propertyId,
            problemDescription: problemDescription,
            status: status,
            cost: cost,
            technicianInfo: technicianInfo,
            requestDate: requestDate,
            completionDate: completionDate,
            invoicePath: invoicePath,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$MaintenanceTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({propertyId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (propertyId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.propertyId,
                    referencedTable:
                        $$MaintenanceTableTableReferences._propertyIdTable(db),
                    referencedColumn: $$MaintenanceTableTableReferences
                        ._propertyIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$MaintenanceTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MaintenanceTableTable,
    MaintenanceRecord,
    $$MaintenanceTableTableFilterComposer,
    $$MaintenanceTableTableOrderingComposer,
    $$MaintenanceTableTableAnnotationComposer,
    $$MaintenanceTableTableCreateCompanionBuilder,
    $$MaintenanceTableTableUpdateCompanionBuilder,
    (MaintenanceRecord, $$MaintenanceTableTableReferences),
    MaintenanceRecord,
    PrefetchHooks Function({bool propertyId})>;
typedef $$ExpensesTableTableCreateCompanionBuilder = ExpensesTableCompanion
    Function({
  Value<int> id,
  Value<int?> propertyId,
  required String category,
  required double amount,
  required DateTime expenseDate,
  Value<String?> description,
  Value<String?> receiptPath,
});
typedef $$ExpensesTableTableUpdateCompanionBuilder = ExpensesTableCompanion
    Function({
  Value<int> id,
  Value<int?> propertyId,
  Value<String> category,
  Value<double> amount,
  Value<DateTime> expenseDate,
  Value<String?> description,
  Value<String?> receiptPath,
});

final class $$ExpensesTableTableReferences extends BaseReferences<_$AppDatabase,
    $ExpensesTableTable, PropertyExpense> {
  $$ExpensesTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $PropertiesTableTable _propertyIdTable(_$AppDatabase db) =>
      db.propertiesTable
          .createAlias('expenses_table__property_id__properties_table__id');

  $$PropertiesTableTableProcessedTableManager? get propertyId {
    final $_column = $_itemColumn<int>('property_id');
    if ($_column == null) return null;
    final manager =
        $$PropertiesTableTableTableManager($_db, $_db.propertiesTable)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_propertyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ExpensesTableTableFilterComposer
    extends Composer<_$AppDatabase, $ExpensesTableTable> {
  $$ExpensesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get expenseDate => $composableBuilder(
      column: $table.expenseDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get receiptPath => $composableBuilder(
      column: $table.receiptPath, builder: (column) => ColumnFilters(column));

  $$PropertiesTableTableFilterComposer get propertyId {
    final $$PropertiesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.propertyId,
        referencedTable: $db.propertiesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PropertiesTableTableFilterComposer(
              $db: $db,
              $table: $db.propertiesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ExpensesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ExpensesTableTable> {
  $$ExpensesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get expenseDate => $composableBuilder(
      column: $table.expenseDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get receiptPath => $composableBuilder(
      column: $table.receiptPath, builder: (column) => ColumnOrderings(column));

  $$PropertiesTableTableOrderingComposer get propertyId {
    final $$PropertiesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.propertyId,
        referencedTable: $db.propertiesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PropertiesTableTableOrderingComposer(
              $db: $db,
              $table: $db.propertiesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ExpensesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExpensesTableTable> {
  $$ExpensesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<DateTime> get expenseDate => $composableBuilder(
      column: $table.expenseDate, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get receiptPath => $composableBuilder(
      column: $table.receiptPath, builder: (column) => column);

  $$PropertiesTableTableAnnotationComposer get propertyId {
    final $$PropertiesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.propertyId,
        referencedTable: $db.propertiesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PropertiesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.propertiesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ExpensesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ExpensesTableTable,
    PropertyExpense,
    $$ExpensesTableTableFilterComposer,
    $$ExpensesTableTableOrderingComposer,
    $$ExpensesTableTableAnnotationComposer,
    $$ExpensesTableTableCreateCompanionBuilder,
    $$ExpensesTableTableUpdateCompanionBuilder,
    (PropertyExpense, $$ExpensesTableTableReferences),
    PropertyExpense,
    PrefetchHooks Function({bool propertyId})> {
  $$ExpensesTableTableTableManager(_$AppDatabase db, $ExpensesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExpensesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExpensesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExpensesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> propertyId = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<DateTime> expenseDate = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> receiptPath = const Value.absent(),
          }) =>
              ExpensesTableCompanion(
            id: id,
            propertyId: propertyId,
            category: category,
            amount: amount,
            expenseDate: expenseDate,
            description: description,
            receiptPath: receiptPath,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> propertyId = const Value.absent(),
            required String category,
            required double amount,
            required DateTime expenseDate,
            Value<String?> description = const Value.absent(),
            Value<String?> receiptPath = const Value.absent(),
          }) =>
              ExpensesTableCompanion.insert(
            id: id,
            propertyId: propertyId,
            category: category,
            amount: amount,
            expenseDate: expenseDate,
            description: description,
            receiptPath: receiptPath,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ExpensesTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({propertyId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (propertyId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.propertyId,
                    referencedTable:
                        $$ExpensesTableTableReferences._propertyIdTable(db),
                    referencedColumn:
                        $$ExpensesTableTableReferences._propertyIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ExpensesTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ExpensesTableTable,
    PropertyExpense,
    $$ExpensesTableTableFilterComposer,
    $$ExpensesTableTableOrderingComposer,
    $$ExpensesTableTableAnnotationComposer,
    $$ExpensesTableTableCreateCompanionBuilder,
    $$ExpensesTableTableUpdateCompanionBuilder,
    (PropertyExpense, $$ExpensesTableTableReferences),
    PropertyExpense,
    PrefetchHooks Function({bool propertyId})>;
typedef $$TenantHistoryTableTableCreateCompanionBuilder
    = TenantHistoryTableCompanion Function({
  Value<int> id,
  required int propertyId,
  required String tenantName,
  required DateTime moveInDate,
  required DateTime moveOutDate,
  Value<double> depositReturned,
  Value<String?> departureNotes,
});
typedef $$TenantHistoryTableTableUpdateCompanionBuilder
    = TenantHistoryTableCompanion Function({
  Value<int> id,
  Value<int> propertyId,
  Value<String> tenantName,
  Value<DateTime> moveInDate,
  Value<DateTime> moveOutDate,
  Value<double> depositReturned,
  Value<String?> departureNotes,
});

final class $$TenantHistoryTableTableReferences extends BaseReferences<
    _$AppDatabase, $TenantHistoryTableTable, TenantHistory> {
  $$TenantHistoryTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $PropertiesTableTable _propertyIdTable(_$AppDatabase db) => db
      .propertiesTable
      .createAlias('tenant_history_table__property_id__properties_table__id');

  $$PropertiesTableTableProcessedTableManager get propertyId {
    final $_column = $_itemColumn<int>('property_id')!;

    final manager =
        $$PropertiesTableTableTableManager($_db, $_db.propertiesTable)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_propertyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TenantHistoryTableTableFilterComposer
    extends Composer<_$AppDatabase, $TenantHistoryTableTable> {
  $$TenantHistoryTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tenantName => $composableBuilder(
      column: $table.tenantName, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get moveInDate => $composableBuilder(
      column: $table.moveInDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get moveOutDate => $composableBuilder(
      column: $table.moveOutDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get depositReturned => $composableBuilder(
      column: $table.depositReturned,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get departureNotes => $composableBuilder(
      column: $table.departureNotes,
      builder: (column) => ColumnFilters(column));

  $$PropertiesTableTableFilterComposer get propertyId {
    final $$PropertiesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.propertyId,
        referencedTable: $db.propertiesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PropertiesTableTableFilterComposer(
              $db: $db,
              $table: $db.propertiesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TenantHistoryTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TenantHistoryTableTable> {
  $$TenantHistoryTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tenantName => $composableBuilder(
      column: $table.tenantName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get moveInDate => $composableBuilder(
      column: $table.moveInDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get moveOutDate => $composableBuilder(
      column: $table.moveOutDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get depositReturned => $composableBuilder(
      column: $table.depositReturned,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get departureNotes => $composableBuilder(
      column: $table.departureNotes,
      builder: (column) => ColumnOrderings(column));

  $$PropertiesTableTableOrderingComposer get propertyId {
    final $$PropertiesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.propertyId,
        referencedTable: $db.propertiesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PropertiesTableTableOrderingComposer(
              $db: $db,
              $table: $db.propertiesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TenantHistoryTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TenantHistoryTableTable> {
  $$TenantHistoryTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get tenantName => $composableBuilder(
      column: $table.tenantName, builder: (column) => column);

  GeneratedColumn<DateTime> get moveInDate => $composableBuilder(
      column: $table.moveInDate, builder: (column) => column);

  GeneratedColumn<DateTime> get moveOutDate => $composableBuilder(
      column: $table.moveOutDate, builder: (column) => column);

  GeneratedColumn<double> get depositReturned => $composableBuilder(
      column: $table.depositReturned, builder: (column) => column);

  GeneratedColumn<String> get departureNotes => $composableBuilder(
      column: $table.departureNotes, builder: (column) => column);

  $$PropertiesTableTableAnnotationComposer get propertyId {
    final $$PropertiesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.propertyId,
        referencedTable: $db.propertiesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PropertiesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.propertiesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TenantHistoryTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TenantHistoryTableTable,
    TenantHistory,
    $$TenantHistoryTableTableFilterComposer,
    $$TenantHistoryTableTableOrderingComposer,
    $$TenantHistoryTableTableAnnotationComposer,
    $$TenantHistoryTableTableCreateCompanionBuilder,
    $$TenantHistoryTableTableUpdateCompanionBuilder,
    (TenantHistory, $$TenantHistoryTableTableReferences),
    TenantHistory,
    PrefetchHooks Function({bool propertyId})> {
  $$TenantHistoryTableTableTableManager(
      _$AppDatabase db, $TenantHistoryTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TenantHistoryTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TenantHistoryTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TenantHistoryTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> propertyId = const Value.absent(),
            Value<String> tenantName = const Value.absent(),
            Value<DateTime> moveInDate = const Value.absent(),
            Value<DateTime> moveOutDate = const Value.absent(),
            Value<double> depositReturned = const Value.absent(),
            Value<String?> departureNotes = const Value.absent(),
          }) =>
              TenantHistoryTableCompanion(
            id: id,
            propertyId: propertyId,
            tenantName: tenantName,
            moveInDate: moveInDate,
            moveOutDate: moveOutDate,
            depositReturned: depositReturned,
            departureNotes: departureNotes,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int propertyId,
            required String tenantName,
            required DateTime moveInDate,
            required DateTime moveOutDate,
            Value<double> depositReturned = const Value.absent(),
            Value<String?> departureNotes = const Value.absent(),
          }) =>
              TenantHistoryTableCompanion.insert(
            id: id,
            propertyId: propertyId,
            tenantName: tenantName,
            moveInDate: moveInDate,
            moveOutDate: moveOutDate,
            depositReturned: depositReturned,
            departureNotes: departureNotes,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TenantHistoryTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({propertyId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (propertyId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.propertyId,
                    referencedTable: $$TenantHistoryTableTableReferences
                        ._propertyIdTable(db),
                    referencedColumn: $$TenantHistoryTableTableReferences
                        ._propertyIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TenantHistoryTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TenantHistoryTableTable,
    TenantHistory,
    $$TenantHistoryTableTableFilterComposer,
    $$TenantHistoryTableTableOrderingComposer,
    $$TenantHistoryTableTableAnnotationComposer,
    $$TenantHistoryTableTableCreateCompanionBuilder,
    $$TenantHistoryTableTableUpdateCompanionBuilder,
    (TenantHistory, $$TenantHistoryTableTableReferences),
    TenantHistory,
    PrefetchHooks Function({bool propertyId})>;
typedef $$DocumentsTableTableCreateCompanionBuilder = DocumentsTableCompanion
    Function({
  Value<int> id,
  Value<int?> propertyId,
  required String documentTitle,
  Value<String> category,
  required String filePath,
  Value<String?> fileType,
  Value<DateTime?> expiryDate,
  Value<DateTime> uploadedAt,
});
typedef $$DocumentsTableTableUpdateCompanionBuilder = DocumentsTableCompanion
    Function({
  Value<int> id,
  Value<int?> propertyId,
  Value<String> documentTitle,
  Value<String> category,
  Value<String> filePath,
  Value<String?> fileType,
  Value<DateTime?> expiryDate,
  Value<DateTime> uploadedAt,
});

final class $$DocumentsTableTableReferences extends BaseReferences<
    _$AppDatabase, $DocumentsTableTable, PropertyDocument> {
  $$DocumentsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $PropertiesTableTable _propertyIdTable(_$AppDatabase db) =>
      db.propertiesTable
          .createAlias('documents_table__property_id__properties_table__id');

  $$PropertiesTableTableProcessedTableManager? get propertyId {
    final $_column = $_itemColumn<int>('property_id');
    if ($_column == null) return null;
    final manager =
        $$PropertiesTableTableTableManager($_db, $_db.propertiesTable)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_propertyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$DocumentsTableTableFilterComposer
    extends Composer<_$AppDatabase, $DocumentsTableTable> {
  $$DocumentsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get documentTitle => $composableBuilder(
      column: $table.documentTitle, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get filePath => $composableBuilder(
      column: $table.filePath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fileType => $composableBuilder(
      column: $table.fileType, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get expiryDate => $composableBuilder(
      column: $table.expiryDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get uploadedAt => $composableBuilder(
      column: $table.uploadedAt, builder: (column) => ColumnFilters(column));

  $$PropertiesTableTableFilterComposer get propertyId {
    final $$PropertiesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.propertyId,
        referencedTable: $db.propertiesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PropertiesTableTableFilterComposer(
              $db: $db,
              $table: $db.propertiesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DocumentsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $DocumentsTableTable> {
  $$DocumentsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get documentTitle => $composableBuilder(
      column: $table.documentTitle,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get filePath => $composableBuilder(
      column: $table.filePath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fileType => $composableBuilder(
      column: $table.fileType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get expiryDate => $composableBuilder(
      column: $table.expiryDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get uploadedAt => $composableBuilder(
      column: $table.uploadedAt, builder: (column) => ColumnOrderings(column));

  $$PropertiesTableTableOrderingComposer get propertyId {
    final $$PropertiesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.propertyId,
        referencedTable: $db.propertiesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PropertiesTableTableOrderingComposer(
              $db: $db,
              $table: $db.propertiesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DocumentsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $DocumentsTableTable> {
  $$DocumentsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get documentTitle => $composableBuilder(
      column: $table.documentTitle, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<String> get fileType =>
      $composableBuilder(column: $table.fileType, builder: (column) => column);

  GeneratedColumn<DateTime> get expiryDate => $composableBuilder(
      column: $table.expiryDate, builder: (column) => column);

  GeneratedColumn<DateTime> get uploadedAt => $composableBuilder(
      column: $table.uploadedAt, builder: (column) => column);

  $$PropertiesTableTableAnnotationComposer get propertyId {
    final $$PropertiesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.propertyId,
        referencedTable: $db.propertiesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PropertiesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.propertiesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DocumentsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DocumentsTableTable,
    PropertyDocument,
    $$DocumentsTableTableFilterComposer,
    $$DocumentsTableTableOrderingComposer,
    $$DocumentsTableTableAnnotationComposer,
    $$DocumentsTableTableCreateCompanionBuilder,
    $$DocumentsTableTableUpdateCompanionBuilder,
    (PropertyDocument, $$DocumentsTableTableReferences),
    PropertyDocument,
    PrefetchHooks Function({bool propertyId})> {
  $$DocumentsTableTableTableManager(
      _$AppDatabase db, $DocumentsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DocumentsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DocumentsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DocumentsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> propertyId = const Value.absent(),
            Value<String> documentTitle = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<String> filePath = const Value.absent(),
            Value<String?> fileType = const Value.absent(),
            Value<DateTime?> expiryDate = const Value.absent(),
            Value<DateTime> uploadedAt = const Value.absent(),
          }) =>
              DocumentsTableCompanion(
            id: id,
            propertyId: propertyId,
            documentTitle: documentTitle,
            category: category,
            filePath: filePath,
            fileType: fileType,
            expiryDate: expiryDate,
            uploadedAt: uploadedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> propertyId = const Value.absent(),
            required String documentTitle,
            Value<String> category = const Value.absent(),
            required String filePath,
            Value<String?> fileType = const Value.absent(),
            Value<DateTime?> expiryDate = const Value.absent(),
            Value<DateTime> uploadedAt = const Value.absent(),
          }) =>
              DocumentsTableCompanion.insert(
            id: id,
            propertyId: propertyId,
            documentTitle: documentTitle,
            category: category,
            filePath: filePath,
            fileType: fileType,
            expiryDate: expiryDate,
            uploadedAt: uploadedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DocumentsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({propertyId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (propertyId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.propertyId,
                    referencedTable:
                        $$DocumentsTableTableReferences._propertyIdTable(db),
                    referencedColumn:
                        $$DocumentsTableTableReferences._propertyIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$DocumentsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DocumentsTableTable,
    PropertyDocument,
    $$DocumentsTableTableFilterComposer,
    $$DocumentsTableTableOrderingComposer,
    $$DocumentsTableTableAnnotationComposer,
    $$DocumentsTableTableCreateCompanionBuilder,
    $$DocumentsTableTableUpdateCompanionBuilder,
    (PropertyDocument, $$DocumentsTableTableReferences),
    PropertyDocument,
    PrefetchHooks Function({bool propertyId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PropertiesTableTableTableManager get propertiesTable =>
      $$PropertiesTableTableTableManager(_db, _db.propertiesTable);
  $$TenantsTableTableTableManager get tenantsTable =>
      $$TenantsTableTableTableManager(_db, _db.tenantsTable);
  $$RentLedgerTableTableTableManager get rentLedgerTable =>
      $$RentLedgerTableTableTableManager(_db, _db.rentLedgerTable);
  $$AssetsTableTableTableManager get assetsTable =>
      $$AssetsTableTableTableManager(_db, _db.assetsTable);
  $$MaintenanceTableTableTableManager get maintenanceTable =>
      $$MaintenanceTableTableTableManager(_db, _db.maintenanceTable);
  $$ExpensesTableTableTableManager get expensesTable =>
      $$ExpensesTableTableTableManager(_db, _db.expensesTable);
  $$TenantHistoryTableTableTableManager get tenantHistoryTable =>
      $$TenantHistoryTableTableTableManager(_db, _db.tenantHistoryTable);
  $$DocumentsTableTableTableManager get documentsTable =>
      $$DocumentsTableTableTableManager(_db, _db.documentsTable);
}
