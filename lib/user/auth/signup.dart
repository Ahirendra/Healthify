import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthify/user/auth/firebase_auth_services.dart';
import 'package:healthify/user/auth/signin.dart';
import 'package:healthify/user/navigation.dart';
import 'package:zego_zimkit/zego_zimkit.dart';
class SignupPage extends StatefulWidget {
  @override
  //State<StatefulWidget> createState() {
    _SignUpState createState() => _SignUpState();
  }
  //const SignupPage({super.key});
  class _SignUpState extends State<SignupPage> {
    final FirebaseAuthService _auth = FirebaseAuthService();

    String _email = '';
    String password = '';
    String _name='';
    String _bg='';
    String _city='';
    String _age='';
    String error = '';
    final _formKey = GlobalKey<FormState>();

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black), onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Sign up",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: Colors.white,
        body: Expanded(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              height: MediaQuery.of(context).size.height - 11,
              width: double.infinity,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Column(
                      children: <Widget>[
                        const SizedBox(height: 60.0),

                        // const Text(
                        //   "Sign up",
                        //   style: TextStyle(
                        //     fontSize: 30,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 8,
                        // ),
                        Text(
                          "Create your account",
                          style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                        )
                      ],
                    ),
                    SizedBox(height: 8,),
                    //name

                    //Specializtion
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Full Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none),
                          fillColor: Colors.blue.withOpacity(0.1),
                          filled: true,
                          prefixIcon: const Icon(Icons.drive_file_rename_outline)),
                      validator: (val) => val!.isEmpty ? 'Enter your name' : null,
                      onChanged: (val) {
                        setState(() => _name = val);
                      },
                    ),


                    SizedBox(height: 8,),

                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Age",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none),
                          fillColor: Colors.blue.withOpacity(0.1),
                          filled: true,
                          prefixIcon: const Icon(Icons.man)),
                      validator: (val) => val!.isEmpty ? 'Enter your age' : null,
                      onChanged: (val) {
                        setState(() => _age = val );
                      },
                    ),


                    SizedBox(height: 8,),

                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Blood Group",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none),
                          fillColor: Colors.blue.withOpacity(0.1),
                          filled: true,
                          prefixIcon: const Icon(Icons.water_drop)),
                      validator: (val) => val!.isEmpty ? 'Enter your blood group' : null,
                      onChanged: (val) {
                        setState(() => _bg = val);
                      },
                    ),


                    SizedBox(height: 8,),

                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "City",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none),
                          fillColor: Colors.blue.withOpacity(0.1),
                          filled: true,
                          prefixIcon: const Icon(Icons.location_city)),
                      validator: (val) => val!.isEmpty ? 'Enter your city' : null,
                      onChanged: (val) {
                        setState(() => _city = val);
                      },
                    ),


                    SizedBox(height: 8,),

                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none),
                          fillColor: Colors.blue.withOpacity(0.1),
                          filled: true,
                          prefixIcon: const Icon(Icons.email)),
                      validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                      onChanged: (val) {
                        setState(() => _email = val);
                      },
                    ),
                    SizedBox(height: 8,),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none),
                        fillColor: Colors.blue.withOpacity(0.1),
                        filled: true,
                        prefixIcon: const Icon(Icons.password),
                      ),
                      obscureText: true,
                      validator: (val) =>
                      val!.length < 6
                          ? 'Enter a password 6+ chars long'
                          : null,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    SizedBox(height: 8,),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Confirm Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none),
                        fillColor: Colors.blue.withOpacity(0.1),
                        filled: true,
                        prefixIcon: const Icon(Icons.password),
                      ),
                      obscureText: true,
                      validator: (val) =>
                      val!=password
                          ? 'Password does not match'
                          : null,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    SizedBox(height: 8,),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _signUp();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.fromLTRB(40, 5, 40, 5),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blueAccent,
                      ),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(height: 8,),
                    Text(error,style: TextStyle(fontSize: 12,color: Colors.red),)
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    void _signUp() async {
      //String username1=_usernameController.text;
      String email1=_email;
      String password1=password;

      User? user=(await _auth.signUpWithEmailAndPassword(_email, password)) as User?;
      if(user != null){
        print("User is successfully created");
        addUserDetails(_name.trim(), int.parse(_age.trim()), _bg.trim(), _city.trim(), user.uid);
        await ZIMKit().connectUser(id:user.uid.toString().substring(0,3),name: _name.toString());
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Navigation()),
        );
        // Navigator.of(context).pop();
        // Navigator
        //     .of(context)
        //     .pushReplacement(
        //     MaterialPageRoute(
        //         builder: (BuildContext context) =>Navigation()
        //     ),
        // );

      }
      else
      {
        print("$user Some error occured ki");
        setState(() {
          error='Could not register, enter valid credentials';
        });
      }
    }
    Future addUserDetails(String name,int age,String bg,String city, String uid)async{
    await FirebaseFirestore.instance.collection('Patient').doc(uid).set({
      'name': name,
      'age':age,
      'blood group':bg,
      'city':city,
      'Pimage':'assets/images/def.jpg',
    });
}




//   final FirebaseAuthService _auth=FirebaseAuthService();
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _ageController = TextEditingController();
//   TextEditingController _cityController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//   TextEditingController _passwordconfController = TextEditingController();
//   TextEditingController _bloodGroupController = TextEditingController();
// String error='';
//   @override
//   void dispose(){
//     _nameController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     _ageController.dispose();
//     _cityController.dispose();
//     _bloodGroupController.dispose();
//     super.dispose();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back, color: Colors.black), onPressed: () => Navigator.of(context).pop(),
//           ),
//           backgroundColor: Colors.white,
//           centerTitle: true,
//           title: Text(
//             "Sign Up",
//             style: TextStyle(
//               fontSize: 25,
//               fontWeight: FontWeight.bold,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 40),
//             height: MediaQuery.of(context).size.height - 50,
//             width: double.infinity,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 Column(
//                   children: <Widget>[
//                     const SizedBox(height: 20.0),
//
//                     // const Text(
//                     //   "Sign up",
//                     //   style: TextStyle(
//                     //     fontSize: 30,
//                     //     fontWeight: FontWeight.bold,
//                     //   ),
//                     // ),
//                     // const SizedBox(
//                     //   height: 20,
//                     // ),
//                     Text(
//                       "Create your account",
//                       style: TextStyle(fontSize: 15, color: Colors.grey[700]),
//                     )
//                   ],
//                 ),
//                 SizedBox(height: 4,),
//                 Column(
//                   children: <Widget>[
//                     TextField(
//                       controller: _nameController,
//                       decoration: InputDecoration(
//                           contentPadding: EdgeInsets.symmetric(vertical: 5.0,),
//                           hintText: "Full Name",
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8),
//                               borderSide: BorderSide.none),
//                           fillColor: Colors.blue.withOpacity(0.1),
//                           filled: true,
//                           prefixIcon: const Icon(Icons.person)),
//                     ),
//
//                     const SizedBox(height: 8),
//
//
//                     //age
//                     TextField(
//                       controller: _ageController,
//                       decoration: InputDecoration(
//                           contentPadding: EdgeInsets.symmetric(vertical: 5.0,),
//                           hintText: "Age",
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8),
//                               borderSide: BorderSide.none),
//                           fillColor: Colors.blue.withOpacity(0.1),
//                           filled: true,
//                           prefixIcon: const Icon(Icons.emoji_people)),
//                     ),
//
//                     const SizedBox(height: 8),
//                     //blood group
//                     TextField(
//                       controller: _bloodGroupController,
//                       decoration: InputDecoration(
//                           contentPadding: EdgeInsets.symmetric(vertical: 5.0,),
//                           hintText: "Blood Group",
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8),
//                               borderSide: BorderSide.none),
//                           fillColor: Colors.blue.withOpacity(0.1),
//                           filled: true,
//                           prefixIcon: const Icon(Icons.water_drop)),
//                     ),
//
//                     const SizedBox(height: 8),
//                     //city
//                     TextField(
//                       controller: _cityController,
//                       decoration: InputDecoration(
//
//                           contentPadding: EdgeInsets.symmetric(vertical: 5.0,),
//                           hintText: "City",
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8),
//                               borderSide: BorderSide.none),
//                           fillColor: Colors.blue.withOpacity(0.1),
//                           filled: true,
//                           prefixIcon: const Icon(Icons.location_city_sharp)),
//                     ),
//                     const SizedBox(height: 8),
//                     TextField(
//                       controller: _emailController,
//                       decoration: InputDecoration(
//                           contentPadding: EdgeInsets.symmetric(vertical: 5.0,),
//                           hintText: "Email",
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8),
//                               borderSide: BorderSide.none),
//                           fillColor: Colors.blue.withOpacity(0.1),
//                           filled: true,
//                           prefixIcon: const Icon(Icons.email)),
//                     ),
//
//
//
//                     const SizedBox(height: 8),
//                     //password
//
//                     TextField(
//                       controller: _passwordController,
//                       decoration: InputDecoration(
//                         contentPadding: EdgeInsets.symmetric(vertical: 5.0,),
//                         hintText: "Password",
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                             borderSide: BorderSide.none),
//                         fillColor: Colors.blue.withOpacity(0.1),
//                         filled: true,
//                         prefixIcon: const Icon(Icons.password),
//                       ),
//                       obscureText: true,
//                     ),
//
//                     const SizedBox(height: 8),
//
//                     TextField(
//                       controller: _passwordconfController,//check!!
//                       decoration: InputDecoration(
//                         contentPadding: EdgeInsets.symmetric(vertical: 5.0,),
//                         hintText: "Confirm Password",
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                             borderSide: BorderSide.none),
//                         fillColor: Colors.blue.withOpacity(0.1),
//                         filled: true,
//                         prefixIcon: const Icon(Icons.password),
//                       ),
//                       obscureText: true,
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20,),
//                 Container(
//                     padding: const EdgeInsets.only(top: 3, left: 3),
//
//                     child: ElevatedButton(
//                       onPressed: ()  {
//                        _signUp();
//                        //  dynamic result=await _auth.signUpWithEmailAndPassword(_emailController.text, _passwordController.text);
//                        //  if(result==null){
//                        //    setState(() => error='enter valid credentials');
//                        //  }
//                       },
//                       child: const Text(
//                         "Sign up",
//                         style: TextStyle(fontSize: 16,color: Colors.white),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         shape: const StadiumBorder(),
//                         padding: const EdgeInsets.symmetric(vertical: 16),
//                         backgroundColor: Colors.blue,
//                       ),
//                     )
//                 ),
//
//                 //const Center(child: Text("Or")),
//
//                 // Container(
//                 //   height: 45,
//                 //   decoration: BoxDecoration(
//                 //     borderRadius: BorderRadius.circular(25),
//                 //     border: Border.all(
//                 //       color: Colors.blue,
//                 //     ),
//                 //     boxShadow: [
//                 //       BoxShadow(
//                 //         color: Colors.white.withOpacity(0.5),
//                 //         spreadRadius: 1,
//                 //         blurRadius: 1,
//                 //         offset: const Offset(0, 1), // changes position of shadow
//                 //       ),
//                 //     ],
//                 //   ),
//                 //   child: TextButton(
//                 //     onPressed: () {},
//                 //     child: Row(
//                 //       mainAxisAlignment: MainAxisAlignment.center,
//                 //       children: [
//                 //         Container(
//                 //           height: 30.0,
//                 //           width: 30.0,
//                 //           decoration: const BoxDecoration(
//                 //             image: DecorationImage(
//                 //                 image:   AssetImage('assets/images/google.png'),
//                 //                 fit: BoxFit.cover),
//                 //             shape: BoxShape.circle,
//                 //           ),
//                 //         ),
//                 //
//                 //         const SizedBox(width: 18),
//                 //
//                 //         const Text("Sign In with Google",
//                 //           style: TextStyle(
//                 //             fontSize: 16,
//                 //             color: Colors.blue,
//                 //           ),
//                 //         ),
//                 //       ],
//                 //     ),
//                 //   ),
//                 // ),
//
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     const Text("Already have an account?"),
//                     TextButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => SignIn()),
//                           );
//                         },
//                         child: const Text("Login", style: TextStyle(color: Colors.blue),)
//                     )
//                   ],
//                 ),
//                 SizedBox(height: 20,),
//                 Text(error)
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// void _signUp() async {
//
//     String email=_emailController.text;
//     String password=_passwordController.text;
//
//     User? user=(await _auth.signUpWithEmailAndPassword(email, password)) as User?;
//     if(user != null){
//       print("User is successfully created");
//       //add user details
//       addUserDetails(_nameController.text.trim(), int.parse(_ageController.text.trim()), _bloodGroupController.text.trim(), _cityController.text.trim(), user.uid);
//       //navigate
//       await ZIMKit().connectUser(id:user.uid.toString().substring(0,3),name: _nameController.text.trim());
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => Navigation()),
//       );
//     }
//     else
//       print("$user Some error occured ki");
//
// }
// Future addUserDetails(String name,int age,String bg,String city, String uid)async{
//     await FirebaseFirestore.instance.collection('Patient').doc(uid).set({
//       'name': name,
//       'age':age,
//       'blood group':bg,
//       'city':city,
//       'Pimage':'assets/images/def.jpg',
//     });
// }
 }




