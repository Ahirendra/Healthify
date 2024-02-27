import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthify/PhonePePayment.dart';
import 'dart:convert';
import 'dart:core';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';
class MedicineDetails extends StatefulWidget {
  @override
  _medsD createState() => _medsD();
}

class _medsD extends State<MedicineDetails> {
  final PhonePePayment ob= new PhonePePayment();

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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text('Pharmacy',
              style: TextStyle(
                  color: Colors.black
              ),
              textAlign: TextAlign.center)
      ),
      body: Container(
        width: 800,
        height: 800,
        margin: EdgeInsets.all(20),
        //color: Colors.grey,
        child: Column(
          children: [
            Image(image: AssetImage('assets/images/paracetamol.jpg'),height: 200,width: 200,),
            SizedBox(height: 10,),
            Align(
                alignment: Alignment.topLeft,
                child: Text("Paracetamol",style: TextStyle(fontSize:30,fontWeight: FontWeight.w500),)),
            SizedBox(height: 3),
            Align(
                alignment: Alignment.topLeft,
                child: Text("25pcs",style: TextStyle(fontSize: 20,color: Colors.black26),)),
            SizedBox(height: 10),
            Row(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    color: Colors.grey,
                    icon: const Icon(Icons.remove),
                    tooltip: 'Increase volume by 10',
                    onPressed: () {},
                  ),
                ),
                SizedBox(width: 3,),

                IconButton(
                  color: Colors.blueAccent,
                  icon: const Icon(Icons.add),
                  onPressed: () {},
                ),
                SizedBox(width: 160,),
                Row(
                  children: [
                    Image(image: AssetImage('assets/images/rupee.jpg'),height: 35,width: 35,),
                    Text("50",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30
                      ),),
                  ],
                ),
              ],
            ),
            SizedBox(height: 59,),
            Align(
                alignment: Alignment.topLeft,
                child: Text("Description",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
            SizedBox(height: 15,),
            Text("OBH COMBI  is a cough medicine containing, Paracetamol, Ephedrine HCl, and Chlorphenamine maleate which is used to relieve coughs accompanied by flu symptoms such as fever, headache, and sneezing.",
            style: TextStyle(fontSize: 15,color: Colors.grey),),
            SizedBox(height: 20,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  backgroundColor: (Colors.blueAccent),
                  //foregroundColor: Colors.blueAccent,
                  minimumSize: Size(260,60)
              ),
              onPressed: (){
                startTransaction();
              },
              child: Text("Buy",style: TextStyle(fontSize: 20))
            ),
          ],
        ),
      ),
      // bottomNavigationBar: CurvedNavigationBar(
      //   //key: _bottomNavigationKey,
      //   height: 55,
      //
      //   buttonBackgroundColor: Colors.blueAccent,
      //   backgroundColor: Colors.white,
      //   color: Colors.blueAccent,
      //   animationCurve: Curves.bounceInOut,
      //   animationDuration: Duration(milliseconds: 300),
      //   items: <Widget>[
      //     Icon(Icons.notifications, size: 20,color: Colors.white,),
      //     Icon(Icons.add_shopping_cart, size: 20,color: Colors.white,),
      //     Icon(Icons.home, size: 20,color: Colors.white),
      //     Icon(Icons.water_drop, size: 20,color: Colors.white),
      //     Icon(Icons.chat, size: 20,color: Colors.white),
      //   ],
      //   onTap: (index) {
      //     setState(() {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => MedicineDetails()),
      //       );
      //     });
      //   },
      // ),
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

