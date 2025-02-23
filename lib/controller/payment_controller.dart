import 'package:detant/model/payment.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  var supplierPayments = <Payment>[].obs;
  var customerPayments = <Payment>[].obs;

  @override
  void onInit() {
    super.onInit();
    // بيانات ابتدائية
    supplierPayments.addAll([
      Payment(amount: '١٠٠٠ جنيه', date: '٢٠٢٣-١٠-٠١', description: 'دفعة مواد خام'),
      Payment(amount: '٥٠٠ جنيه', date: '٢٠٢٣-١٠-٠٥', description: 'دفعة نقل'),
    ]);
    customerPayments.addAll([
      Payment(amount: '٢٠٠٠ جنيه', date: '٢٠٢٣-١٠-٠٢', description: 'دفعة منتج أ'),
      Payment(amount: '١٥٠٠ جنيه', date: '٢٠٢٣-١٠-٠٣', description: 'دفعة منتج ب'),
    ]);
  }

  void addPayment(Payment payment, bool isSupplier) {
    if (isSupplier) {
      supplierPayments.add(payment);
    } else {
      customerPayments.add(payment);
    }
  }
}