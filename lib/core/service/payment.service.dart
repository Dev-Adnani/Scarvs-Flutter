import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentService with ChangeNotifier {
  handlePaymentSuccess(
      BuildContext context, PaymentSuccessResponse paymentSuccessResponse) {
    return showResponse(
        context: context, response: paymentSuccessResponse.paymentId!);
  }

  handlePaymentError(
      BuildContext context, PaymentFailureResponse paymentFailureResponse) {
    return showResponse(
        context: context, response: paymentFailureResponse.message!);
  }

  handleExternalWallet(
      BuildContext context, ExternalWalletResponse externalWalletResponse) {
    return showResponse(
        context: context, response: externalWalletResponse.walletName!);
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
