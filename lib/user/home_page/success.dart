import 'package:flutter/material.dart';
import 'package:healthify/user/home_page/home_screen.dart';
import 'package:lottie/lottie.dart';
class Success extends StatelessWidget {
  const Success({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Expanded(
            //   flex: 3,
            //   child: Lottie.asset('assets/animations/suc.json'),
            // ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: const Text('Successfully Booked',
                  style:TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )
              ),
            ),
            const Spacer(),
            Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                } ,
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.fromLTRB(40, 5, 40, 5),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green[400],
                ),
                child: const Text(
                  "BACK TO HOME PAGE",
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                ),

              ),)
          ],
        ),
      ),
    );
  }
}
