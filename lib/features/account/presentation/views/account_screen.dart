import 'package:flutter/material.dart';
import 'package:hmmam_app/features/account/presentation/widgets/big_profile_appbar.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BigProfileAppBar(),
    );
  }
}