//import 'package:booking_calendar/booking_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthify/user/home_page/success.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Booking extends StatefulWidget {
  DocumentSnapshot docToView;
  Booking({super.key, required this.docToView});
  //const Booking({Key? key}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  CalendarFormat _format= CalendarFormat.month;
  DateTime _focusDay =DateTime.now();
  DateTime _currentDay=DateTime.now();
  int? _currentIndex;
  bool _isWeekend=false;
  bool _dateSelected=false;
  bool _timeSelected=false;
  String time='';
  @override
  Widget build(BuildContext context) {
    //SizeConfigs().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("BOOK"),
      ),
      body:
      CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [

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


                _tableCalendar(),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical:25 ),
                  child: Center(
                    child: Text("Select Consultation Time",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          _isWeekend ? SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40,vertical: 30),
              //alignment: Alignment.center,
              child: Text('Weekend is not available, please select another date.',
                style: TextStyle(
                  fontSize: 18,
                  //fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),),
            ),
          )
              : SliverGrid(delegate: SliverChildBuilderDelegate((context, index){
            return InkWell(
              splashColor: Colors.transparent,
              onTap: (){
                //when selected, update
                setState(() {
                  _currentIndex=index;
                  _timeSelected=true;
                });
              },
              child: Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _currentIndex == index
                        ? Colors.white
                        : Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  color: _currentIndex==index
                      ? Colors.blue[600]
                      : null,
                ),
                alignment: Alignment.center,
                child: Text('${(widget.docToView.data() as Map)['timeSlots'][index]}:00 ${(widget.docToView.data() as Map)['timeSlots'][index] > 11 ? "PM":"AM"}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: _currentIndex==index?Colors.white:null,
                  ),
                ),
              ),
            );
          },
            childCount: (widget.docToView.data() as Map)['timeSlots'].length,
          ), gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, childAspectRatio: 1.5),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: ElevatedButton(
                onPressed:
                (_timeSelected && _dateSelected) ? (){
                  bookApp((widget.docToView.data() as Map)['uid']);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Success()),
                  );
                } :null,
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.fromLTRB(40, 5, 40, 5),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blueAccent,
                ),
                child: const Text(
                  "BOOK APPOINTMENT",
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                ),

              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _tableCalendar(){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TableCalendar(
        focusedDay: _focusDay,
        firstDay: DateTime.now(),
        lastDay: DateTime(2024,12,31),
        calendarFormat: _format,
        currentDay: _currentDay,
        rowHeight: 48,
        calendarStyle: CalendarStyle(
          todayDecoration: BoxDecoration(color: Colors.blue[600],shape: BoxShape.circle),
        ),
        availableCalendarFormats: const{
          CalendarFormat.month:'Month',
        },
        onFormatChanged: (format){
          setState(() {
            _format=format;
          });
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _currentDay = selectedDay;
            _focusDay= focusedDay;
            _dateSelected=true;
            if(selectedDay.weekday==6||selectedDay.weekday==7){
              _isWeekend=true;
              _timeSelected=false;
              _currentDay!=null;
            }
            else{
              _isWeekend=false;
            }
          });
        },
      ),
    );
  }
  bookApp(String docID) async{
    var store=FirebaseFirestore.instance.collection('UpcomingAppointments').doc();
    await store.set(
        {
          'patientID':FirebaseAuth.instance.currentUser?.uid,
          'docID':(widget.docToView.data() as Map)['docID'].toString(),
          'docName':(widget.docToView.data() as Map)['name'].toString(),
          'time':'${(widget.docToView.data() as Map)['timeSlots'][_currentIndex]}:00 ${(widget.docToView.data() as Map)['timeSlots'][_currentIndex] > 11 ? "PM":"AM"}',
          'date':_currentDay.toString().substring(0,11),
          'meetID':'',
        }
    );
  }
}
