import 'package:flutter/material.dart';
import 'package:hmmam_app/features/account/presentation/views/account_screen.dart';
import 'package:hmmam_app/features/home/presentation/views/home_screen.dart';
import 'package:hmmam_app/features/orders/presentation/views/orders_screen.dart';
import 'package:hmmam_app/features/saved/presentation/views/saved_screen.dart';
import 'package:hmmam_app/features/main/presentation/widgets/custom_appbar.dart';
import 'package:hmmam_app/features/main/presentation/widgets/bottom_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    OrdersScreen(),
    SavedScreen(),
    AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 3 ? null : const CustomAppBar(),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

}
