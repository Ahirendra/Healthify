import 'package:flutter/material.dart';
class MyProfile extends StatefulWidget{
  @override
  _myProfile createState() => _myProfile();
}

class _myProfile extends State<MyProfile>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 80, 8, 8),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                radius: 80, // Image radius
                backgroundImage: AssetImage('assets/images/profile1.png'),
              ),
            ),
            SizedBox(height: 8,),
            Text("Ruchita",style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 100,),
            Column(
              children: [
                Divider(
                  color: Colors.grey,
                ),
                Row(

                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}