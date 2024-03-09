import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthify/user/appointments/my_appointment.dart';
import 'package:healthify/user/auth/firebase_auth_services.dart';
import 'package:healthify/user/chat/chat.dart';
import 'package:healthify/user/myOrders/myorders.dart';
import 'package:healthify/welcome/welcome.dart';
import 'package:provider/provider.dart';

import 'appointmentsD/docAppointments.dart';
class DocProfile extends StatefulWidget{
  @override
  _myProfile createState() => _myProfile();
}

class _myProfile extends State<DocProfile>{
  final FirebaseAuthService _auth = FirebaseAuthService();
   String name='';
   String degree='';
   String spec='';
   String reg='';
   String image='';
  void getUserData() async {
    final userDoc = await FirebaseFirestore.instance
        .collection('Doctor')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();

    if (userDoc.exists) {
      setState(() {
        name = userDoc.data()?['name'] ?? 'Doctor';
        degree = userDoc.data()?['degree'] ?? 'Doctor';
        spec = userDoc.data()?['spec'] ?? 'Doctor';
        reg = userDoc.data()?['reg'] ?? 'Doctor';
        image= userDoc.data()?['image'] ?? 'Doctor';
      });


    } else {
      print('User document not found.');
    }
  }
  @override
  Widget build(BuildContext context) {
    getUserData();
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {Navigator.pop(context);  },
            child: Icon(Icons.arrow_back_ios)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text("My Profile",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,)
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 30, 8, 8),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                radius: 50, // Image radius
                backgroundImage: AssetImage('$image'),
              ),
            ),
            SizedBox(height: 8,),
            Text("$name",style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 30,),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                            children: [
                              Image(
                                //alignment: Alignment.topRight,
                                image: AssetImage('assets/images/reg.png'),
                                fit: BoxFit.fill,
                                width: 40,
                                height: 40,
                              ),
                              SizedBox(height: 3),
                              Text("Reg. No",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize:10,
                                  )
                              ),
                              SizedBox(height: 3),
                              Text("$reg",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontSize:16,
                                  )
                              ),
                            ]
                        ),

                        Container(
                          height: 50,
                          child: VerticalDivider(
                            color: Colors.grey,
                            thickness: 0.3,
                          ),
                        ),

                        Column(
                            children: [
                              Image(
                                //alignment: Alignment.topRight,
                                image: AssetImage('assets/images/degree.png'),
                                fit: BoxFit.fill,
                                width: 40,
                                height: 40,
                              ),
                              SizedBox(height: 3),
                              Text("Degree",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize:10,
                                  )
                              ),
                              SizedBox(height: 3),
                              Text("$degree",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontSize:16,
                                  )
                              ),
                            ]
                        ),

                        Container(
                          height: 50,
                          child: VerticalDivider(
                            color: Colors.grey,
                            thickness: 0.5,
                          ),
                        ),

                        Column(
                            children: [
                              Image(
                                //alignment: Alignment.topRight,
                                image: AssetImage('assets/images/spec.png'),
                                fit: BoxFit.fill,
                                width: 40,
                                height: 40,
                              ),
                              SizedBox(height: 3),
                              Text("specialization",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize:10,
                                  )
                              ),
                              SizedBox(height: 3),
                              Text("$spec",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontSize:16,
                                  )
                              ),
                            ]
                        ),
                      ]
                  ),
                ),
                SizedBox(height: 20),

                Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 12,
                  indent: 20,
                  endIndent: 20,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  child: Row(
                    children: [
                      Image(
                        //alignment: Alignment.topRight,
                        image: AssetImage('assets/images/calendar.png'),
                        fit: BoxFit.fill,
                        width: 30,
                        height: 30,
                      ),
                      SizedBox(width: 20,),

                      Text("My Appointments",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize:20,
                          )
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () => Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => DocAppointment())),
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 22.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),




                Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 12,
                  indent: 20,
                  endIndent: 20,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  child: Row(
                    children: [
                      Image(
                        //alignment: Alignment.topRight,
                        image: AssetImage('assets/images/chat.png'),
                        fit: BoxFit.fill,
                        width: 30,
                        height: 30,
                      ),
                      SizedBox(width: 20,),

                      Text("Messages",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize:20,
                          )
                      ),
                      Spacer(),

                      IconButton(
                        onPressed: () => {
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Chat()),
                        )
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 22.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),

                Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 12,
                  indent: 20,
                  endIndent: 20,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                        size: 28.0,
                        color: Colors.blueAccent,
                      ),
                      SizedBox(width: 20,),

                      Text("Logout",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize:20,
                          )
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: ()  async{
                          await _auth.signOut();
                          Navigator.popUntil(context, ModalRoute.withName("/"));

                        },
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 22.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}