import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Cancelled extends StatefulWidget {
  const Cancelled({Key? key}) : super(key: key);

  @override
  State<Cancelled> createState() => _CancelledAppointmentState();
}

class _CancelledAppointmentState extends State<Cancelled> {
  final ref = FirebaseFirestore.instance.collection("CanceledAppointments").where('docID', isEqualTo: FirebaseAuth.instance.currentUser!.uid);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        child: Expanded(
          child: StreamBuilder(
            stream: ref.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
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
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(5, 0, 5, 8),
                                            child: Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Appointment Cancelled",
                                                      style: GoogleFonts.poppins(
                                                          fontWeight: FontWeight.w500,
                                                          color: Colors.red,
                                                          fontSize:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                              0.035),
                                                    ),

                                                  ],
                                                ),
                                                Spacer(),
                                                Icon(
                                                  Icons.more_vert,
                                                  size: 25.0,
                                                  color: Colors.grey,
                                                ),
                                              ],
                                            ),
                                          ),
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
                                                    as Map)['Pimage']
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
                                                              as Map)['Pname']
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
                                                              SizedBox(
                                                                height: 3,
                                                              ),
                                                              Text((snapshot.data!.docs
                                                                  .elementAt(index)
                                                                  .data()
                                                              as Map)['datetime']
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


                                                              // Text((snapshot.data!.docs
                                                              //     .elementAt(index)
                                                              //     .data()
                                                              // as Map)['spec']
                                                              //     .toString(),
                                                              //   style: GoogleFonts.poppins(
                                                              //       fontWeight: FontWeight.w500,
                                                              //       color: Colors.grey,
                                                              //       fontSize:
                                                              //       MediaQuery.of(context)
                                                              //           .size
                                                              //           .width *
                                                              //           0.032),
                                                              // ),
                                                            ],
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
                                                      // child: Row(
                                                      //   children: [
                                                      //     Icon(
                                                      //       Icons.star,
                                                      //       size: 18.0,
                                                      //       color: Colors.yellow,
                                                      //     ),
                                                      //     Text("4.8 (4,279 reviews)",
                                                      //       style: GoogleFonts.poppins(
                                                      //           fontWeight: FontWeight.w500,
                                                      //           color: Colors.black45,
                                                      //           fontSize: MediaQuery.of(context)
                                                      //               .size
                                                      //               .width *
                                                      //               0.033),
                                                      //     ),
                                                      //   ],
                                                      // ),
                                                    ),

                                                    SizedBox(
                                                      height: 10,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
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
                  }
                  );
            },
          ),
      ),),
    );
  }
}