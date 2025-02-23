import 'package:detant/controller/payment_controller.dart';
import 'package:detant/model/payment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPaymentDialog extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _dateController = TextEditingController();
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
                  decoration: const InputDecoration(labelText: 'المبلغ'),
                  validator: (value) => value!.isEmpty ? 'مطلوب' : null,
                ),
                TextFormField(
                  controller: _dateController,
                  decoration: const InputDecoration(labelText: 'التاريخ'),
                  readOnly: true,
                  onTap: () async {
                    DateTime? date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (date != null) {
                      _dateController.text = 
                        "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
                    }
                  },
                  validator: (value) => value!.isEmpty ? 'مطلوب' : null,
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
                        amount: '${_amountController.text} جنيه',
                        date: _dateController.text,
                        description: _descriptionController.text,
                      );
                      Get.find<PaymentController>().addPayment(payment, isSupplier);
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