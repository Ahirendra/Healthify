import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pharmacy/medDetails.dart';
class My_Orders extends StatefulWidget{
  @override
  _myOrders createState() => _myOrders();

}

class _myOrders extends State<My_Orders>{
  final ref = FirebaseFirestore.instance.collection("Patient").doc(FirebaseAuth.instance.currentUser?.uid).collection('MyOrders');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {Navigator.pop(context);},
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text('My Orders',
              style: TextStyle(
                  color: Colors.black
              ),
              textAlign: TextAlign.center)
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: StreamBuilder(
        stream: ref.snapshots(),
    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
      return ListView.builder(
        //scrollDirection: Axis.horizontal,
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: snapshot.hasData ? (snapshot.data?.docs.length) : 0,
          itemBuilder: (_, index) {
            return Container(
              color: Colors.white,
              padding: EdgeInsets.all(18),
              child: Column(
                children: [
                  Row(
                    //Image(image: AssetImage('assets/images/medF.png'),height: 280,width: 134,),
                    children: [
                      Container(
                        //padding: EdgeInsets.all(8),
                          height: 100,
                          width: 100,
                          //color: Colors.grey,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(13.0)),
                            color: Colors.blue[50],
                          ),
                          child: Image.asset((snapshot.data!.docs.elementAt(index).data() as Map)['image'].toString())),
                      SizedBox(width: 15,),
                      Column(
                        children: [
                          Container(
                            width: 239,
                            //color:Colors.blue,
                            child: Text(
                              (snapshot.data!.docs.elementAt(index).data() as Map)['med'].toString(), style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20,
                            ),
                              //textAlign: TextAlign.right ,
                            ),
                          ),
                          SizedBox(height: 40,),
                          Container(
                            width: 239,
                            //color:Colors.blue,
                            child: Text((snapshot.data!.docs.elementAt(index).data() as Map)['quantity'].toString(), style: GoogleFonts.poppins(
                              //fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                              //textAlign: TextAlign.right ,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text('ID Order', style: GoogleFonts.poppins(
                        fontSize: 18,
                      ),),
                      Spacer(),
                      Text((snapshot.data!.docs.elementAt(index).data() as Map)['orderID'].toString().substring(0,8).toUpperCase(), style: GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                      ),),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text('Total Price', style: GoogleFonts.poppins(
                        fontSize: 18,
                      ),),
                      Spacer(),
                      Image(image: AssetImage('assets/images/rupee.jpg'),
                        height: 30,
                        width: 30,),
                      Text((snapshot.data!.docs.elementAt(index).data() as Map)['tot_price'].toString(), style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      // TextButton(
                      //   child: Text('Rate the medicine',style: TextStyle(
                      //     color: Colors.blueAccent,
                      //   ),),
                      //   style: ButtonStyle(
                      //       backgroundColor: MaterialStateProperty.all(Colors.white)),
                      //   onPressed: () {},
                      // ),
                      SizedBox(width: 250,),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: StadiumBorder(),
                              backgroundColor: (Colors.blue[600]),
                              //foregroundColor: Colors.blueAccent,
                              minimumSize: Size(30, 36)
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  MedicineDetails(docToView: snapshot
                                      .data!.docs
                                      .elementAt(
                                      index))),
                            );
                          },
                          child: Text("Buy Again", style: TextStyle(
                              fontSize: 15))
                      ),
                    ],
                  ),

                ],
              ),
            );
          }
      );
    }
        )
        )
    );
  }
}