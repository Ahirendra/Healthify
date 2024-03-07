import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthify/user/auth/firebase_auth_services.dart';
import 'package:healthify/user/navigation.dart';
class SignupPage extends StatefulWidget {
  @override
  //State<StatefulWidget> createState() {
    _SignUpState createState() => _SignUpState();
  }
  //const SignupPage({super.key});
  class _SignUpState extends State<SignupPage> {
  final FirebaseAuthService _auth=FirebaseAuthService();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordconfController = TextEditingController();
  TextEditingController _bloodGroupController = TextEditingController();
String error='';
  @override
  void dispose(){
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _ageController.dispose();
    _cityController.dispose();
    _bloodGroupController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            height: MediaQuery.of(context).size.height - 50,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const SizedBox(height: 60.0),

                    const Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Create your account",
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    )
                  ],
                ),
                SizedBox(height: 4,),
                Column(
                  children: <Widget>[
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 5.0,),
                          hintText: "Full Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none),
                          fillColor: Colors.blue.withOpacity(0.1),
                          filled: true,
                          prefixIcon: const Icon(Icons.person)),
                    ),

                    const SizedBox(height: 8),


                    //age
                    TextField(
                      controller: _ageController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 5.0,),
                          hintText: "Age",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none),
                          fillColor: Colors.blue.withOpacity(0.1),
                          filled: true,
                          prefixIcon: const Icon(Icons.emoji_people)),
                    ),

                    const SizedBox(height: 8),
                    //blood group
                    TextField(
                      controller: _bloodGroupController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 5.0,),
                          hintText: "Blood Group",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none),
                          fillColor: Colors.blue.withOpacity(0.1),
                          filled: true,
                          prefixIcon: const Icon(Icons.water_drop)),
                    ),

                    const SizedBox(height: 8),
                    //city
                    TextField(
                      controller: _cityController,
                      decoration: InputDecoration(

                          contentPadding: EdgeInsets.symmetric(vertical: 5.0,),
                          hintText: "City",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none),
                          fillColor: Colors.blue.withOpacity(0.1),
                          filled: true,
                          prefixIcon: const Icon(Icons.location_city_sharp)),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 5.0,),
                          hintText: "Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none),
                          fillColor: Colors.blue.withOpacity(0.1),
                          filled: true,
                          prefixIcon: const Icon(Icons.email)),
                    ),



                    const SizedBox(height: 8),
                    //password

                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 5.0,),
                        hintText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none),
                        fillColor: Colors.blue.withOpacity(0.1),
                        filled: true,
                        prefixIcon: const Icon(Icons.password),
                      ),
                      obscureText: true,
                    ),

                    const SizedBox(height: 8),

                    TextField(
                      controller: _passwordconfController,//check!!
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 5.0,),
                        hintText: "Confirm Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none),
                        fillColor: Colors.blue.withOpacity(0.1),
                        filled: true,
                        prefixIcon: const Icon(Icons.password),
                      ),
                      obscureText: true,
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                    padding: const EdgeInsets.only(top: 3, left: 3),

                    child: ElevatedButton(
                      onPressed: ()  {
                       _signUp();
                       //  dynamic result=await _auth.signUpWithEmailAndPassword(_emailController.text, _passwordController.text);
                       //  if(result==null){
                       //    setState(() => error='enter valid credentials');
                       //  }
                      },
                      child: const Text(
                        "Sign up",
                        style: TextStyle(fontSize: 16,color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.blue,
                      ),
                    )
                ),

                //const Center(child: Text("Or")),

                // Container(
                //   height: 45,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(25),
                //     border: Border.all(
                //       color: Colors.blue,
                //     ),
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.white.withOpacity(0.5),
                //         spreadRadius: 1,
                //         blurRadius: 1,
                //         offset: const Offset(0, 1), // changes position of shadow
                //       ),
                //     ],
                //   ),
                //   child: TextButton(
                //     onPressed: () {},
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Container(
                //           height: 30.0,
                //           width: 30.0,
                //           decoration: const BoxDecoration(
                //             image: DecorationImage(
                //                 image:   AssetImage('assets/images/google.png'),
                //                 fit: BoxFit.cover),
                //             shape: BoxShape.circle,
                //           ),
                //         ),
                //
                //         const SizedBox(width: 18),
                //
                //         const Text("Sign In with Google",
                //           style: TextStyle(
                //             fontSize: 16,
                //             color: Colors.blue,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("Already have an account?"),
                    TextButton(
                        onPressed: () {
                        },
                        child: const Text("Login", style: TextStyle(color: Colors.blue),)
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Text(error)
              ],
            ),
          ),
        ),
      ),
    );
  }
void _signUp() async {

    String email=_emailController.text;
    String password=_passwordController.text;

    User? user=(await _auth.signUpWithEmailAndPassword(email, password)) as User?;
    if(user != null){
      print("User is successfully created");
      //add user details
      addUserDetails(_nameController.text.trim(), int.parse(_ageController.text.trim()), _bloodGroupController.text.trim(), _cityController.text.trim(), user.uid);
      //navigate
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Navigation()),
      );
    }
    else
      print("$user Some error occured ki");

}
Future addUserDetails(String name,int age,String bg,String city, String uid)async{
    await FirebaseFirestore.instance.collection('Patient').doc(uid).set({
      'name': name,
      'age':age,
      'blood group':bg,
      'city':city,
    });
}
 }



