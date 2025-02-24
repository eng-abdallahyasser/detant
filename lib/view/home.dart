import 'package:detant/controller/payment_controller.dart';
import 'package:detant/model/payment.dart';
import 'package:detant/view/add_payment_dialog.dart';
import 'package:detant/view/finance_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Home extends StatelessWidget {
  final HomeController _controller = Get.put(HomeController());
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('إدارة المدفوعات'),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'الخزينة العامة'),
                Tab(text: 'العملاء'),
                Tab(text: 'الموردين'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
               FinanceDashboard(),
              PaymentsList(
                payments: _controller.customerPayments,
              ),
              PaymentsList(
                payments: _controller.supplierPayments,
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(() => AddPaymentDialog());
            },
            child: const Icon(Icons.add),
          ),
        ));
  }
}

class PaymentsList extends StatelessWidget {
  final List<Payment> payments;
  final formatCurrency = NumberFormat.currency(
      symbol: 'ج.م',
      decimalDigits: 2,
      locale: 'ar',
      customPattern: '#,##0.00 \u00A4');

  PaymentsList({super.key, required this.payments});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
          padding: const EdgeInsets.all(16.0),
          child: DataTable(
            columns: const [
              DataColumn(label: Text('المبلغ')),
              DataColumn(label: Text('التاريخ')),
              DataColumn(label: Text('الوصف')),
            ],
            rows: payments.map((payment) {
              return DataRow(cells: [
                DataCell(Text(formatCurrency.format(payment.amount))),
                DataCell(Text(payment.date)),
                DataCell(Text(payment.description)),
              ]);
            }).toList(),
          )),
    );
  }
}
