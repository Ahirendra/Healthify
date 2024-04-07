import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthify/doctor/doctor_profile.dart';
import 'package:healthify/user/home_page/doctor_detail.dart';
import 'package:healthify/user/myOrders/myorders.dart';
import 'package:healthify/user/pharmacy/medDetails.dart';
import 'package:healthify/user/pharmacy/meds.dart';
import 'package:healthify/user/notifications/notifications.dart';
import 'package:healthify/user/profile/my_profile.dart';

import '../../video_call/call_page.dart';


class DoctorHomeScreen extends StatefulWidget {
  const DoctorHomeScreen({Key? key}) : super(key: key);

  @override
  State<DoctorHomeScreen> createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {
  String name=" ";
  String Dimage="";
  String spec="";
  final _ref =
  FirebaseFirestore.instance.collection('UpcomingAppointments').where('docID', isEqualTo: FirebaseAuth.instance.currentUser!.uid);
  final TextEditingController _searchController = TextEditingController();
  final navigationKey=GlobalKey<CurvedNavigationBarState>();
  final uid=FirebaseAuth.instance.currentUser?.uid;
  void getUserData() async {
    final userDoc = await FirebaseFirestore.instance
        .collection('Doctor')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();

    if (userDoc.exists) {
      setState(() {
        name = userDoc.data()?['name'] ?? 'Doctor';
        Dimage=userDoc.data()?['image'] ?? 'Doctor';
        spec=userDoc.data()?['spec'] ?? 'Doctor';
      });


    } else {
      print('User document not found.');
    }
  }
  // int index=2;
  // final screens=[
  //   Notifications(),
  //   My_Orders(),
  //   HomeScreen(),
  //   Medicines(),
  //   MedicineDetails(),
  // ];
  @override
  Widget build(BuildContext context) {
    getUserData();
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('My Profile'),
      //   backgroundColor: Colors.white,
      //   actions: [
      //     Icon(
      //       Icons.settings,
      //     ),
      //   ],
      // ),
      body: Stack(
          children : <Widget>[
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.blue[100],
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                          height: 20
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.32,
                        child: Row(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                    padding: EdgeInsets.only(left: 25),
                                    //color: Colors.black,
                                    height: MediaQuery.of(context).size.height,
                                    width: MediaQuery.of(context).size.width * 0.5,
                                    child: Column(
                                        children: [

                                          //SizedBox(width: 300,),
                                          Row(
                                            children: [
                                             //SizedBox(width: 300,),
                                              IconButton(
                                              icon: Icon(Icons.settings, color: Colors.black),
                                              onPressed: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => DocProfile()),
                                              ),
                                            ),
                                ]
                                          ),
                                          SizedBox(
                                              height: 20
                                          ),

                                          SizedBox(
                                              height: 30
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text("Welcome",
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black,
                                                  fontSize:
                                                  MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                      0.049),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text('${name}',
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.black,
                                                  fontSize:
                                                  MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                      0.04),
                                            ),
                                          ),
                                          SizedBox(
                                              height: 3
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text("Let's Get Started!",
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.black,
                                                  fontSize:
                                                  MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                      0.04),
                                            ),
                                          ),
                                        ]
                                    )
                                ),
                              ),

                              Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => MyProfile()),
                                    );
                                  },
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage('$Dimage'),
                                    radius: 70,
                                  ),
                                ),
                              ),
                              // Align(
                              //   alignment: Alignment.topRight,
                              //   child: Container(
                              //     padding: EdgeInsets.only(right: 40),
                              //     height: MediaQuery.of(context).size.height,
                              //     width: MediaQuery.of(context).size.width * 0.5,
                              //     // child: Image(
                              //     //   alignment: Alignment.topRight,
                              //     //   image: AssetImage('assets/images/doc.png'),
                              //     // ),
                              //   ),
                              // )
                            ]
                        ),
                      ),
                    ],
                  ),
                )
            ),
            Positioned(
                top: MediaQuery.of(context).size.height * 0.3,
                child: Container(
                  //padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      //   child: TextField(
                      //     controller: _searchController,
                      //     decoration: InputDecoration(
                      //       hintText: 'Search...',
                      //       // Add a clear button to the search bar,
                      //       suffixIcon: IconButton(
                      //         icon: Icon(Icons.clear),
                      //         onPressed: () => _searchController.clear(),
                      //       ),
                      //       // Add a search icon or button to the search bar
                      //       prefixIcon: IconButton(
                      //         icon: Icon(Icons.search),
                      //         onPressed: () {
                      //           // Perform the search here
                      //         },
                      //       ),
                      //       border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(30.0),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 12, 15, 5),
                          child: Text("Upcoming Appointments",
                            style: GoogleFonts.poppins(
                                //fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize:
                                MediaQuery.of(context)
                                    .size
                                    .width *
                                    0.06),
                          ),
                        ),
                      ),
                      Expanded(
                        child: StreamBuilder(
                          stream: _ref.snapshots(),
                          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            //if(streamSnapshot.hasData){
                              return ListView.builder(
                                  physics: ScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: snapshot.hasData ? (snapshot.data?.docs.length) : 0,
                                  itemBuilder: (_, index)  {

                                        return Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                                            child: Align(
                                                child: Stack(
                                                    children: <Widget>[
                                                      InkWell(
                                                        onTap: () {
                                                          // Navigator.push(
                                                          //   context,
                                                          //   MaterialPageRoute(builder: (context) => DoctorHomeScreen()),
                                                          // );
                                                        },
                                                        child: Container(
                                                          //padding: EdgeInsets.all(5),
                                                          //height: 190,
                                                          decoration: new BoxDecoration(
                                                            // boxShadow: [
                                                            //   BoxShadow(
                                                            //     color: Colors.grey.withOpacity(0.2),
                                                            //     spreadRadius: 1,
                                                            //     blurRadius: 3,
                                                            //     offset: Offset(
                                                            //         1, 2), // changes position of shadow
                                                            //   ),
                                                            // ],
                                                            color: Colors.white,
                                                            shape: BoxShape.rectangle,
                                                            borderRadius:
                                                            BorderRadius.all(Radius.circular(15.0)),
                                                            border: Border.all(color: Colors.grey.shade300),
                                                          ),
                                                          child: Card(
                                                            color: Colors.white,
                                                            //borderOnForeground: true,
                                                            elevation: 0,
                                                            child: Row(
                                                              children: [
                                                                //image
                                                                Container(
                                                                  padding: EdgeInsets.only(left: 10),
                                                                  //color: Colors.lightBlue[100],
                                                                  width: MediaQuery.of(context).size.width * 0.26,
                                                                  height: 100,
                                                                  child: ClipRRect(
                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                    child: Image(
                                                                      //alignment: Alignment.topRight,
                                                                      image: AssetImage((snapshot.data!.docs
                                                                          .elementAt(index)
                                                                          .data()
                                                                      as Map)['Pimage'].toString()),
                                                                      fit: BoxFit.fill,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.of(context).size.width * 0.635,
                                                                  child: Column(
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment.start,
                                                                    children: [
                                                                      SizedBox(
                                                                        height: 5,
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          Padding(
                                                                            padding: const EdgeInsets.fromLTRB(14, 0, 0, 0),
                                                                            child: Column(
                                                                              crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(" ${(snapshot.data!.docs
                                                                                            .elementAt(index)
                                                                                             .data()
                                                                                              as Map)['Pname']
                                                                                               .toString()}",
                                                                                  style: GoogleFonts.poppins(
                                                                                      fontWeight: FontWeight.bold,
                                                                                      color: Colors.black,
                                                                                      fontSize:
                                                                                      MediaQuery.of(context)
                                                                                          .size
                                                                                          .width *
                                                                                          0.05),
                                                                                ),//name
                                                                                // Text("Gyno Issue",
                                                                                //   style: GoogleFonts.poppins(
                                                                                //       fontWeight: FontWeight.w300,
                                                                                //       color: Colors.black,
                                                                                //       fontSize:
                                                                                //       MediaQuery.of(context)
                                                                                //           .size
                                                                                //           .width *
                                                                                //           0.032),
                                                                                // ),//issue
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Spacer(),
                                                                          // Align(
                                                                          //   alignment: Alignment.centerRight,
                                                                          //   child: Icon(
                                                                          //     Icons.bookmark_border_outlined,
                                                                          //     size: 28.0,
                                                                          //     color: Colors.black,
                                                                          //   ),
                                                                          // ),
                                                                          SizedBox(
                                                                            width: 10,
                                                                          )
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        height: 5,
                                                                      ),

                                                                      // date time
                                                                      Padding(
                                                                        padding: const EdgeInsets.fromLTRB(
                                                                            14, 0, 0, 0),
                                                                        child: Text("${(snapshot.data!.docs
        .elementAt(index)
        .data()
    as Map)['date']
        .toString()} | ${(snapshot.data!.docs
        .elementAt(index)
        .data()
    as Map)['time']
        .toString()}",
                                                                          style: GoogleFonts.poppins(
                                                                              fontWeight: FontWeight.w400,
                                                                              color: Colors.black,
                                                                              fontSize: MediaQuery.of(context)
                                                                                  .size
                                                                                  .width *
                                                                                  0.03),
                                                                        ),
                                                                      ),

                                                                      SizedBox(
                                                                        height: 5,
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                                                                        child: Row(
                                                                          children: [
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                                                                child: ElevatedButton(
                                                                                  style: ElevatedButton.styleFrom(
                                                                                    backgroundColor: Colors.white,
                                                                                    shadowColor: Colors.transparent,
                                                                                    elevation: 0,
                                                                                    shape: RoundedRectangleBorder(
                                                                                        borderRadius:
                                                                                        BorderRadius.circular(
                                                                                            30.0),
                                                                                        side: BorderSide(color: Colors.red)),
                                                                                    // minimumSize: Size(
                                                                                    //     50, 37), //////// HERE
                                                                                  ),
                                                                                  onPressed: () {
                                                                                    cancApp((snapshot.data!.docs.elementAt(index).data() as Map)['date'].toString() + " | " + (snapshot.data!.docs.elementAt(index).data() as Map)['time'].toString(),
                                                                                      (snapshot.data!.docs.elementAt(index).data() as Map)['Pname'].toString(),
                                                                                      (snapshot.data!.docs.elementAt(index).data() as Map)['patientID'].toString(),
                                                                                      (snapshot.data!.docs.elementAt(index).data() as Map)['Pimage'].toString(),

                                                                                    );

                                                                                    remove(FirebaseAuth.instance.currentUser!.uid+(snapshot.data!.docs.elementAt(index).data() as Map)['patientID'].toString());
                                                                                  },
                                                                                  child: Text("Cancel Appointment",
                                                                                    style: GoogleFonts.poppins(
                                                                                        fontWeight:
                                                                                        FontWeight.w500,
                                                                                        color: Colors.red,
                                                                                        fontSize: 8),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                                                                child: ElevatedButton(
                                                                                  style: ElevatedButton.styleFrom(
                                                                                    backgroundColor: Colors.blueAccent,
                                                                                    shadowColor: Colors.transparent,
                                                                                    elevation: 0,
                                                                                    shape: RoundedRectangleBorder(
                                                                                        borderRadius:
                                                                                        BorderRadius.circular(
                                                                                            30.0),
                                                                                        side: BorderSide(color: Colors.blueAccent)),
                                                                                    // minimumSize: Size(
                                                                                    //     50, 37), //////// HERE
                                                                                  ),
                                                                                  onPressed: () {
                                                                                    compApp((snapshot.data!.docs.elementAt(index).data() as Map)['date'].toString() + " | " + (snapshot.data!.docs.elementAt(index).data() as Map)['time'].toString(),
                                                                                      (snapshot.data!.docs.elementAt(index).data() as Map)['Pname'].toString(),
                                                                                      (snapshot.data!.docs.elementAt(index).data() as Map)['patientID'].toString(),
                                                                                      (snapshot.data!.docs.elementAt(index).data() as Map)['Pimage'].toString(),

                                                                                    );

                                                                                    remove(FirebaseAuth.instance.currentUser!.uid+(snapshot.data!.docs.elementAt(index).data() as Map)['patientID'].toString());
                                                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => CallPage(callID: "1abcd1",name:(snapshot.data!.docs
        .elementAt(index)
        .data()
    as Map)['docName']
        .toString(),uid:uid as String)));},
                                                                                  child: Text("Join Meeting",
                                                                                    style: GoogleFonts.poppins(
                                                                                        fontWeight:
                                                                                        FontWeight.w500,
                                                                                        color: Colors.white,
                                                                                        fontSize:
                                                                                        10),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height: 10,
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ])),
                                          ),
                                        );
                                      // }//if

                                  }//item builder
                                  );
                            }
                            )

                        ),

                    ],
                  ),
                )
            )
          ]
      ),
    );
  }
  compApp(String dateTime, String Pname, String patientID, String Pimage) async{
    await FirebaseFirestore.instance.collection('CompletedAppointments').doc(patientID+FirebaseAuth.instance.currentUser!.uid).set(
        {
          'patientID':patientID,
          'Pimage':Pimage,
          'docID':FirebaseAuth.instance.currentUser?.uid,
          'docName':name,
          'datetime':dateTime,
          'meetID':'',
          'Dimage':Dimage,
          'spec':spec,
          'Pname':Pname,
        }
    );
  }
  cancApp(String dateTime, String Pname, String patientID, String Pimage) async{
    await FirebaseFirestore.instance.collection('CanceledAppointments').doc(patientID+FirebaseAuth.instance.currentUser!.uid).set(
        {
          'patientID':patientID,
          'Pimage':Pimage,
          'docID':FirebaseAuth.instance.currentUser?.uid,
          'docName':name,
          'datetime':dateTime,
          'meetID':'',
          'Dimage':Dimage,
          'spec':spec,
          'Pname':Pname,
        }
    );
  }
  remove(String documentId) async {
    try {
      await FirebaseFirestore.instance.collection('UpcomingAppointments').doc(documentId).delete();
      print('Document removed from collection');
    } catch (e) {
      print('Error removing document from collection1: $e');
    }
  }
}

