import 'package:detant/controller/payment_controller.dart';
import 'package:detant/model/payment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddPaymentDialog extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();

  AddPaymentDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isSupplier = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('إضافة دفعة جديدة'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _amountController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(labelText: 'المبلغ'),
                   validator: (value) {
                    if (value == null || value.isEmpty) return 'مطلوب';
                    if (double.tryParse(value) == null) return 'قيمة غير صالحة';
                    return null;
                  },
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'الوصف'),
                  validator: (value) => value!.isEmpty ? 'مطلوب' : null,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final payment = Payment(
                        amount:  double.parse(_amountController.text),
                        date: DateFormat('hh:mm a dd-MM-yyyy').format(DateTime.now()),
                        description: _descriptionController.text,
                      );
                      Get.find<HomeController>().addPayment(payment, isSupplier);
                      Get.back();
                    }
                  },
                  child: const Text('حفظ'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}