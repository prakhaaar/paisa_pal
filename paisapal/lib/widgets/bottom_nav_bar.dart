import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabChange;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // left side (Home, Stats)
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.home,
                    color: selectedIndex == 0 ? Colors.white : Colors.white54,
                  ),
                  onPressed: () => onTabChange(0),
                ),
                IconButton(
                  icon: Icon(
                    Icons.bar_chart,
                    color: selectedIndex == 1 ? Colors.white : Colors.white54,
                  ),
                  onPressed: () => onTabChange(1),
                ),
              ],
            ),

            // right side (Wallet, Profile)
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.account_balance_wallet,
                    color: selectedIndex == 2 ? Colors.white : Colors.white54,
                  ),
                  onPressed: () => onTabChange(2),
                ),
                IconButton(
                  icon: Icon(
                    Icons.person,
                    color: selectedIndex == 3 ? Colors.white : Colors.white54,
                  ),
                  onPressed: () => onTabChange(3),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
