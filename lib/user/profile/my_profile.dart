import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthify/user/appointments/my_appointment.dart';
import 'package:healthify/user/myOrders/myorders.dart';
class MyProfile extends StatefulWidget{
  @override
  _myProfile createState() => _myProfile();
}

class _myProfile extends State<MyProfile>{
  @override
  Widget build(BuildContext context) {
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
                backgroundImage: AssetImage('assets/images/profile1.png'),
              ),
            ),
            SizedBox(height: 8,),
            Text("Ruchita",style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 10,),
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
                            image: AssetImage('assets/images/age.png'),
                            fit: BoxFit.fill,
                            width: 40,
                            height: 40,
                          ),
                          SizedBox(height: 3),
                          Text("Age",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: Colors.blueAccent,
                                fontSize:10,
                          )
                          ),
                          SizedBox(height: 3),
                          Text("25",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                color: Colors.blueAccent,
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
                              image: AssetImage('assets/images/blood_group.png'),
                              fit: BoxFit.fill,
                              width: 40,
                              height: 40,
                            ),
                            SizedBox(height: 3),
                            Text("Blood Group",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blueAccent,
                                  fontSize:10,
                                )
                            ),
                            SizedBox(height: 3),
                            Text("B+",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blueAccent,
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
                              image: AssetImage('assets/images/city.png'),
                              fit: BoxFit.fill,
                              width: 40,
                              height: 40,
                            ),
                            SizedBox(height: 3),
                            Text("City",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blueAccent,
                                  fontSize:10,
                                )
                            ),
                            SizedBox(height: 3),
                            Text("Delhi",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blueAccent,
                                  fontSize:16,
                                )
                            ),
                          ]
                      ),
                    ]
                  ),
                ),
                SizedBox(height: 11),

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
                            .push(MaterialPageRoute(builder: (context) => MyAppointment())),
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
                        image: AssetImage('assets/images/order.png'),
                        fit: BoxFit.fill,
                        width: 30,
                        height: 30,
                      ),
                      SizedBox(width: 20,),

                      Text("My Orders",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize:20,
                          )
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () => Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => My_Orders())),
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
                        image: AssetImage('assets/images/hand.png'),
                        fit: BoxFit.fill,
                        width: 30,
                        height: 30,
                      ),
                      SizedBox(width: 20,),

                      Text("Become a Donor",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize:20,
                          )
                      ),
                      Spacer(),

                      IconButton(
                        onPressed: () => {},
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
                        onPressed: () => {},
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