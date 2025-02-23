import 'package:detant/controller/payment_controller.dart';
import 'package:detant/model/payment.dart';
import 'package:detant/view/add_payment_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final PaymentController _controller = Get.put(PaymentController());
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('إدارة المدفوعات'),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'الموردين'),
                Tab(text: 'العملاء'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              SupplierPayments(
                payments: _controller.supplierPayments,
              ),
              CustomerPayments(
                payments: _controller.customerPayments,
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(() => AddPaymentDialog(), arguments: true);
            },
            child: const Icon(Icons.add),
          ),
        ));
  }
}

class SupplierPayments extends StatelessWidget {
  final List<Payment> payments;

  const SupplierPayments({super.key, required this.payments});

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
                DataCell(Text(payment.amount)),
                DataCell(Text(payment.date)),
                DataCell(Text(payment.description)),
              ]);
            }).toList(),
          )),
    );
  }
}

class CustomerPayments extends StatelessWidget {
  final List<Payment> payments;
  const CustomerPayments({super.key, required this.payments});

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
                DataCell(Text(payment.amount)),
                DataCell(Text(payment.date)),
                DataCell(Text(payment.description)),
              ]);
            }).toList(),
          )),
    );
  }
}
