import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthify/user/appointments/cancelled_appointment.dart';
import 'package:healthify/user/appointments/completed_appointment.dart';
import 'package:healthify/user/appointments/upcoming_appointment.dart';


class MyAppointment extends StatefulWidget {
  const MyAppointment({Key? key}) : super(key: key);

  @override
  State<MyAppointment> createState() => _MyAppointmentState();
}

class _MyAppointmentState extends State<MyAppointment> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
          leading: GestureDetector(
          onTap: () {Navigator.pop(context);  },
      child: Icon(Icons.arrow_back_ios)),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      bottom: TabBar(
        labelColor: Colors.blueAccent,
        unselectedLabelColor: Colors.grey,
        tabs: <Widget>[
          Tab(child: Text("Upcoming", style: GoogleFonts.poppins(fontWeight: FontWeight.w500))),
          Tab(child: Text("Completed", style: GoogleFonts.poppins(fontWeight: FontWeight.w500))),
          Tab(child: Text("Cancelled", style: GoogleFonts.poppins(fontWeight: FontWeight.w500))),
        ],
      ),
      title: Text("My Appointment",
      style: GoogleFonts.poppins(
      fontWeight: FontWeight.w500,)
      ),
      ),
      body: TabBarView(
        children: [
          UpcomingAppointment(),
          CompletedAppointment(),
          CancelledAppointment(),
        ]
      )
      ),
    );
    }
}