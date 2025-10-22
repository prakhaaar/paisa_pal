import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> transactions = [
      {"title": "Zomato", "amount": -299.00, "icon": Icons.fastfood_rounded},
      {
        "title": "Salary (TCS Pvt Ltd)",
        "amount": 72000.00,
        "icon": Icons.account_balance_wallet_outlined,
      },
      {
        "title": "Ola Ride",
        "amount": -185.50,
        "icon": Icons.directions_car_rounded,
      },
      {
        "title": "Amazon Purchase",
        "amount": -1499.99,
        "icon": Icons.shopping_bag_rounded,
      },
      {
        "title": "UPI from Rahul",
        "amount": 500.00,
        "icon": Icons.currency_rupee_rounded,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0E0E1B),
      appBar: AppBar(
        title: Text(
          "My Wallet",
          style: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          // gradient background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF8A2BE2), Color(0xFF00FFFF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 210,
                    child: PageView.builder(
                      controller: PageController(viewportFraction: 0.85),
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return _buildWalletCard(index);
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Recent Transactions",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: transactions.length,
                      itemBuilder: (context, index) {
                        final item = transactions[index];
                        return _buildTransactionItem(
                          icon: item["icon"],
                          title: item["title"],
                          amount: item["amount"],
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

  Widget _buildWalletCard(int index) {
    final gradients = [
      const [Color(0xFF8A2BE2), Color(0xFF00FFFF)],
      const [Color(0xFF7B68EE), Color(0xFF00CED1)],
    ];

    final cardDetails = [
      {"bank": "HDFC Bank", "number": "XXXX 8432", "balance": "₹2,54,820"},
      {"bank": "SBI Bank", "number": "XXXX 5278", "balance": "₹1,32,050"},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GlassContainer(
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
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: LinearGradient(
              colors: gradients[index],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cardDetails[index]["bank"]!,
                  style: GoogleFonts.inter(color: Colors.white70, fontSize: 14),
                ),
                const SizedBox(height: 10),
                Text(
                  cardDetails[index]["number"]!,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Available Balance",
                      style: GoogleFonts.inter(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      cardDetails[index]["balance"]!,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTransactionItem({
    required IconData icon,
    required String title,
    required double amount,
  }) {
    final bool isIncome = amount > 0;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GlassContainer(
        blur: 18,
        borderRadius: BorderRadius.circular(20),
        border: const Border.fromBorderSide(
          BorderSide(color: Colors.white24, width: 1.2),
        ),
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.12),
            Colors.white.withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 20,
            backgroundColor: isIncome
                ? Colors.greenAccent.withOpacity(0.2)
                : Colors.redAccent.withOpacity(0.2),
            child: Icon(
              icon,
              color: isIncome ? Colors.greenAccent : Colors.redAccent,
            ),
          ),
          title: Text(
            title,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Text(
            (isIncome ? "+ ₹" : "- ₹") + amount.abs().toStringAsFixed(2),
            style: GoogleFonts.inter(
              color: isIncome ? Colors.greenAccent : Colors.redAccent,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
