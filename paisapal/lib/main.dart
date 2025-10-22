import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/transaction_model.dart';
import 'screens/home_screen.dart';
import 'screens/statistics_screen.dart';
import 'screens/add_transaction_screen.dart';
import 'screens/wallet_screen.dart';
import 'screens/profile_screen.dart';
import 'widgets/bottom_nav_bar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TransactionModelAdapter());
  await Hive.openBox<TransactionModel>('transactions');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const Color purple = Color(0xFF7B61FF);
  static const Color cyan = Color(0xFF00D4FF);

  ThemeData _buildTheme(Brightness brightness) {
    final base = ThemeData(brightness: brightness);
    final textTheme = GoogleFonts.interTextTheme(base.textTheme);
    final colorScheme = ColorScheme.fromSeed(
      seedColor: purple,
      brightness: brightness,
    );

    return base.copyWith(
      colorScheme: colorScheme,
      textTheme: textTheme,
      scaffoldBackgroundColor: const Color(0xFF0F1015),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: Colors.white,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: purple,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF15161A),
        hintStyle: textTheme.bodyMedium?.copyWith(color: Colors.white70),
        labelStyle: textTheme.bodyMedium?.copyWith(color: Colors.white70),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: cyan),
        ),
      ),
      cardTheme: const CardThemeData(
        color: Color(0xFF111217),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        elevation: 6,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paisapal',
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(Brightness.dark),
      home: const AppShell(),
      routes: {
        AddTransactionScreen.routeName: (_) => const AddTransactionScreen(),
      },
    );
  }
}

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _currentIndex = 0;

  static final List<Widget> _pages = [
    const HomeScreen(),
    const StatisticsScreen(),
    const WalletScreen(),
    const ProfileScreen(),
  ];

  void _onTabSelected(int index) {
    setState(() => _currentIndex = index);
  }

  Future<void> _onAddTap() async {
    await Navigator.of(context).pushNamed(AddTransactionScreen.routeName);
    setState(() {}); // refresh after adding
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 360),
        transitionBuilder: (child, anim) =>
            FadeTransition(opacity: anim, child: child),
        child: _pages[_currentIndex],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'app_shell_fab',
        onPressed: _onAddTap,
        elevation: 8,
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Color(0xFF7B61FF), Color(0xFF00D4FF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const Icon(Icons.add, size: 28, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _currentIndex,
        onTabChange: _onTabSelected,
      ),
    );
  }
}
