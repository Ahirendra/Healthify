import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pharmacy/medDetails.dart';
class My_Orders extends StatefulWidget{
  @override
  _myOrders createState() => _myOrders();

}

class _myOrders extends State<My_Orders>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {  },
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text('My Orders',
              style: TextStyle(
                  color: Colors.black
              ),
              textAlign: TextAlign.center)
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: ListView(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    //Image(image: AssetImage('assets/images/medF.png'),height: 280,width: 134,),
                    children: [
                      Container(
                          //padding: EdgeInsets.all(8),
                          height:100,
                          width: 100,
                          //color: Colors.grey,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(13.0)),
                            color: Colors.blue[50],
                          ),
                          child: Image.asset('assets/images/medF.png',)),
                      SizedBox(width:15 ,),
                      Column(
                        children: [
                          Container(
                            width: 239,
                            //color:Colors.blue,
                            child: Text("Paracetamol",style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20,
                            ),
                              //textAlign: TextAlign.right ,
                            ),
                          ),
                          SizedBox(height: 40,),
                          Container(
                            width: 239,
                            //color:Colors.blue,
                            child: Text("1 item(s)",style: GoogleFonts.poppins(
                              //fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                              //textAlign: TextAlign.right ,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text('ID Order',style: GoogleFonts.poppins(
                        fontSize: 18,
                      ),),
                      SizedBox(width: 180,),
                      Text('#1234BH6',style: GoogleFonts.poppins(
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                      ),),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text('Total Product',style: GoogleFonts.poppins(
                        fontSize: 18,
                      ),),
                      SizedBox(width: 140,),
                      Image(image: AssetImage('assets/images/rupee.jpg'),height: 30,width: 30,),
                      Text('50',style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      // TextButton(
                      //   child: Text('Rate the medicine',style: TextStyle(
                      //     color: Colors.blueAccent,
                      //   ),),
                      //   style: ButtonStyle(
                      //       backgroundColor: MaterialStateProperty.all(Colors.white)),
                      //   onPressed: () {},
                      // ),
                      SizedBox(width: 250,),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: StadiumBorder(),
                              backgroundColor: (Colors.blue[600]),
                              //foregroundColor: Colors.blueAccent,
                              minimumSize: Size(30,36)
                          ),
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MedicineDetails()),
                            );
                          },
                          child: Text("Buy Again",style: TextStyle(fontSize: 15))
                      ),
                    ],
                  ),

                ],
              ),
            ),
            SizedBox(height: 6,),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    //Image(image: AssetImage('assets/images/medF.png'),height: 280,width: 134,),
                    children: [
                      Container(
                        //padding: EdgeInsets.all(8),
                          height:100,
                          width: 100,
                          //color: Colors.grey,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(13.0)),
                            color: Colors.blue[50],
                          ),
                          child: Image.asset('assets/images/medF.png',)),
                      SizedBox(width:15 ,),
                      Column(
                        children: [
                          Container(
                            width: 239,
                            //color:Colors.blue,
                            child: Text("Paracetamol",style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20,
                            ),
                              //textAlign: TextAlign.right ,
                            ),
                          ),
                          SizedBox(height: 40,),
                          Container(
                            width: 239,
                            //color:Colors.blue,
                            child: Text("1 item(s)",style: GoogleFonts.poppins(
                              //fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                              //textAlign: TextAlign.right ,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text('ID Order',style: GoogleFonts.poppins(
                        fontSize: 18,
                      ),),
                      SizedBox(width: 180,),
                      Text('#1234BH6',style: GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                      ),),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text('Total Product',style: GoogleFonts.poppins(
                        fontSize: 18,
                      ),),
                      SizedBox(width: 140,),
                      Image(image: AssetImage('assets/images/rupee.jpg'),height: 30,width: 30,),
                      Text('50',style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      // TextButton(
                      //   child: Text('Rate the medicine',style: TextStyle(
                      //     color: Colors.blueAccent,
                      //   ),),
                      //   style: ButtonStyle(
                      //       backgroundColor: MaterialStateProperty.all(Colors.white)),
                      //   onPressed: () {},
                      // ),
                      SizedBox(width: 250,),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: StadiumBorder(),
                              backgroundColor: (Colors.blue[600]),
                              //foregroundColor: Colors.blueAccent,
                              minimumSize: Size(30,36)
                          ),
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MedicineDetails()),
                            );
                          },
                          child: Text("Buy Again",style: TextStyle(fontSize: 15))
                      ),
                    ],
                  ),

                ],
              ),
            ),
            SizedBox(height: 6,),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    //Image(image: AssetImage('assets/images/medF.png'),height: 280,width: 134,),
                    children: [
                      Container(
                        //padding: EdgeInsets.all(8),
                          height:100,
                          width: 100,
                          //color: Colors.grey,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(13.0)),
                            color: Colors.blue[50],
                          ),
                          child: Image.asset('assets/images/medF.png',)),
                      SizedBox(width:15 ,),
                      Column(
                        children: [
                          Container(
                            width: 239,
                            //color:Colors.blue,
                            child: Text("Paracetamol",style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20,
                            ),
                              //textAlign: TextAlign.right ,
                            ),
                          ),
                          SizedBox(height: 40,),
                          Container(
                            width: 239,
                            //color:Colors.blue,
                            child: Text("1 item(s)",style: GoogleFonts.poppins(
                              //fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                              //textAlign: TextAlign.right ,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text('ID Order',style: GoogleFonts.poppins(
                        fontSize: 18,
                      ),),
                      SizedBox(width: 180,),
                      Text('#1234BH6',style: GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                      ),),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text('Total Product',style: GoogleFonts.poppins(
                        fontSize: 18,
                      ),),
                      SizedBox(width: 140,),
                      Image(image: AssetImage('assets/images/rupee.jpg'),height: 30,width: 30,),
                      Text('50',style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      // TextButton(
                      //   child: Text('Rate the medicine',style: TextStyle(
                      //     color: Colors.blueAccent,
                      //   ),),
                      //   style: ButtonStyle(
                      //       backgroundColor: MaterialStateProperty.all(Colors.white)),
                      //   onPressed: () {},
                      // ),
                      SizedBox(width: 250,),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: StadiumBorder(),
                              backgroundColor: (Colors.blue[600]),
                              //foregroundColor: Colors.blueAccent,
                              minimumSize: Size(30,36)
                          ),
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MedicineDetails()),
                            );
                          },
                          child: Text("Buy Again",style: TextStyle(fontSize: 15))
                      ),
                    ],
                  ),

                ],
              ),
            ),




          ],
        ),
      ),
    );
  }
}