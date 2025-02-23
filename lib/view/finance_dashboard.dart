import 'package:flutter/material.dart';

class FinanceDashboard extends StatelessWidget {
  const FinanceDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // القسم العلوي (المبالغ)
          Row(
            children: [
              _buildAmountCard("You will give", "\$55.00", Colors.red),
              const SizedBox(width: 16),
              _buildAmountCard("You will get", "\$0", Colors.green),
            ],
          ),
          
          const SizedBox(height: 24),
          
          // أزرار التقارير والحسابات
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildActionButton("Report", Icons.description),
              _buildActionButton("Accounts", Icons.account_balance_wallet),
            ],
          ),
          
          const SizedBox(height: 24),
          
          // بطاقات الحسابات
          Row(
            children: [
              _buildAccountCard("BANK", "\$13.244"),
              const SizedBox(width: 16),
              _buildAccountCard("SAVING", "\$13.244"),
              const SizedBox(width: 16),
              _buildAccountCard("CREDIT", "\$13.244"),
            ],
          ),
        ],
      ),
    );
  }

  // دالة لبناء بطاقات المبالغ
  Widget _buildAmountCard(String title, String amount, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),),
        child: Column(
          children: [
            Text(title, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),
            Text(amount, style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color
            )),
          ],
        ),
      ),
    );
  }

  // دالة لبناء الأزرار
  Widget _buildActionButton(String text, IconData icon) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.blue, backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Colors.blue)
      ),),
      icon: Icon(icon, size: 20),
      label: Text(text),
      onPressed: () {},
    );
  }

  // دالة لبناء بطاقات الحسابات
  Widget _buildAccountCard(String title, String amount) {
    return Expanded(
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [ BoxShadow(color: Colors.black12, blurRadius: 4)]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(
              color: Colors.grey,
              fontSize: 14
            )),
            Text(amount, style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            )),
          ],
        ),
      ),
    );
  }
}