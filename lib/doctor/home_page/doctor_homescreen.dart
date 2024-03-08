import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthify/user/home_page/doctor_detail.dart';
import 'package:healthify/user/myOrders/myorders.dart';
import 'package:healthify/user/pharmacy/medDetails.dart';
import 'package:healthify/user/pharmacy/meds.dart';
import 'package:healthify/user/notifications/notifications.dart';
import 'package:healthify/user/profile/my_profile.dart';


class DoctorHomeScreen extends StatefulWidget {
  const DoctorHomeScreen({Key? key}) : super(key: key);

  @override
  State<DoctorHomeScreen> createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {

  final TextEditingController _searchController = TextEditingController();
  final navigationKey=GlobalKey<CurvedNavigationBarState>();
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
    return Scaffold(
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
                                          SizedBox(
                                              height: 50
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
                                            child: Text("Dr. Sameera!",
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
                                    backgroundImage: AssetImage('assets/images/pic.jpg'),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            // Add a clear button to the search bar,
                            suffixIcon: IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () => _searchController.clear(),
                            ),
                            // Add a search icon or button to the search bar
                            prefixIcon: IconButton(
                              icon: Icon(Icons.search),
                              onPressed: () {
                                // Perform the search here
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                          child: Text("Upcoming Appointments",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
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
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => DoctorHomeScreen()),
                                          );
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
                                            child: Card(
                                              color: Colors.white,
                                              //borderOnForeground: true,
                                              elevation: 0,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.only(left: 10),
                                                    //color: Colors.lightBlue[100],
                                                    width: MediaQuery.of(context).size.width * 0.26,
                                                    height: 100,
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(10.0),
                                                      child: Image(
                                                        //alignment: Alignment.topRight,
                                                        image: AssetImage('assets/images/profile1.png'),
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
                                                                  Text("Patient Ruchira",
                                                                    style: GoogleFonts.poppins(
                                                                        fontWeight: FontWeight.w500,
                                                                        color: Colors.black,
                                                                        fontSize:
                                                                        MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                            0.05),
                                                                  ),
                                                                  Text("Gyno Issue",
                                                                    style: GoogleFonts.poppins(
                                                                        fontWeight: FontWeight.w300,
                                                                        color: Colors.black,
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
                                                              alignment: Alignment.centerRight,
                                                              child: Icon(
                                                                Icons.bookmark_border_outlined,
                                                                size: 28.0,
                                                                color: Colors.black,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            )
                                                          ],
                                                        ),
                                                        // SizedBox(
                                                        //   height: 5,
                                                        // ),
                                                        Padding(
                                                          padding: const EdgeInsets.fromLTRB(
                                                              14, 0, 0, 0),
                                                          child: Text("Wed, 17 May | 08:30 AM",
                                                            style: GoogleFonts.poppins(
                                                                fontWeight: FontWeight.w400,
                                                                color: Colors.black,
                                                                fontSize: MediaQuery.of(context)
                                                                    .size
                                                                    .width *
                                                                    0.03),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.fromLTRB(
                                                              12, 0, 0, 0),
                                                          child: Row(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                EdgeInsets.only(right: 10),
                                                                child: ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                    backgroundColor: Colors.blue[100],
                                                                    //shadowColor: Colors.grey,
                                                                    elevation: 3,
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                        BorderRadius.circular(
                                                                            32.0)),
                                                                    minimumSize: Size(
                                                                        50, 30), //////// HERE
                                                                  ),
                                                                  onPressed: () {},
                                                                  child: Text("Approve",
                                                                    style: GoogleFonts.poppins(
                                                                        fontWeight:
                                                                        FontWeight.w400,
                                                                        color: Colors.black,
                                                                        fontSize:
                                                                        MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                            0.025),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                EdgeInsets.only(right: 35),
                                                                child: ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                    backgroundColor: Colors.blue[100],
                                                                    //shadowColor: Colors.grey,
                                                                    elevation: 3,
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                        BorderRadius.circular(
                                                                            32.0)),
                                                                    minimumSize: Size(
                                                                        50, 30), //////// HERE
                                                                  ),
                                                                  onPressed: () {},
                                                                  child: Text("Cancel",
                                                                    style: GoogleFonts.poppins(
                                                                        fontWeight:
                                                                        FontWeight.w400,
                                                                        color: Colors.black,
                                                                        fontSize:
                                                                        MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                            0.025),
                                                                  ),
                                                                ),
                                                              ),
                                                              // ElevatedButton(
                                                              //   style: ElevatedButton.styleFrom(
                                                              //     backgroundColor: Colors.lightBlue[100],
                                                              //     //shadowColor: Colors.grey,
                                                              //     elevation: 3,
                                                              //     shape: RoundedRectangleBorder(
                                                              //         borderRadius:
                                                              //         BorderRadius.circular(
                                                              //             32.0)),
                                                              //     minimumSize:
                                                              //     Size(50, 30), //////// HERE
                                                              //   ),
                                                              //   onPressed: () {},
                                                              //   child: Text(
                                                              //     'View Details',
                                                              //     style: GoogleFonts.poppins(
                                                              //         fontWeight: FontWeight.w600,
                                                              //         color: Colors.black,
                                                              //         fontSize:
                                                              //         MediaQuery.of(context)
                                                              //             .size
                                                              //             .width *
                                                              //             0.035),
                                                              //   ),
                                                              // ),
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
                            }),
                      ),
                    ],
                  ),
                )
            )
          ]
      ),
    );
  }
}