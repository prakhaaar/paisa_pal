import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isDarkMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode
          ? const Color(0xFF0E0E1B)
          : const Color(0xFFF5F5FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "My Profile",
          style: GoogleFonts.inter(
            color: isDarkMode ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Stack(
        children: [
          // Background gradient same as rest of app
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

          // Foreground glass UI
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
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
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: const AssetImage(
                              'assets/profile.jpg',
                            ),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Arjun Mehta",
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Paisapal Plus Member 🇮🇳",
                                style: GoogleFonts.inter(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        _buildSettingItem(
                          icon: Icons.account_balance_wallet_outlined,
                          title: "UPI & Bank Accounts",
                        ),
                        _buildSettingItem(
                          icon: Icons.phone_android_outlined,
                          title: "Mobile Recharge & Bills",
                        ),
                        _buildSettingItem(
                          icon: Icons.credit_card_outlined,
                          title: "Rupay / Debit Cards",
                        ),
                        _buildSettingItem(
                          icon: Icons.history_outlined,
                          title: "Transaction History",
                        ),
                        _buildSettingItem(
                          icon: Icons.help_outline,
                          title: "Help & Support",
                        ),
                        const SizedBox(height: 20),
                        _buildThemeToggle(),
                        const SizedBox(height: 40),
                        _buildLogoutButton(),
                      ],
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

  Widget _buildSettingItem({required IconData icon, required String title}) {
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
          leading: Icon(icon, color: Colors.cyanAccent),
          title: Text(
            title,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.white70,
            size: 18,
          ),
        ),
      ),
    );
  }

  Widget _buildThemeToggle() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isDarkMode = !isDarkMode;
        });
      },
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
          leading: Icon(
            isDarkMode ? Icons.dark_mode : Icons.light_mode,
            color: Colors.cyanAccent,
          ),
          title: Text(
            "Theme: ${isDarkMode ? "Dark" : "Light"} Mode",
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Switch(
            value: isDarkMode,
            activeColor: Colors.cyanAccent,
            inactiveThumbColor: Colors.deepPurpleAccent,
            onChanged: (v) {
              setState(() {
                isDarkMode = v;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLogoutButton() {
    return GlassContainer(
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
        leading: const Icon(Icons.logout_rounded, color: Colors.redAccent),
        title: Text(
          "Log Out",
          style: GoogleFonts.inter(
            color: Colors.redAccent,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          "See you soon 👋",
          style: GoogleFonts.inter(color: Colors.white70, fontSize: 13),
        ),
      ),
    );
  }
}
