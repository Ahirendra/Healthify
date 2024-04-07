// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import 'call_page.dart';
// class Join extends StatelessWidget {
//   const Join({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.blueAccent,
//             shadowColor: Colors.transparent,
//             elevation: 0,
//             shape: RoundedRectangleBorder(
//                 borderRadius:
//                 BorderRadius.circular(
//                     32.0),
//                 side: BorderSide(color: Colors.blueAccent)),
//             minimumSize: Size(
//                 50, 37), //////// HERE
//           ),
//           onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => CallPage(callID: "1abcd1")));},
//           child: Text("Join Meeting",
//             style: GoogleFonts.poppins(
//                 fontWeight:
//                 FontWeight.w500,
//                 color: Colors.white,
//                 fontSize:
//                 MediaQuery.of(context)
//                     .size
//                     .width *
//                     0.03),
//           ),
//         ),
//       ),
//     );
//   }
// }
