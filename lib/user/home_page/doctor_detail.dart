import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class DoctorDetail extends StatefulWidget {
  DocumentSnapshot docToView;
  DoctorDetail({super.key, required this.docToView});
  @override
  State<DoctorDetail> createState() => _DoctorDetailState();
}

class _DoctorDetailState extends State<DoctorDetail> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {Navigator.pop(context);  },
            child: Icon(Icons.arrow_back_ios)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text("Doctor Detail",
    style: GoogleFonts.poppins(
    fontWeight: FontWeight.w500,)
        ),
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
                    borderRadius:
                    BorderRadius.all(Radius.circular(15.0)),
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
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image(
                              //alignment: Alignment.topRight,
                              image: AssetImage((widget.docToView.data() as Map)['image'].toString()),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
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
                                        Text((widget.docToView.data() as Map)['name'].toString(),
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                              fontSize:
                                              MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.05),
                                        ),
                                        Text((widget.docToView.data() as Map)['spec'].toString(),
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w300,
                                              color: Colors.black,
                                              fontSize:
                                              MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.035),
                                        ),
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
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 18.0,
                                      color: Colors.yellow,
                                    ),
                                    Text((widget.docToView.data() as Map)['rating'].toString(),
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.blueAccent,
                                          fontSize: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.038),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    14, 0, 0, 0),
                                child: Text((widget.docToView.data() as Map)['exp'].toString(),
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
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
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("About",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: MediaQuery.of(context)
                              .size
                              .width *
                              0.05),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text((widget.docToView.data() as Map)['about'].toString(),
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                        fontSize: MediaQuery.of(context)
                            .size
                            .width *
                            0.032),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  //padding: EdgeInsets.only(right: 25),
                  height: MediaQuery.of(context).size.height * 0.118,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: ListView.builder(
                      physics: ScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 15,
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
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
                              BorderRadius.all(Radius.circular(12.0)),
                              border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Text("Mon",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black54,
                                      fontSize: MediaQuery.of(context)
                                          .size
                                          .width *
                                          0.03),
                                ),
                                Text("21",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: MediaQuery.of(context)
                                          .size
                                          .width *
                                          0.055),
                                ),
                              ],
                            ),
                          )
                          ),
                        );
                      }
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: GridView.count(
                        crossAxisCount: 3,
                      childAspectRatio: (50 / 20),
                        children: List.generate(9, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              decoration: new BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              //margin: const EdgeInsets.all(10),
                              child: Center(
                                child: Text(
                                  '10:00 AM',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    fontSize: MediaQuery.of(context).size.width * 0.035,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                ),
                    ),
                  )
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: 55,
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Book Appointment",
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.grey.shade500;
                          }
                          return Colors.blueAccent;
                        }),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)))),
                  ),
                )
              ]
            ),
          ),
        ),
      ),

    );
  }
}