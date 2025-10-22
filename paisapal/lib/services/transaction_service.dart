import 'package:hive/hive.dart';
import '../models/transaction_model.dart';

class TransactionService {
  static final TransactionService _instance = TransactionService._internal();
  factory TransactionService() => _instance;
  TransactionService._internal();

  final String _boxName = 'transactions';

  Future<void> addTransaction(TransactionModel txn) async {
    final box = Hive.box<TransactionModel>(_boxName);
    await box.add(txn);
  }

  Future<void> deleteTransaction(int index) async {
    final box = Hive.box<TransactionModel>(_boxName);
    await box.deleteAt(index);
  }

  Future<void> updateTransaction(int index, TransactionModel txn) async {
    final box = Hive.box<TransactionModel>(_boxName);
    await box.putAt(index, txn);
  }

  List<TransactionModel> getAllTransactions() {
    final box = Hive.box<TransactionModel>(_boxName);
    return box.values.toList();
  }

  double getTotalIncome() {
    final txns = getAllTransactions();
    // Income = NOT expense
    return txns.where((t) => !t.isExpense).fold(0, (sum, t) => sum + t.amount);
  }

  double getTotalExpense() {
    final txns = getAllTransactions();
    return txns.where((t) => t.isExpense).fold(0, (sum, t) => sum + t.amount);
  }
}
