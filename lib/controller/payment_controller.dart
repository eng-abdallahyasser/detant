import 'package:detant/model/payment.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var supplierPayments = <Payment>[].obs;
  var customerPayments = <Payment>[].obs;
  var totalAmount = 0.0.obs;
  var totalInAmount = 0.0.obs;
  var totalOutAmount = 0.0.obs;
  var isSupplier=true.obs;

  @override
  void onInit() {
    super.onInit();
    // بيانات ابتدائية
    supplierPayments.addAll([
      Payment(amount: 1000, date: '٢٠٢٣-١٠-٠١', description: 'دفعة مواد خام'),
      Payment(amount: 500, date: '٢٠٢٣-١٠-٠٥', description: 'دفعة نقل'),
    ]);
    customerPayments.addAll([
      Payment(amount: 2000, date: '٢٠٢٣-١٠-٠٢', description: 'دفعة منتج أ'),
      Payment(amount: 1500, date: '٢٠٢٣-١٠-٠٣', description: 'دفعة منتج ب'),
    ]);
    updateTotal();
  }

  void addPayment(Payment payment, bool isSupplier) {
    if (isSupplier) {
      totalAmount.value += payment.amount;
      totalInAmount.value+= payment.amount;
      supplierPayments.add(payment);

    } else {
      totalAmount.value -= payment.amount;
      totalOutAmount.value+= payment.amount;
      customerPayments.add(payment);
    }
  }

  void updateTotal() {
    totalAmount.value = customerPayments.fold(0.0, (sum, p) => sum + p.amount) -
        supplierPayments.fold(0.0, (sum, p) => sum + p.amount);

    totalInAmount.value =
        supplierPayments.fold(0.0, (sum, p) => sum + p.amount);

    totalOutAmount.value =
        customerPayments.fold(0.0, (sum, p) => sum + p.amount);
  }
}
