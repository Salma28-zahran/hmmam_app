import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hmmam_app/features/main/presentation/views/main_screen.dart';
import 'package:hmmam_app/features/orders/presentation/views/tabs/on_going.dart';
import 'package:hmmam_app/theme/app_theme.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        title: Text("your_order".tr(), style: AppColor.appBar),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MainScreen()),
            );
          },
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppColor.primary,
          indicatorWeight: 2.5,
          labelColor: AppColor.primary,
          unselectedLabelColor: Colors.grey,
          labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          tabs:  [
            Tab(text: 'on_going'.tr()),
            Tab(text: 'complete'.tr()),
            Tab(text: 'cancel'.tr()),
          ],
        ),

      ),
      body: TabBarView(
        controller: _tabController,
        children:  [
            OnGoing(),
          Center(child: Text("completed_orders".tr())),
          Center(child: Text("cancelled_orders".tr())),
        ],
      ),
    );
  }
}
