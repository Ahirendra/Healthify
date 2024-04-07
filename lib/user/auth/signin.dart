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
import 'package:healthify/user/auth/signup.dart';
import 'package:healthify/user/home_page/home_screen.dart';
import 'package:healthify/user/navigation.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

import 'firebase_auth_services.dart';
class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final FirebaseAuthService _auth=FirebaseAuthService();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  String name='';
  @override
  void dispose(){
    _usernameController.dispose();
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignupPage()),
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
          .collection('Patient')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .get();

      if (userDoc.exists) {
        setState(() {
          name = userDoc.data()?['name'] ?? 'Patient';
        });
      }
      await ZIMKit().connectUser(id:user.uid.toString().substring(0,3),name: name);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Navigation()),
      );
    }
    else {
      _showMyDialog();
      print("$user Some error occured ki");
    }
  }
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Could not Login'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Enter valid email and password!'),

              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

//signhayuhi19032hmndi nnv