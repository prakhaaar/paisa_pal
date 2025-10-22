import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/transaction_service.dart';

class StatisticsScreen extends StatefulWidget {
  static const String routeName = '/stats';

  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    final service = TransactionService();
    final income = service.getTotalIncome();
    final expense = service.getTotalExpense();
    final balance = income - expense;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Statistics',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Balance: ₹${balance.toStringAsFixed(2)}',
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Income: ₹${income.toStringAsFixed(2)}',
              style: GoogleFonts.poppins(
                color: Colors.greenAccent,
                fontSize: 18,
              ),
            ),
            Text(
              'Expense: ₹${expense.toStringAsFixed(2)}',
              style: GoogleFonts.poppins(color: Colors.redAccent, fontSize: 18),
            ),
          ],
        ),
      ),

      // no bottom nav here — AppShell handles it
    );
  }
}
