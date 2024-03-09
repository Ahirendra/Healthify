import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:google_fonts/google_fonts.dart';
class DocAppointmentDetails extends StatefulWidget {
  DocumentSnapshot patientToView;
  DocAppointmentDetails({super.key, required this.patientToView});
  @override
  _appD createState() => _appD();
}

class _appD extends State<DocAppointmentDetails> {
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
            title: Text('My Appointment',
                style: TextStyle(
                  color: Colors.black,

                ),

                textAlign: TextAlign.center)
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 5,),
                  Container(
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
                      borderRadius:BorderRadius.all(Radius.circular(15.0)),
                      //border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Card(
                      color: Colors.white,
                      //borderOnForeground: true,
                      elevation: 0,
                      child: Row(
                        children: [
                          Container(
                            //padding: EdgeInsets.only(left: 10),
                            //color: Colors.lightBlue[100],
                            width: MediaQuery.of(context).size.width * 0.28,
                            height: 105,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image(
                                //alignment: Alignment.topRight,
                                image: AssetImage((widget.patientToView.data() as Map)['Pimage'].toString()),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
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
                                          SizedBox(width: 40,),
                                          Text((widget.patientToView.data() as Map)['Pname'].toString(),
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                                fontSize:
                                                MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.05),
                                          ),
                                          // Text("Neurologist",
                                          //   style: GoogleFonts.poppins(
                                          //       fontWeight: FontWeight.w300,
                                          //       color: Colors.black,
                                          //       fontSize:
                                          //       MediaQuery.of(context)
                                          //           .size
                                          //           .width *
                                          //           0.035),
                                          // ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 40,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.fromLTRB(
                                //       14, 0, 0, 0),
                                //   child: Text("4.8*",
                                //     style: GoogleFonts.poppins(
                                //         fontWeight: FontWeight.w500,
                                //         color: Colors.blueAccent,
                                //         fontSize: MediaQuery.of(context)
                                //             .size
                                //             .width *
                                //             0.038),
                                //   ),
                                // ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    padding: EdgeInsets.all(8),
                    width: 800,
                    //color: Colors.yellow,
                    //padding: EdgeInsets.all(25),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment:
                      // CrossAxisAlignment.start,

                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text("Scheduled Appointments",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize:
                              MediaQuery.of(context)
                                  .size.width * 0.05),
                        ),
                        SizedBox(
                          height: 15,
                          //width: 300,
                        ),
                        Row(
                          children: [
                            Text("Date & Time",
                              style: GoogleFonts.poppins(
                                //fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize:
                                  MediaQuery.of(context)
                                      .size.width * 0.035),
                            ),

                            SizedBox(
                                height: 5,
                                width: 40
                            ),
                            Text((widget.patientToView.data() as Map)['datetime'].toString(),
                              style: GoogleFonts.poppins(
                                //fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize:
                                  MediaQuery.of(context)
                                      .size.width * 0.035),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 9,
                          //width: 250,
                        ),
                        // Row(
                        //   children: [
                        //     //Column(
                        //     //crossAxisAlignment:
                        //     //CrossAxisAlignment.start,
                        //     //children: [
                        //     Text("Time",
                        //       style: GoogleFonts.poppins(
                        //         //fontWeight: FontWeight.w300,
                        //           color: Colors.black,
                        //           fontSize:
                        //           MediaQuery.of(context)
                        //               .size.width * 0.035),
                        //     ),
                        //
                        //     SizedBox(
                        //         height: 5,
                        //         width: MediaQuery.of(context).size.width * 0.45
                        //     ),
                        //     //
                        //     Text("23:26AM",
                        //       style: GoogleFonts.poppins(
                        //         //fontWeight: FontWeight.w500,
                        //           color: Colors.black,
                        //           fontSize:
                        //           MediaQuery.of(context)
                        //               .size.width * 0.035),
                        //     ),
                        //     // SizedBox(
                        //     //   height: 10,
                        //     // )
                        //   ],
                        //   //),
                        //   //],
                        // ),
                        SizedBox(
                          height: 9,
                          //width: 300,
                        ),
                        Row(
                          children: [
                            Text("Booking For",
                              style: GoogleFonts.poppins(
                                //fontWeight: FontWeight.w300,
                                  color: Colors.black,
                                  fontSize:
                                  MediaQuery.of(context)
                                      .size.width * 0.035),
                            ),


                            SizedBox(
                                height: 5,
                                width: MediaQuery.of(context).size.width * 0.25
                            ),
                            Text((widget.patientToView.data() as Map)['Pname'].toString(),
                              style: GoogleFonts.poppins(
                                //fontWeight: FontWeight.w300,
                                  color: Colors.black,
                                  fontSize:
                                  MediaQuery.of(context)
                                      .size.width * 0.035),
                            ),
                            //
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   width: 800,
                  //   //color: Colors.yellow,
                  //   //padding: EdgeInsets.all(25),
                  //   child: Column(
                  //     //mainAxisAlignment: MainAxisAlignment.start,
                  //     // crossAxisAlignment:
                  //     // CrossAxisAlignment.start,
                  //
                  //     children: [
                  //       SizedBox(
                  //         height: 30,
                  //       ),
                  //       Text("Patient's Info",
                  //         style: GoogleFonts.poppins(
                  //             fontWeight: FontWeight.w500,
                  //             color: Colors.black,
                  //             fontSize:
                  //             MediaQuery.of(context)
                  //                 .size.width * 0.05),
                  //       ),
                  //       SizedBox(
                  //         height: 12,
                  //         //width: 300,
                  //       ),
                  //       Row(
                  //         children: [
                  //           Text("Full Name",
                  //             style: GoogleFonts.poppins(
                  //               //fontWeight: FontWeight.w500,
                  //                 color: Colors.black,
                  //                 fontSize:
                  //                 MediaQuery.of(context)
                  //                     .size.width * 0.035),
                  //           ),
                  //
                  //           SizedBox(
                  //               height: 5,
                  //               width: MediaQuery.of(context).size.width * 0.35
                  //           ),
                  //           Text("Esther Howard",
                  //             style: GoogleFonts.poppins(
                  //               //fontWeight: FontWeight.w500,
                  //                 color: Colors.black,
                  //                 fontSize:
                  //                 MediaQuery.of(context)
                  //                     .size.width * 0.035),
                  //           ),
                  //         ],
                  //       ),
                  //       SizedBox(
                  //         height: 9,
                  //         //width: 250,
                  //       ),
                  //       Row(
                  //         children: [
                  //           //Column(
                  //           //crossAxisAlignment:
                  //           //CrossAxisAlignment.start,
                  //           //children: [
                  //           Text("Gender",
                  //             style: GoogleFonts.poppins(
                  //               //fontWeight: FontWeight.w300,
                  //                 color: Colors.black,
                  //                 fontSize:
                  //                 MediaQuery.of(context)
                  //                     .size.width * 0.035),
                  //           ),
                  //
                  //           SizedBox(
                  //               height: 5,
                  //               width: MediaQuery.of(context).size.width * 0.45
                  //           ),
                  //           //
                  //           Text("Male",
                  //             style: GoogleFonts.poppins(
                  //               //fontWeight: FontWeight.w500,
                  //                 color: Colors.black,
                  //                 fontSize:
                  //                 MediaQuery.of(context)
                  //                     .size.width * 0.035),
                  //           ),
                  //           // SizedBox(
                  //           //   height: 10,
                  //           // )
                  //         ],
                  //         //),
                  //         //],
                  //       ),
                  //       SizedBox(
                  //         height: 9,
                  //         //width: 300,
                  //       ),
                  //       Row(
                  //         children: [
                  //           Text("Age",
                  //             style: GoogleFonts.poppins(
                  //               //fontWeight: FontWeight.w300,
                  //                 color: Colors.black,
                  //                 fontSize:
                  //                 MediaQuery.of(context)
                  //                     .size.width * 0.035),
                  //           ),
                  //
                  //
                  //           SizedBox(
                  //               height: 5,
                  //               width: MediaQuery.of(context).size.width * 0.55
                  //           ),
                  //           Text("27",
                  //             style: GoogleFonts.poppins(
                  //               //fontWeight: FontWeight.w300,
                  //                 color: Colors.black,
                  //                 fontSize:
                  //                 MediaQuery.of(context)
                  //                     .size.width * 0.035),
                  //           ),
                  //           //
                  //           SizedBox(
                  //             height: 10,
                  //           ),
                  //         ],
                  //       ),
                  //       SizedBox(
                  //         height: 9,
                  //         //width: 300,
                  //       ),
                  //       Row(
                  //         children: [
                  //           Text("Problem",
                  //             style: GoogleFonts.poppins(
                  //               //fontWeight: FontWeight.w300,
                  //                 color: Colors.black,
                  //                 fontSize:
                  //                 MediaQuery.of(context)
                  //                     .size.width * 0.035),
                  //           ),
                  //
                  //
                  //           SizedBox(
                  //               height: 5,
                  //               width: MediaQuery.of(context).size.width * 0.40
                  //           ),
                  //           Text("Jaundice",
                  //             style: GoogleFonts.poppins(
                  //               //fontWeight: FontWeight.w300,
                  //                 color: Colors.black,
                  //                 fontSize:
                  //                 MediaQuery.of(context)
                  //                     .size.width * 0.035),
                  //           ),
                  //           //
                  //           SizedBox(
                  //             height: 10,
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //
                  //   ),
                  // ),
                  SizedBox(
                    height: 100,
                  ),

                  ElevatedButton(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 50),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blueAccent,
                    ),
                    child: const Text(
                      "Upload Prescription",
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }

}