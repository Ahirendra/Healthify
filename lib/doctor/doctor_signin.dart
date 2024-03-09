// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:healthify/doctor/doctor_signup.dart';
// import 'package:healthify/user/auth/firebase_auth_services.dart';
// class DocSignIn extends StatefulWidget{
//   _docSignIn createState()=> _docSignIn();
// }
// class _docSignIn extends State<DocSignIn>{
//   final FirebaseAuthService _auth= FirebaseAuthService();
//   String email='';
//   String password='';
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Container(
//         padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
//         child: Form(
//           child: Column(
//             children: [
//               SizedBox(height: 20,),
//               TextFormField(
//                 onChanged: (val){
//                   setState(()=> email=val);
//                 },
//               ),
//               SizedBox(height: 20,),
//               TextFormField(
//                 obscureText: true,
//                 onChanged: (val){
//                   setState(()=> password=val);
//                 },
//               ),
//               SizedBox(height: 20,),
//               ElevatedButton(
//                 onPressed: () async {
//
//                 },
//                 style: ElevatedButton.styleFrom(
//                   shape: const StadiumBorder(),
//                   padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
//                   foregroundColor: Colors.white,
//                   backgroundColor: Colors.blueAccent,
//                 ),
//                 child: const Text(
//                   "Sign In",
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text("Don't have an account?"),
//               TextButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => DocSignUp()),
//                     );
//                   },
//                   child: const Text("Sign Up", style: TextStyle(color: Colors.blueAccent),)
//               )
//             ],
//           ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
// }


// import 'package:flutter/material.dart';
//
// class SignIn extends StatefulWidget {
// @override
// _SignInState createState() => _SignInState();
// }
//
// class _SignInState extends State<SignIn> {
//   @override
//   Widget build(BuildContext context) {
//     double width=MediaQuery.of(context).size.width;
//     double height=MediaQuery.of(context).size.height;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: double.infinity,
//         alignment: Alignment.center,
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     IconButton(
//                         icon: Icon(Icons.arrow_back_ios),
//                         onPressed: (){
//                           Navigator.of(context).pop();
//                         }
//                     ),
//                     //Expanded(
//                       Text('SignIn',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),
//                             textAlign: TextAlign.center),
//                     //)
//                   ],
//                 ),
//               ),
//               SizedBox(height: 30.0,),
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Email',
//                   suffixIcon: Icon(Icons.email),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20.0),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20.0,),
//               TextField(
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   hintText: 'Password',
//                   suffixIcon: Icon(Icons.visibility_off),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20.0),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 30.0,),
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text('Forget password?',style: TextStyle(fontSize: 12.0),),
//                     ElevatedButton(
//                       child: const Text('Login'),
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.blueAccent, // Background color
//                         onPrimary: Colors.white
//                       ),
//                         //'Elevated Button',
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height:20.0),
//               GestureDetector(
//                 onTap: (){
//                   //Navigator.push(context, MaterialPageRoute(builder: (context)=>Second()));
//                 },
//                 child: const Text.rich(
//                   TextSpan(
//                       text: 'Don\'t have an account?',
//                       children: [
//                         TextSpan(
//                           text: '\t SignUp',
//                           style: TextStyle(
//                               color: Color(0xFF448AFF),
//                           ),
//                         ),
//                       ]
//                   ),
//                 ),
//               ),
//
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthify/doctor/doctor_signup.dart';
import 'package:healthify/doctor/home_page/doctor_homescreen.dart';
import 'package:healthify/user/auth/signup.dart';
import 'package:healthify/user/home_page/home_screen.dart';
import 'package:healthify/user/navigation.dart';
import 'package:zego_zimkit/zego_zimkit.dart';
import '../user/auth/firebase_auth_services.dart';
class DocSignIn extends StatefulWidget {
  const DocSignIn({super.key});

  @override
  State<DocSignIn> createState() => _DocSignInState();
}

class _DocSignInState extends State<DocSignIn> {
  final FirebaseAuthService _auth=FirebaseAuthService();
  //TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String name='';

  @override
  void dispose(){
    //_nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black), onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Sign In",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //_header(context),
                _inputField(context),
                _forgotPassword(context),
                _signup(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _header(context) {
    return Column(
      children: [
        Text(
          "Sign In",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        //Text("Enter your credential to login"),
      ],
    );
  }

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // TextField(
        //   controller: _nameController,
        //   decoration: InputDecoration(
        //       hintText: "name",
        //       border: OutlineInputBorder(
        //           borderRadius: BorderRadius.circular(18),
        //           borderSide: BorderSide.none
        //       ),
        //       fillColor: Colors.lightBlueAccent.withOpacity(0.1),
        //       filled: true,
        //       prefixIcon: const Icon(Icons.person)),
        // ),
        const SizedBox(height: 80),
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
              hintText: "Email",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none
              ),
              fillColor: Colors.lightBlueAccent.withOpacity(0.1),
              filled: true,
              prefixIcon: const Icon(Icons.person)),
        ),
        const SizedBox(height: 20),
        TextField(
          obscuringCharacter: '*',
          controller: _passwordController,
          decoration: InputDecoration(
            hintText: "Password",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: Colors.lightBlueAccent.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.password),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            _signIn();
          },
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
            foregroundColor: Colors.white,
            backgroundColor: Colors.blueAccent,
          ),
          child: const Text(
            "Sign In",
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }

  _forgotPassword(context) {
    return TextButton(
      onPressed: () {},
      child: const Text("Forgot password?",
        style: TextStyle(color: Colors.blueAccent),
      ),
    );
  }

  _signup(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?"),
        TextButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => DocSignUpPage()),
              // );
              Navigator.of(context).pop();
              Navigator
                  .of(context)
                  .push(
                MaterialPageRoute(
                    builder: (BuildContext context) =>DocSignUpPage()
                ),
              );
            },
            child: const Text("Sign Up", style: TextStyle(color: Colors.blueAccent),)
        )
      ],
    );
  }
  void _signIn() async {

    String email=_emailController.text;
    String password=_passwordController.text;
    //String name=_nameController.text;
    User? user=await _auth.signInWithEmailAndPassword(email, password);
    if((user != null)){
      print("User is successfully loggedIn");
      final userDoc = await FirebaseFirestore.instance
          .collection('Doctor')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .get();

      if (userDoc.exists) {
        setState(() {
          name = userDoc.data()?['name'] ?? 'Doctor';
        });
      }
      await ZIMKit().connectUser(id:user.uid.toString().substring(0,3),name: name);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DoctorHomeScreen()),
      );
    }
    else {
      print("$user Some error occured ki");
    }
  }
}

//signhayuhi19032hmndi nnv