import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:scarvs/app/constants/app.keys.dart';
import 'package:scarvs/core/notifiers/user.notifier.dart';

class PaymentService with ChangeNotifier {
  Razorpay razorpay = Razorpay();

  initializeRazorPay({required BuildContext context}) {
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  Future checkMeOut(
      {required BuildContext context, required int cartPrice}) async {
    initializeRazorPay(context: context);
    var options = {
      'key': AppKeys.razorKey,
      'amount': cartPrice,
      'name': Provider.of<UserNotifier>(context, listen: false).getUserName,
      'description': 'Payment',
      'prefill': {
        'contact': '8888888888',
        'email': Provider.of<UserNotifier>(context, listen: false).getUserEmail,
      },
      'external': {
        'wallet': ['paytm']
      }
    };
    try {
      razorpay.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  disposeRazorPay() {
    razorpay.clear();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(msg: "SUCCESS: " + response.paymentId!);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
      msg: "ERROR: " + response.code.toString() + " - " + response.message!,
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
      msg: "EXTERNAL_WALLET: " + response.walletName!,
    );
  }

  showResponse({required BuildContext context, required String response}) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 100,
            width: 400,
            child: Text(
              'This Is Response $response',
              style: const TextStyle(),
            ),
          );
        });
  }
}
