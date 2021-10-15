import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  late Razorpay paymentController = Razorpay();

  void _handleSuccess() {}

  void _handleFailure() {}

  @override
  void initState() {
    super.initState();
    paymentController.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handleSuccess);
    paymentController.on(Razorpay.EVENT_PAYMENT_ERROR, _handleFailure);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text("Pay 500"),
        onPressed: () {},
      ),
    );
  }
}
