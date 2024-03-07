import 'package:flutter/material.dart';
import 'package:healthify/doctor/doctor_signin.dart';
import 'package:healthify/user/auth/signin.dart';
class Welcome extends StatefulWidget{
  _welcome createState()=> _welcome();
}
class _welcome extends State<Welcome>{
  Widget build(BuildContext){
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 190, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image(image: AssetImage('assets/images/logo.png'),height: 120,width: 120,),
            ),
            SizedBox(height: 8,),
            Text("HealthFirst",style: TextStyle(
              color: Colors.blue[900],
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(height: 50,),
            Text("Let's get started!",style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(height: 6,),
            Text("Login to stay healthy and fit",style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
              //fontWeight: FontWeight.bold,
            ),),
            SizedBox(height: 50,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  backgroundColor: (Colors.blueAccent),
                  //foregroundColor: Colors.blueAccent,
                  minimumSize: Size(260,60)
              ),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignIn()),
                  );
                },
                child: Text("User"),
            ),
            SizedBox(height: 18,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  backgroundColor: (Colors.white),
                  foregroundColor: Colors.blueAccent,
                  minimumSize: Size(260,60),
                  side: const BorderSide(
                      width: 2,
                      color: Colors.blueAccent,
                      style: BorderStyle.solid)
              ),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DocSignIn()),
                );

              },
              child: Text("Doctor"),
            )
          ],
        ),
      ),
    );
  }
}