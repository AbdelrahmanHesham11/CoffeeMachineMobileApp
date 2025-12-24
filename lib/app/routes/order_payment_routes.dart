import 'package:get/get.dart';

import '../modules/order_payment/order_payment_binding.dart';
import '../modules/order_payment/order_payment_screen.dart';

class OrderPaymentRoutes {
  OrderPaymentRoutes._();

  static const orderPayment = '/order-payment';
  static final routes = [
    GetPage(
      name: orderPayment,
      page: OrderPaymentScreen.new,
      binding: OrderPaymentBinding(),
    ),
  ];
}
