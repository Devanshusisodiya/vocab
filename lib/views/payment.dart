import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'dart:developer' as console;

import 'package:vocab/views/home.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  late Razorpay paymentController;

  void _handleSuccess() {
    console.log('success');
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
    // CHECKING TO SEE IF THIS WORKS AND WILL SEND A PATCH REQUEST TO SERVER
    // TO CHANGE PERMISSIONS OF THE USER
  }

  void _handleFailure() {
    console.log('failure');
    // SOME METHODOLOFY TO HANDLE FAILURE
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_pNPqdICL2ewdAt',
      'amount': 100,
      'name': 'Acme Corp.',
      'description': 'Fine T-Shirt',
      'order_id': 'order_I9CS0RGXUqMjNZ',
      'retry': {'enabled': true, 'max_count': 1},
      // 'send_sms_hash': true,
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      paymentController.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  @override
  void initState() {
    super.initState();
    paymentController = Razorpay();
    paymentController.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handleSuccess);
    paymentController.on(Razorpay.EVENT_PAYMENT_ERROR, _handleFailure);
    // paymentController.open(options);
  }

  @override
  void dispose() {
    super.dispose();
    paymentController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text("Pay 500"),
        onPressed: openCheckout,
      ),
    );
  }
}
