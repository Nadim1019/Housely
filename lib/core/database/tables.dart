import 'package:drift/drift.dart';

enum UserRole { owner, resident }

enum TicketPriority { low, medium, high, urgent }

enum TicketStatus { open, inProgress, resolved, closed }

@DataClassName('UserTableData')
class UsersTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text().withLength(min: 2, max: 100)();
  TextColumn get email => text().unique()();
  TextColumn get role => textEnum<UserRole>()();
  TextColumn get unitNumber => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('PropertiesTableData')
class PropertiesTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text().withLength(min: 2, max: 100)();
  TextColumn get address => text()();
  TextColumn get ownerId => text().references(UsersTable, #id)();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('RentTransactionsTableData')
class RentTransactionsTable extends Table {
  TextColumn get id => text()();
  TextColumn get propertyId => text().references(PropertiesTable, #id)();
  TextColumn get residentId => text().references(UsersTable, #id)();
  RealColumn get amount => real()();
  DateTimeColumn get dueDate => dateTime()();
  BoolColumn get isPaid => boolean().withDefault(const Constant(false))();
  DateTimeColumn get paidAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('MaintenanceTicketsTableData')
class MaintenanceTicketsTable extends Table {
  TextColumn get id => text()();
  TextColumn get title => text().withLength(min: 3, max: 150)();
  TextColumn get description => text()();
  TextColumn get priority => textEnum<TicketPriority>()();
  TextColumn get status => textEnum<TicketStatus>()();
  TextColumn get residentId => text().references(UsersTable, #id)();
  TextColumn get propertyId => text().references(PropertiesTable, #id)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('NoticesTableData')
class NoticesTable extends Table {
  TextColumn get id => text()();
  TextColumn get title => text().withLength(min: 3, max: 150)();
  TextColumn get content => text()();
  TextColumn get authorId => text().references(UsersTable, #id)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}