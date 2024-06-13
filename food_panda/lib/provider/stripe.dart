import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class PaymentController {
  Map<String, dynamic>? paymentIntentData;
  Future<void> makePayment({
    required String amount,
    required String currency,
    required BuildContext context,
  }) async {
    try {
      paymentIntentData = await createPaymentIntent(amount, currency);
      if (paymentIntentData != null) {
        await Stripe.instance.initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
          merchantDisplayName: 'Small Biz Social',
          customerId: paymentIntentData!['customer'],
          paymentIntentClientSecret: paymentIntentData!['client_secret'],
          customerEphemeralKeySecret: paymentIntentData!['ephemeralKey'],
        ));
        displayPaymentSheet(context, amount);
      }
    } catch (e, s) {
      debugPrint('exception:$e$s');
    }
  }

  displayPaymentSheet(context, String amount) async {
    try {
      await Stripe.instance.presentPaymentSheet();
    } on Exception catch (e) {
      if (e is StripeException) {
        debugPrint("Error from Stripe: ${e.error.localizedMessage}");
      } else {
        debugPrint("Unforeseen error: ${e.toString()}");
      }
    } catch (e) {
      debugPrint("exception:$e");
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization':
                'Bearer sk_test_51OWizRET5w9C2b8v9VQmeJ2R5bbqMH96P56KOQyii3JtluOzPPFBvkvv7c9Fz6mYu0MAyXuMXzlsBCjNHSgQnWnT00gUhhBExW',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      return jsonDecode(response.body);
    } catch (err) {
      debugPrint('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount) * 100);
    return a.toString();
  }
}
