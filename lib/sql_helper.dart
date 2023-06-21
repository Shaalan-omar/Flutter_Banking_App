import 'dart:async';
import 'package:basic_banking_app/models/customer.dart';
import 'package:basic_banking_app/models/transfer.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlbrite/sqlbrite.dart';
import 'package:synchronized/synchronized.dart';

class DatabaseHelper {
  static const _databaseName = 'bank_db.db';
  static const _databaseVersion = 1;

  static const customerTable = 'customer';
  static const transferTable = 'transfer';
  static const customerId = 'customerId';
  static const transferId = 'transferId';

  static late BriteDatabase _streamDatabase;

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static var lock = Lock();

  static Database? _database;

  Future _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE $customerTable (
          $customerId INTEGER PRIMARY KEY,
          name TEXT,
          email TEXT,
          currentBalance REAL)
          ''');

    await db.execute('''CREATE TABLE $transferTable (
          $transferId INTEGER PRIMARY KEY,
          receiverId INTEGER,
          senderId INTEGER,
          transferAmount REAL)
          ''');
  }

  // this opens the database (and creates it if it doesn't exist)
  Future<Database> _initDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);

    // TODO: Remember to turn off debugging before deploying app to store(s).
    //Sqflite.setDebugModeOn(true);

    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    // Use this object to prevent concurrent access to data
    await lock.synchronized(
      () async {
        // lazily instantiate the db the first time it is accessed
        if (_database == null) {
          _database = await _initDatabase();
          _streamDatabase = BriteDatabase(_database!);
        }
      },
    );
    return _database!;
  }

  Future<BriteDatabase> get streamDatabase async {
    await database;
    return _streamDatabase;
  }

  List<Customer> parseCustomer(List<Map<String, dynamic>> customerMaps) {
    final List<Customer> customers = [];

    for (var customerMap in customerMaps) {
      final customer = Customer.fromJson(customerMap);
      customers.add(customer);
    }

    return customers;
  }

  List<Transfer> parseTransfer(List<Map<String, dynamic>> transferMaps) {
    final List<Transfer> transfers = [];

    for (var transferMap in transferMaps) {
      final transfer = Transfer.fromJson(transferMap);
      transfers.add(transfer);
    }

    return transfers;
  }

  Future<List<Customer>> getAllCustomers() async {
    final db = await instance.streamDatabase;
    final customerMaps = await db.query(customerTable);
    final List<Customer> customers = parseCustomer(customerMaps);
    if(customers.isEmpty) insertDummyData();
    return customers;
  }

  Stream<List<Customer>> watchAllCustomers() async* {
    final db = await instance.streamDatabase;
    yield* db.createQuery(customerTable).mapToList((row) {
      return Customer.fromJson(row);
    });
  }

  Future<List<Transfer>> getAllTransfers() async {
    final db = await instance.streamDatabase;
    final transferMaps = await db.query(transferTable);
    final transfers = parseTransfer(transferMaps);
    return transfers;
  }

  Stream<List<Transfer>> watchAllTransfer() async* {
    final db = await instance.streamDatabase;
    yield* db
        .createQuery(transferTable)
        .mapToList((row) => Transfer.fromJson(row));
  }

  Future<Customer> findCustomerById(int id) async {
    final db = await instance.streamDatabase;
    final customerMaps =
        await db.query(customerTable, where: 'customerId = $id');
    final List<Customer> customers = parseCustomer(customerMaps);
    return customers.first;
  }

  Future<int> insert(String table, Map<String, dynamic> row) async {
    final db = await instance.streamDatabase;
    return db.insert(table, row);
  }

  Future<int> insertCustomer(Customer customer) {
    return insert(customerTable, customer.toJson());
  }

  Future<int> insertTransfer(Transfer transfer) {
    return insert(transferTable, transfer.toJson());
  }


  Future updateCustomer(Customer customer, double currentBalance) async {
    final db = await instance.streamDatabase;
    return db.rawUpdate('''
     UPDATE $customerTable SET currentBalance = $currentBalance WHERE $customerId = ${customer.id}
     ''');
  }

  Future insertDummyData() async {
     insertCustomer(Customer(
          username:  'Sarahx',
          email: 'Sarah.Abdelhamid@hohomail.com',
          urlAvatar: 'https://media.istockphoto.com/id/1420486889/photo/candid-portrait-of-young-middle-eastern-digital-native.jpg?s=612x612&w=0&k=20&c=SV7ZhKg7qCeL6oYZGBaIxqfTTrQZu08kndvIKqdL_PI=',
    
     insertCustomer(Customer(
         username:  'Jennifer',
         email: 'Jen.mat@hohomail.com',
         urlAvatar: 'https://media.istockphoto.com/id/1487545695/photo/a-woman-is-exploring-the-city-at-sunset.jpg?s=612x612&w=0&k=20&c=o8FvrCJcAV02p14RRCpcLmlBY-kPN84FukC05QUH-hg=',
    
     insertCustomer(Customer(
           username:  'Mo',
           email: 'Mo.Jim@hohomail.com',
           urlAvatar: 'https://media.istockphoto.com/id/1400280368/photo/happy-businessman-working-on-his-laptop-at-home-handsome-businessman-reading-an-email-on-his.webp?b=1&s=170667a&w=0&k=20&c=mc9FiePkCPzKWRyexNf2lMo9BkDej_OpNloSDMNsutM=',
    
     insertCustomer(Customer(
          username:  'AboAli',
          email: 'Abo.Ai@hohomail.com',
          urlAvatar: 'https://media.istockphoto.com/id/848624258/photo/portrait-of-man-using-laptop-at-desk-in-office.jpg?s=612x612&w=0&k=20&c=HeMD48ZuWPdsa86kbBVgqcPZB9WPJmdH_Liv4_NJelw=',
    
     insertCustomer(Customer(
          username:  'Jacob',
          email: 'Jacob.Abdelhamid@hohomail.com',
          urlAvatar: 'https://media.istockphoto.com/id/1390884026/photo/young-man-on-a-taking-selfie-at-home-camera-point-of-view.webp?b=1&s=170667a&w=0&k=20&c=BTUIZ3qvB2y7IO-ThRmeB1tTOUlhWvO4AipB2fgTJ18=',
    
     insertCustomer(Customer(
          username:  'Jenny',
          email: 'Jenny.mat@hohomail.com',
          urlAvatar: 'https://media.istockphoto.com/id/1437816897/photo/business-woman-manager-or-human-resources-portrait-for-career-success-company-we-are-hiring.webp?b=1&s=170667a&w=0&k=20&c=YQ_j83pg9fB-HWOd1Qur3_kBmG_ot_hZty8pvoFkr6A='
     insertCustomer(Customer(
          username:  'Mona',
          email: 'Mona.m@hohomail.com',
          urlAvatar: 'https://media.istockphoto.com/id/1402667894/photo/energy-lecture-screen.webp?b=1&s=170667a&w=0&k=20&c=4IN-1IUvtrMK3h8fnrWf490o5KzoXfDFd6gL3Rbn5Ak=',
    
     insertCustomer(Customer(
          username:  'Zack',
          email: 'Zack.Li@hohomail.com',
          urlAvatar: 'https://images.unsplash.com/photo-1531384441138-2736e62e0919?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8N3x8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    
     getAllCustomers();
  }

  void close() {
    _streamDatabase.close();
  }
}