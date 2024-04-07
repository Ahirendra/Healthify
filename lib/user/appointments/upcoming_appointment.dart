import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthify/video_call/call_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthify/user/home_page/doctor_detail.dart';
import 'package:healthify/user/profile/my_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class UpcomingAppointment extends StatefulWidget {
  const UpcomingAppointment({Key? key}) : super(key: key);
  @override
  State<UpcomingAppointment> createState() => _UpcomingAppointmentState();
}

class _UpcomingAppointmentState extends State<UpcomingAppointment> {
  String name = "";
  String Pimage="";
  var uid = FirebaseAuth.instance.currentUser!.uid;
  final ref = FirebaseFirestore.instance.collection("UpcomingAppointments").where('patientID', isEqualTo: FirebaseAuth.instance.currentUser!.uid);

  void getUserData() async {
    final userDoc = await FirebaseFirestore.instance
        .collection('Patient')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();

    if (userDoc.exists) {
      setState(() {
        name = userDoc.data()?['name'] ?? 'Default Name';
        Pimage=userDoc.data()?['Pimage'] ?? 'Default Name';
      });


    } else {
      print('User document not found.');
    }
  }
  @override
  Widget build(BuildContext context) {
    getUserData();
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(child: Expanded(
        child: StreamBuilder(
          stream: ref.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return ListView.builder(
                physics: ScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: snapshot.hasData ? (snapshot.data?.docs.length) : 0,
                itemBuilder: (_, index) {
                  //bool expanded = false;
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: Align(
                          child: Stack(children: <Widget>[
                            InkWell(onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => DoctorDetail()),
                              // );
                            },
                              child: Container(
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
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Card(
                                    color: Colors.white,
                                    //borderOnForeground: true,
                                    elevation: 0,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.fromLTRB(8, 8, 5, 10),
                                              //color: Colors.lightBlue[100],
                                              width: MediaQuery.of(context).size.width * 0.26,
                                              height: 105,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(10.0),
                                                child: Image(
                                                  //alignment: Alignment.topRight,
                                                  image: AssetImage((snapshot.data!.docs
                                                      .elementAt(index)
                                                      .data()
                                                  as Map)['Dimage']
                                                      .toString()),
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
                                                            Text((snapshot.data!.docs
                                                                .elementAt(index)
                                                                .data()
                                                            as Map)['docName']
                                                                .toString(),
                                                              style: GoogleFonts.poppins(
                                                                  fontWeight: FontWeight.w500,
                                                                  color: Colors.black,
                                                                  fontSize:
                                                                  MediaQuery.of(context)
                                                                      .size
                                                                      .width *
                                                                      0.048),
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text((snapshot.data!.docs
                                                                .elementAt(index)
                                                                .data()
                                                            as Map)['spec']
                                                                .toString(),
                                                              style: GoogleFonts.poppins(
                                                                  fontWeight: FontWeight.w500,
                                                                  color: Colors.grey,
                                                                  fontSize:
                                                                  MediaQuery.of(context)
                                                                      .size
                                                                      .width *
                                                                      0.032),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      Align(
                                                        alignment: Alignment.topRight,
                                                        child: Icon(
                                                          Icons.chat_outlined,
                                                          size: 25.0,
                                                          color: Colors.blueAccent,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(
                                                        14, 0, 0, 0),
                                                    child: Text((snapshot.data!.docs
                                                        .elementAt(index)
                                                        .data()
                                                    as Map)['date']
                                                        .toString() + " | " + (snapshot.data!.docs
                                                        .elementAt(index)
                                                        .data()
                                                    as Map)['time']
                                                        .toString(),
                                                      style: GoogleFonts.poppins(
                                                          fontWeight: FontWeight.w500,
                                                          color: Colors.grey,
                                                          fontSize: MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                              0.032),
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
                                                              32.0),
                                                          side: BorderSide(color: Colors.blueAccent)),
                                                      minimumSize: Size(
                                                          50, 37), //////// HERE
                                                    ),
                                                    onPressed: () {
                                                      cancApp((snapshot.data!.docs.elementAt(index).data() as Map)['date'].toString() + " | " + (snapshot.data!.docs.elementAt(index).data() as Map)['time'].toString(),
                                                        (snapshot.data!.docs.elementAt(index).data() as Map)['docName'].toString(),
                                                        (snapshot.data!.docs.elementAt(index).data() as Map)['docID'].toString(),
                                                        (snapshot.data!.docs.elementAt(index).data() as Map)['Dimage'].toString(),
                                                        (snapshot.data!.docs.elementAt(index).data() as Map)['spec'].toString(),
                                                      );

                                                      remove((snapshot.data!.docs.elementAt(index).data() as Map)['docID'].toString()+FirebaseAuth.instance.currentUser!.uid);
                                                    },
                                                    child: Text("Cancel Appointment",
                                                      style: GoogleFonts.poppins(
                                                          fontWeight:
                                                          FontWeight.w500,
                                                          color: Colors.blueAccent,
                                                          fontSize:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                              0.03),
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
                                                              32.0),
                                                          side: BorderSide(color: Colors.blueAccent)),
                                                      minimumSize: Size(
                                                          50, 37), //////// HERE
                                                    ),
                                                    onPressed: () {
                                                      compApp((snapshot.data!.docs.elementAt(index).data() as Map)['date'].toString() + " | " + (snapshot.data!.docs.elementAt(index).data() as Map)['time'].toString(),
                                                          (snapshot.data!.docs.elementAt(index).data() as Map)['docName'].toString(),
                                                        (snapshot.data!.docs.elementAt(index).data() as Map)['docID'].toString(),
                                                          (snapshot.data!.docs.elementAt(index).data() as Map)['Dimage'].toString(),
                                                          (snapshot.data!.docs.elementAt(index).data() as Map)['spec'].toString(),
                                                      );

                                                      remove((snapshot.data!.docs.elementAt(index).data() as Map)['docID'].toString()+FirebaseAuth.instance.currentUser!.uid);

                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => CallPage(callID: "1abcd1", name: name, uid: uid)));},
                                                    child: Text("Join Meeting",
                                                      style: GoogleFonts.poppins(
                                                          fontWeight:
                                                          FontWeight.w500,
                                                          color: Colors.white,
                                                          fontSize:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                              0.03),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ])),
                    ),
                  );
                });
          }
        ),
      ),),
    );
  }
  compApp(String dateTime, String docName, String docID, String image, String spec) async{
    await FirebaseFirestore.instance.collection('CompletedAppointments').doc(docID+FirebaseAuth.instance.currentUser!.uid).set(
        {
          'patientID':FirebaseAuth.instance.currentUser?.uid,
          'Pimage':Pimage,
          'docID':docID,
          'docName':docName,
          'datetime':dateTime,
          'meetID':'',
          'Dimage':image,
          'spec':spec,
          'Pname':name,
        }
    );
  }
  cancApp(String dateTime, String docName, String docID, String image, String spec) async{
    await FirebaseFirestore.instance.collection('CanceledAppointments').doc(docID+FirebaseAuth.instance.currentUser!.uid).set(
        {
          'patientID':FirebaseAuth.instance.currentUser?.uid,
          'Pimage':Pimage,
          'docID':docID,
          'docName':docName,
          'datetime':dateTime,
          'meetID':'',
          'Dimage':image,
          'spec':spec,
          'Pname':name,
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