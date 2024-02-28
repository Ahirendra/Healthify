import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class UpcomingAppointment extends StatefulWidget {
  const UpcomingAppointment({Key? key}) : super(key: key);

  @override
  State<UpcomingAppointment> createState() => _UpcomingAppointmentState();
}

class _UpcomingAppointmentState extends State<UpcomingAppointment> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(child: Expanded(
        child: ListView.builder(
            physics: ScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 7,
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
                                              image: AssetImage('assets/images/doc2.png'),
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
                                                        Text("Dr. Randy Wigham",
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
                                                        Text("General Medical Checkup",
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
                                                child: Text("Wed, 17 May  |   08:30 AM",
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
                                                onPressed: () {},
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
                                                onPressed: () {},
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
            }),
      ),),
    );
  }
}