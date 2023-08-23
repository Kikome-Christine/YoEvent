import 'dart:async';
 
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterwave_standard/flutterwave.dart';
import 'package:get/get.dart';
import 'package:real_event/ReusableWidget/app_constants.dart';
import 'package:uuid/uuid.dart';
 
 
 
class FlutterWavePay extends StatefulWidget {
  const FlutterWavePay(this.title,this.amount, this.eventId);
 
  final String title;
  final String amount;
  final String eventId;
 
  @override
  State<FlutterWavePay> createState() => _FlutterWavePayState();
}
 
class _FlutterWavePayState extends State<FlutterWavePay> {
  final formKey = GlobalKey<FormState>();
  final amountController = TextEditingController();
  final currencyController = TextEditingController();
  final narrationController = TextEditingController();
  // final publicKeyController = TextEditingController();
  // final encryptionKeyController = TextEditingController();
 
  final publicKeyFromFlutterwave = publicKey;
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
 
  String selectedCurrency = "";
 
  bool isTestMode = false;
 
  @override
  Widget build(BuildContext context) {
    currencyController.text = selectedCurrency;
 
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Form(
          key: formKey,
          child: ListView(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: amountController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(hintText: "Amount"),
                  validator: (value) => value != null && value.isNotEmpty
                      ? null
                      : "Amount is required",
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: currencyController,
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(color: Colors.black),
                  readOnly: true,
                  onTap: _openBottomSheet,
                  decoration: const InputDecoration(
                    hintText: "Currency",
                  ),
                  validator: (value) => value != null && value.isNotEmpty
                      ? null
                      : "Currency is required",
                ),
              ),
 
              /* Public key controller from flutterwave
 
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: publicKeyController,
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(color: Colors.black),
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Public Key",
                  ),
                ),
              ),
 
              */
 
              /* encryption key controller 
 
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: encryptionKeyController,
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(color: Colors.black),
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Encryption Key",
                  ),
                ),
              ),
 
              */
 
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    hintText: "Email",
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: phoneNumberController,
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    hintText: "Contact",
                  ),
                  validator: (value) => value != null && value.isNotEmpty
                      ? null
                      : "Contact is required",
                ),
              ),
 
              /* is test mode disabled
 
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: Row(
                  children: [
                    const Text("Use Debug"),
                    Switch(
                      onChanged: (value) => {
                        setState(() {
                          isTestMode = value;
                        })
                      },
                      value: isTestMode,
                    ),
                  ],
                ),
              ),
 
              */
 
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: ElevatedButton(
                  onPressed: _onPressed,
                  child: const Text(
                    "Pay Now",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
 
  _onPressed() {
    final currentState = formKey.currentState;
    if (currentState != null && currentState.validate()) {
      _handlePaymentInitialization();
    }
  }
 
  ///Firebase logic
  _handlePaymentInitialization() async {
    final Customer customer = Customer(email: emailController.text);
 
    DocumentSnapshot eventSnapshot = await FirebaseFirestore.instance
        .collection('events')
        .doc('eventId')
        .get();
 
    if (eventSnapshot.exists) {
      Map<String, dynamic> eventData =
          eventSnapshot.data() as Map<String, dynamic>;
      String eventId = eventSnapshot.id;
      String eventName = eventData['eventName'];
      double amount = eventData['amount'];
 
      final Flutterwave flutterwave = Flutterwave(
        context: context,
        publicKey: publicKeyFromFlutterwave,
        currency: selectedCurrency,
        redirectUrl: 'https://google.com',
        txRef: const Uuid().v1(),
        amount: amount.toString(), // Convert the amount to a string
        customer: customer,
        paymentOptions: "card, payattitude, barter, bank transfer, ussd",
        customization: Customization(title: eventName),
        isTestMode: isTestMode,
      );
 
      final ChargeResponse response = await flutterwave.charge();
      showLoading(response.toString());
      print("${response.toJson()}");
    } else {
      print("Event data not found in Firestore");
    }
  }
 
  // _handlePaymentInitialization() async {
  //   final Customer customer = Customer(email: emailController.text);
  //   final Flutterwave flutterwave = Flutterwave(
  //     context: context,
 
  //     /* 
  //     publicKey: publicKeyController.text.trim().isEmpty
  //         ? getPublicKey()
  //         : publicKeyController.text.trim(),
  //     */
 
  //     publicKey: publicKeyFromFlutterwave,
  //     currency: selectedCurrency,
  //     redirectUrl:
  //         'https://google.com', //'https://sandbox-flw-web-v3.herokuapp.com/pay/tj6xde1v4i7g'
  //     txRef: const Uuid().v1(),
  //     // amount: amountController.text.toString().trim(),
  //     amount: amountController.text,
  //     customer: customer,
  //     paymentOptions: "card, payattitude, barter, bank transfer, ussd",
  //     customization: Customization(title: "YoEvent service payments"),
  //     isTestMode: isTestMode,
  //   );
 
  //   final ChargeResponse response = await flutterwave.charge();
  //   showLoading(response.toString());
  //   print("${response.toJson()}");
  // }
 
  String getPublicKey() {
    return "";
  }
 
  void _openBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return _getCurrency();
        });
  }
 
  Widget _getCurrency() {
    final currencies = ["UGX", "KES", "USD", "TZS"];
    return Container(
      height: 250,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      color: Colors.white,
      child: ListView(
        children: currencies
            .map((currency) => ListTile(
                  onTap: () => {_handleCurrencyTap(currency)},
                  title: Column(
                    children: [
                      Text(
                        currency,
                        textAlign: TextAlign.start,
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(height: 4),
                      const Divider(height: 1)
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
 
  _handleCurrencyTap(String currency) {
    setState(() {
      selectedCurrency = currency;
      currencyController.text = currency;
    });
    Navigator.pop(context);
  }
 
  Future<void> showLoading(String message) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            margin: const EdgeInsets.fromLTRB(30, 20, 30, 20),
            width: double.infinity,
            height: 50,
            child: Text(message),
          ),
        );
      },
    );
  }
}