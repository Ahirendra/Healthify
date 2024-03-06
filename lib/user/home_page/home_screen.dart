import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthify/user/home_page/doctor_detail.dart';
import 'package:healthify/user/profile/my_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ref = FirebaseFirestore.instance.collection("Doctor");
  String name = "";
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
  void getUserData() async {
    final userDoc = await FirebaseFirestore.instance
        .collection('Patient')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();

    if (userDoc.exists) {
      setState(() {
        name = userDoc.data()?['name'] ?? 'Default Name';
      });


    } else {
      print('User document not found.');
    }
  }

  @override
  Widget build(BuildContext context) {
    getUserData();
    return Scaffold(
      body: Stack(
          children : <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.blue[50],
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
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
                                      height: 20
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => MyProfile()),
                                        );
                                      },
                                      child: CircleAvatar(
                                          backgroundImage: AssetImage('assets/images/pic.jpg'),
                                        radius: 30,
                                        ),
                                    ),
                                  ),
                                  SizedBox(
                                      height: 8
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
                                              0.042),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('$name',
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
                                      height: 5
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("How are you feeling today?",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w300,
                                          color: Colors.grey,
                                          fontSize:
                                          MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.03),
                                    ),
                                  ),
                                ]
                              )
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              padding: EdgeInsets.only(right: 40),
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Image(
                                //alignment: Alignment.topRight,
                                image: AssetImage('assets/images/doc.png'),
                              ),
                            ),
                          )
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
                padding: EdgeInsets.only(bottom: 25),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.white,
                ),
                height: MediaQuery.of(context).size.height * 0.72,
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
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 8),
                        child: Text("Top Doctors",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize:
                              MediaQuery.of(context)
                                  .size
                                  .width *
                                  0.05),
                        ),
                      ),
                    ),
                    Expanded(
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
                                            Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => DoctorDetail(docToView: snapshot
                                                .data!.docs
                                                .elementAt(
                                                index))),
                                          );
                                            },
                                            child: Container(
                                              decoration: new BoxDecoration(
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
                                                      padding: EdgeInsets.only(left: 5),
                                                      //color: Colors.lightBlue[100],
                                                      width: MediaQuery.of(context).size.width * 0.25,
                                                      height: 100,
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(10.0),
                                                        child: Image(
                                                          //alignment: Alignment.topRight,
                                                          image: AssetImage((snapshot.data!.docs
                                                              .elementAt(index)
                                                              .data()
                                                          as Map)['image']
                                                              .toString()),
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: MediaQuery.of(context).size.width * 0.65,
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
                                                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                  CrossAxisAlignment.start,
                                                                  children: [
                                                                    Text((snapshot.data!.docs
                                                                    .elementAt(index)
                                                                    .data()
                                                                as Map)['name']
                                                        .toString(),
                                                                      style: GoogleFonts.poppins(
                                                                          fontWeight: FontWeight.w500,
                                                                          color: Colors.black,
                                                                          fontSize:
                                                                          MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                              0.05),
                                                                    ),
                                                                    Text((snapshot.data!.docs
                                                                        .elementAt(index)
                                                                        .data()
                                                                    as Map)['spec']
                                                                        .toString(),
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
                                                              // SizedBox(
                                                              //   width: 10,
                                                              // )
                                                            ],
                                                          ),
                                                          // SizedBox(
                                                          //   height: 5,
                                                          // ),
                                                          Padding(
                                                            padding: const EdgeInsets.fromLTRB(
                                                                10, 0, 0, 0),
                                                            child: Row(
                                                              children: [
                                                                Icon(
                                                                  Icons.star,
                                                                  size: 18.0,
                                                                  color: Colors.yellow,
                                                                ),
                                                                Text((snapshot.data!.docs
                                                                    .elementAt(index)
                                                                    .data()
                                                                as Map)['rating']
                                                                    .toString(),
                                                                  style: GoogleFonts.poppins(
                                                                      fontWeight: FontWeight.w400,
                                                                      color: Colors.black,
                                                                      fontSize: MediaQuery.of(context)
                                                                          .size
                                                                          .width *
                                                                          0.03),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.fromLTRB(
                                                                10, 0, 0, 0),
                                                            child: Row(
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                  EdgeInsets.only(right: 8),
                                                                  child: ElevatedButton(
                                                                    style: ElevatedButton.styleFrom(
                                                                      backgroundColor: Colors.blue[50],
                                                                      //shadowColor: Colors.grey,
                                                                      elevation: 3,
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius:
                                                                          BorderRadius.circular(
                                                                              30.0)),
                                                                      minimumSize: Size(
                                                                          30, 30), //////// HERE
                                                                    ),
                                                                    onPressed: () {},
                                                                    child: Text((snapshot.data!.docs
                                                                        .elementAt(index)
                                                                        .data()
                                                                    as Map)['degree']
                                                                        .toString(),
                                                                      style: GoogleFonts.poppins(
                                                                          fontWeight:
                                                                          FontWeight.w400,
                                                                          color: Colors.black,
                                                                          fontSize:
                                                                          10),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                  EdgeInsets.only(right: 5),
                                                                  child: ElevatedButton(
                                                                    style: ElevatedButton.styleFrom(
                                                                      backgroundColor: Colors.blue[50],
                                                                      //shadowColor: Colors.grey,
                                                                      elevation: 3,
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius:
                                                                          BorderRadius.circular(
                                                                              32.0)),
                                                                      minimumSize: Size(
                                                                          30, 30), //////// HERE
                                                                    ),
                                                                    onPressed: () {},
                                                                    child: Text((snapshot.data!.docs
                                                                        .elementAt(index)
                                                                        .data()
                                                                    as Map)['exp']
                                                                        .toString(),
                                                                      style: GoogleFonts.poppins(
                                                                          fontWeight:
                                                                          FontWeight.w400,
                                                                          color: Colors.black,
                                                                          fontSize:10),
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
                              });
                        }
                      ),
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