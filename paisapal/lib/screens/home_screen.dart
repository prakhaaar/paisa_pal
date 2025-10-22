import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Hardcoded data for Arjun Mehta
    final String userName = "Arjun Mehta";
    final double totalIncome = 4200.00;
    final double totalExpense = 2750.75;
    final double balance = totalIncome - totalExpense;

    final List<Map<String, dynamic>> transactions = [
      {
        "title": "Salary",
        "category": "Income",
        "amount": 4200.00,
        "isExpense": false,
        "date": "2025-10-01",
      },
      {
        "title": "Rent Payment",
        "category": "Housing",
        "amount": 1500.00,
        "isExpense": true,
        "date": "2025-10-03",
      },
      {
        "title": "Groceries",
        "category": "Food",
        "amount": 650.50,
        "isExpense": true,
        "date": "2025-10-07",
      },
      {
        "title": "Electricity Bill",
        "category": "Utilities",
        "amount": 300.25,
        "isExpense": true,
        "date": "2025-10-10",
      },
      {
        "title": "Movie Outing",
        "category": "Entertainment",
        "amount": 150.00,
        "isExpense": true,
        "date": "2025-10-15",
      },
      {
        "title": "Freelance Work",
        "category": "Income",
        "amount": 500.00,
        "isExpense": false,
        "date": "2025-10-18",
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0E0E1B),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Welcome, $userName",
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Stack(
        children: [
          // Gradient background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF8A2BE2).withOpacity(0.7),
                  const Color(0xFF00FFFF).withOpacity(0.7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // Main content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Balance Glass Card
                  GlassContainer(
                    blur: 20,
                    borderRadius: BorderRadius.circular(25),
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.15),
                        Colors.white.withOpacity(0.05),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    border: const Border.fromBorderSide(
                      BorderSide(color: Colors.white24, width: 1.3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            'Total Balance',
                            style: GoogleFonts.inter(
                              color: Colors.white70,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '₹${balance.toStringAsFixed(2)}',
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Income',
                                    style: GoogleFonts.inter(
                                      color: Colors.cyanAccent,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    '₹${totalIncome.toStringAsFixed(2)}',
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Expense',
                                    style: GoogleFonts.inter(
                                      color: Colors.pinkAccent,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    '₹${totalExpense.toStringAsFixed(2)}',
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Transactions
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: transactions.length,
                      itemBuilder: (context, index) {
                        final t = transactions[index];
                        final bool isExpense = t["isExpense"];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: GlassContainer(
                            blur: 18,
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [
                                Colors.white.withOpacity(0.12),
                                Colors.white.withOpacity(0.05),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            border: const Border.fromBorderSide(
                              BorderSide(color: Colors.white24, width: 1.2),
                            ),
                            child: ListTile(
                              leading: Icon(
                                isExpense
                                    ? Icons.arrow_downward_rounded
                                    : Icons.arrow_upward_rounded,
                                color: isExpense
                                    ? Colors.pinkAccent
                                    : Colors.cyanAccent,
                              ),
                              title: Text(
                                t["title"],
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              subtitle: Text(
                                '${t["category"]} • ${t["date"]}',
                                style: GoogleFonts.inter(
                                  color: Colors.white70,
                                  fontSize: 13,
                                ),
                              ),
                              trailing: Text(
                                (isExpense ? '- ' : '+ ') +
                                    '₹${t["amount"].toStringAsFixed(2)}',
                                style: GoogleFonts.inter(
                                  color: isExpense
                                      ? Colors.pinkAccent
                                      : Colors.cyanAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
