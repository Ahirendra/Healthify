

import 'dart:convert';
import 'dart:core';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';

class PhonePePayment extends StatefulWidget {
  PhonePePayment({Key? key}) : super(key: key);

  @override
  State<PhonePePayment> createState() => _PhonePePaymentState();
}

class _PhonePePaymentState extends State<PhonePePayment> {
  String environment="SANDBOX";
  String appId="";
  String merchantId="PGTESTPAYUAT";
      bool enableLogging=true;
      String checksum="";
      String saltKey="099eb0cd-02cf-4e2a-8aca-3e6c6aff0399";
      String saltIndex="1";

      String callbackUrl="https://webhook.site/4a84b7b3-2211-4b88-95b1-5e312cf7dc99";
      //for response which checks whether payment is done or not

      String body="";

      String apiEndPoint="/pg/v1/pay";

      Object? result;


      getChecksum(){
          final requestData={
            "merchantId": merchantId,
            "merchantTransactionId": "transaction_123",
            "merchantUserId": "90223250",
            "amount": 10,
            "mobileNumber": "9999999999",
            "callbackUrl": callbackUrl,
            "paymentInstrument": {
            "type": "PAY_PAGE",}
          };

          String base64Body=base64.encode(utf8.encode(json.encode(requestData)));

          checksum='${sha256.convert(utf8.encode(base64Body+apiEndPoint+saltKey)).toString()}###$saltIndex';

          return base64Body;

      }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    phonepeInit();

    body=getChecksum().toString();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        title: Text("PhonePe Payment Gateway"),
      ),
        body: Column(
          children: [
          ElevatedButton(
            onPressed: (){
              startTransaction();
            }, child: Text("Start Transaction"),
          ),
            const SizedBox(
              height: 20,

            ),
            Text("Result\n $result")
          ],
        ),
      ),
    );
  }

  void phonepeInit() {

    PhonePePaymentSdk.init(environment, appId, merchantId, enableLogging)
        .then((val) => {
      setState(() {
        result = 'PhonePe SDK Initialized - $val';
      })
    })
        .catchError((error) {
      handleError(error);
      return <dynamic>{};
    });
  }
   void startTransaction() async{

    PhonePePaymentSdk.startTransaction(body, callbackUrl, checksum,"").then((response) => {
      setState(() {
        if (response != null)
        {
          String status = response['status'].toString();
          String error = response['error'].toString();
          if (status == 'SUCCESS')
          {
            result = "Flow Completed - Status: Success!";
          }
          else {
            result = "Flow Completed - Status: $status and Error: $error";
          }
        }
        else {
          result = "Flow Incomplete";
        }
      })
    }).catchError((error) {
      // handleError(error)
      return <dynamic>{};
    });

  }
  void handleError(error) {
    setState(() {
      result={"error": error};
    });
  }
}
