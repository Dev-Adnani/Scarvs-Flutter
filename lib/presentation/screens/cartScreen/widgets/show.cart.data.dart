import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:scarvs/app/constants/app.colors.dart';
import 'package:scarvs/app/constants/app.keys.dart';
import 'package:scarvs/core/models/cart.model.dart';
import 'package:scarvs/core/notifiers/cart.notifier.dart';
import 'package:scarvs/core/notifiers/user.notifier.dart';
import 'package:scarvs/core/service/payment.service.dart';
import 'package:scarvs/core/utils/snackbar.util.dart';
import 'package:scarvs/presentation/widgets/custom.text.style.dart';

Widget showCartData({
  required snapshot,
  required themeFlag,
  required Razorpay razorpay,
  required BuildContext context,
  required double height,
}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
    child: Stack(
      children: [
        ListView.builder(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemCount: snapshot.length,
          itemBuilder: (context, index) {
            CartItems cart = snapshot[index];
            return _showCartData(
              context: context,
              cart: cart,
              themeFlag: themeFlag,
              height: height,
            );
          },
        ),
        Align(
          alignment: FractionalOffset.bottomCenter,
          child: cartPrice(
            razorpay: razorpay,
            snapshot: snapshot,
            themeFlag: themeFlag,
            context: context,
          ),
        )
      ],
    ),
  );
}

//

Widget cartPrice({
  required snapshot,
  required themeFlag,
  required Razorpay razorpay,
  required BuildContext context,
}) {
  int cartPrice = 0;
  List<CartItems> cart = snapshot;

  for (int i = 0; i < cart.length; i++) {
    cartPrice += int.tryParse(cart[i].productPrice)!;
  }

  //Razor Pay

  razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
      Provider.of<PaymentService>(context, listen: false).handlePaymentSuccess);
  razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
      Provider.of<PaymentService>(context, listen: false).handlePaymentError);
  razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
      Provider.of<PaymentService>(context, listen: false).handleExternalWallet);

  Future checkMeOut({
    required BuildContext context,
    required Razorpay razorpay,
  }) async {
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
      // ignore: avoid_print
      print(e.toString());
    }
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        'Total',
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
      Text(
        '₹ $cartPrice',
        style: CustomTextWidget.bodyText2(
          color: themeFlag ? AppColors.creamColor : AppColors.mirage,
        ),
      ),
      MaterialButton(
        height: MediaQuery.of(context).size.height * 0.05,
        minWidth: MediaQuery.of(context).size.width * 0.2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        onPressed: () async {
          checkMeOut(context: context, razorpay: razorpay);
        },
        color: AppColors.rawSienna,
        child: const Text(
          'Pay Now',
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ],
  );
}

Widget _showCartData({
  required BuildContext context,
  required CartItems cart,
  required bool themeFlag,
  required double height,
}) {
  return Container(
    margin: const EdgeInsets.only(top: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {},
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              child: Image.network(
                cart.productImage,
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.width / 4,
              )),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cart.productName,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: CustomTextWidget.bodyText2(
                  color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: Text(
                  '₹  ${cart.productPrice}',
                  style: CustomTextWidget.bodyText2(
                    color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    deleteItemFromCart(
                      context: context,
                      themeFlag: themeFlag,
                      productId: cart.productId,
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 1, color: Colors.grey[300]!),
                    ),
                    child: Icon(Icons.delete,
                        color: AppColors.rawSienna, size: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}

void deleteItemFromCart(
    {required BuildContext context,
    required bool themeFlag,
    required int productId}) {
  CartNotifier cartNotifier = Provider.of<CartNotifier>(context, listen: false);

  Widget cancelButton = TextButton(
    onPressed: () {
      Navigator.pop(context);
    },
    child: Text(
      'No',
      style: TextStyle(
        color: themeFlag ? AppColors.creamColor : AppColors.mirage,
      ),
    ),
  );
  Widget continueButton = TextButton(
    onPressed: () {
      cartNotifier
          .deleteFromCart(context: context, productId: productId)
          .then((value) {
        if (value) {
          Navigator.pop(context);
          cartNotifier.refresh();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackUtil.stylishSnackBar(
              text: 'Deleted From Cart',
              context: context,
            ),
          );
        } else if (!value) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackUtil.stylishSnackBar(
              text: 'Oops Error Occured',
              context: context,
            ),
          );
        }
      });
    },
    child: Text(
      'Yes',
      style: TextStyle(
        color: themeFlag ? AppColors.creamColor : AppColors.mirage,
      ),
    ),
  );

  AlertDialog alert = AlertDialog(
    backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    title: const Text(
      'Delete from Cart',
      style: TextStyle(fontSize: 18),
    ),
    content: Text('Are you sure to delete this item from your Shopping Cart ?',
        style: TextStyle(
          fontSize: 13,
          color: themeFlag ? AppColors.creamColor : AppColors.mirage,
        )),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
