import 'package:flutter/material.dart';
import 'package:hmmam_app/core/resources/app_assets_manager.dart';
import 'package:hmmam_app/theme/app_theme.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  Widget _buildItem({
    required BuildContext context,
    required String assetPath,
    required String title,
  }) {
    return InkWell(
      // ✅ عند الضغط نرجع البيانات للصفحة السابقة
      onTap: () {
        Navigator.pop(context, {
          'title': title,
          'asset': assetPath,
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 40,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Image.asset(assetPath, fit: BoxFit.contain),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: AppColor.textblack.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 26),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard({
    required BuildContext context,
    required String header,
    required List<Widget> children,
  }) {
    return Card(
      color: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                header,
                style: AppColor.textblack.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 4),
            ...children,
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.white,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: h * 0.16,
                width: w,
                decoration: const BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(22),
                    bottomRight: Radius.circular(22),
                  ),
                ),
              ),
              SafeArea(
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Payment Method",
                          style: AppColor.textblack.copyWith(
                            fontSize: w * 0.045,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: w * 0.12),
                  ],
                ),
              ),
            ],
          ),

          // محتوى الصفحة
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(top: 18, bottom: 36),
              children: [
                // Virtual Account
                _buildSectionCard(
                  context: context,
                  header: 'Virtual Account',
                  children: [
                    _buildItem(
                      context: context,
                      assetPath: AssetsManager.bca,
                      title: 'BCA Virtual Account',
                    ),
                    _buildItem(
                      context: context,
                      assetPath: AssetsManager.bni,
                      title: 'BNI Virtual Account',
                    ),
                    _buildItem(
                      context: context,
                      assetPath: AssetsManager.mandiri,
                      title: 'Mandiri Virtual Account',
                    ),
                  ],
                ),

                // E-Wallet
                _buildSectionCard(
                  context: context,
                  header: 'E-Wallet',
                  children: [
                    _buildItem(
                      context: context,
                      assetPath: AssetsManager.orange,
                      title: 'Orange',
                    ),
                    _buildItem(
                      context: context,
                      assetPath: AssetsManager.vodafone,
                      title: 'Vodafone',
                    ),
                    _buildItem(
                      context: context,
                      assetPath: AssetsManager.etisalat,
                      title: 'Etisalat',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
