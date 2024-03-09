import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthify/doctor/home_page/doctor_homescreen.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

import '../user/auth/firebase_auth_services.dart';
import '../user/navigation.dart';

class DocSignUpPage extends StatefulWidget {
  const DocSignUpPage({Key? key}) : super(key: key);

  @override
  State<DocSignUpPage> createState() => _DocSignUpState();
}

class _DocSignUpState extends State<DocSignUpPage> {

  final FirebaseAuthService _auth = FirebaseAuthService();
  String _chosenExp='';
  String _chosenQual='';
  String _email = '';
  String password = '';
  String _name='';
  String _reg='';
  String _spec='';
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
      body: SingleChildScrollView(
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
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Full name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none),
                      fillColor: Colors.blue.withOpacity(0.1),
                      filled: true,
                      prefixIcon: const Icon(Icons.person)),
                  validator: (val) => val!.isEmpty ? 'Enter your name' : null,
                  onChanged: (val) {
                    setState(() => _name = val);
                  },
                ),
                SizedBox(height: 8,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Doctor Registration Number",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none),
                    fillColor: Colors.blue.withOpacity(0.1),
                    filled: true,
                    prefixIcon: const Icon(Icons.document_scanner_outlined),
                  ),
                  onChanged: (val) {
                    setState(() => _reg = val);
                  },
                ),
                SizedBox(height: 8,),
                // Qualification
                Container(
                  padding: EdgeInsets.fromLTRB(15, 5, 5, 5),
                  height: 64,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    //border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                  ),
                  //color: Colors.blue.withOpacity(0.1),
                  child: DropdownButton<String>(
                    value: _chosenQual.isNotEmpty ? _chosenQual : null,
                    items: <String>[
                     ' MBBS – Bachelor of Medicine, Bachelor of Surgery',
        
                      'BDS – Bachelor of Dental Surgery',
        
                      'BAMS – Bachelor of Ayurvedic Medicine and Surgery',
        
                      'BUMS – Bachelor of Unani Medicine and Surgery',
        
                      'BHMS – Bachelor of Homeopathy Medicine and Surgery',
        
                      'BYNS- Bachelor of Yoga and Naturopathy Sciences',
        
                      'MD - Doctor of Medicine',
        
        
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _chosenQual = newValue!;
                      });
                    },
                    isExpanded: true,
                    hint: Text(
                      "Highest Qualification",
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                //Specializtion
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Specialization",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none),
                      fillColor: Colors.blue.withOpacity(0.1),
                      filled: true,
                      prefixIcon: const Icon(Icons.pending_actions)),
                  validator: (val) => val!.isEmpty ? 'Enter your name' : null,
                  onChanged: (val) {
                    setState(() => _spec = val);
                  },
                ),
                SizedBox(height: 8,),
                Container(
                  padding: EdgeInsets.all(5),
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    //border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                  ),
                  //color: Colors.blue.withOpacity(0.1),
                  child: DropdownButton<String>(
                    value: _chosenExp.isNotEmpty ? _chosenExp : null,
                    items: <String>[
                      '5+ years',
                      '10+ years',
                      '15+ years',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _chosenExp = newValue!;
                      });
                    },
                    isExpanded: true,
                    hint: Text(
                      "Experience",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
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
    );
  }

  void _signUp() async {
    //String username1=_usernameController.text;
    String email1=_email;
    String password1=password;

    User? user=(await _auth.signUpWithEmailAndPassword(_email, password)) as User?;
    if(user != null){
      print("User is successfully created");
      addDocDetails(_name.trim(), _reg.trim(), _chosenQual, _spec.trim(), _chosenExp, user.uid);
      await ZIMKit().connectUser(id:user.uid.toString().substring(0,3),name: _name.toString());
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DoctorHomeScreen()),
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
  Future addDocDetails(String name,String reg,String qual,String spec, String exp,String uid)async{
    await FirebaseFirestore.instance.collection('Doctor').doc(uid).set({
      'uid':uid,
      'name': name,
      'degree':qual,
      'exp':exp,
      'reg':reg,
      'spec':spec,
      'image':"assets/images/doc4.png",
      'rating':4.1,
      'timeSlots':[9,10,11,12],
      'about':"Lorem ipsum dolor sit amet, consectetur adipi elit, sed do eiusmod tempor incididunt ut laore et dolore magna aliqua. Ut enim ad minim veniam... Read more"
    });
  }
}



// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:healthify/user/auth/firebase_auth_services.dart';
// import 'package:healthify/user/navigation.dart';
// class DocSignupPage extends StatefulWidget {
//   @override
//   //State<StatefulWidget> createState() {
//   _DocSignUpState createState() => _DocSignUpState();
// }
// //const SignupPage({super.key});
// class _DocSignUpState extends State<DocSignupPage> {
//   final FirebaseAuthService _auth=FirebaseAuthService();
//   TextEditingController _usernameController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//   TextEditingController _passwordconfController = TextEditingController();
//   String error='';
//   @override
//   void dispose(){
//     _usernameController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
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
//                     const SizedBox(height: 60.0),
//
//                     const Text(
//                       "Sign up",
//                       style: TextStyle(
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Text(
//                       "Create your account",
//                       style: TextStyle(fontSize: 15, color: Colors.grey[700]),
//                     )
//                   ],
//                 ),
//                 Column(
//                   children: <Widget>[
//                     TextField(
//                       controller: _usernameController,
//                       decoration: InputDecoration(
//                           hintText: "Username",
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(18),
//                               borderSide: BorderSide.none),
//                           fillColor: Colors.blue.withOpacity(0.1),
//                           filled: true,
//                           prefixIcon: const Icon(Icons.person)),
//                     ),
//
//                     const SizedBox(height: 20),
//
//                     TextField(
//                       controller: _emailController,
//                       decoration: InputDecoration(
//                           hintText: "Email",
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(18),
//                               borderSide: BorderSide.none),
//                           fillColor: Colors.blue.withOpacity(0.1),
//                           filled: true,
//                           prefixIcon: const Icon(Icons.email)),
//                     ),
//
//                     const SizedBox(height: 20),
//
//                     TextField(
//                       controller: _passwordController,
//                       decoration: InputDecoration(
//                         hintText: "Reference Number",
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(18),
//                             borderSide: BorderSide.none),
//                         fillColor: Colors.blue.withOpacity(0.1),
//                         filled: true,
//                         prefixIcon: const Icon(Icons.numbers),
//                       ),
//                       //obscureText: true,
//                     ),
//
//                     const SizedBox(height: 20),
//
//                     TextField(
//                       controller: _passwordController,
//                       decoration: InputDecoration(
//                         hintText: "Password",
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(18),
//                             borderSide: BorderSide.none),
//                         fillColor: Colors.blue.withOpacity(0.1),
//                         filled: true,
//                         prefixIcon: const Icon(Icons.password),
//                       ),
//                       obscureText: true,
//                     ),
//
//                     const SizedBox(height: 20),
//
//                     TextField(
//                       controller: _passwordconfController,//check!!
//                       decoration: InputDecoration(
//                         hintText: "Confirm Password",
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(18),
//                             borderSide: BorderSide.none),
//                         fillColor: Colors.blue.withOpacity(0.1),
//                         filled: true,
//                         prefixIcon: const Icon(Icons.password),
//                       ),
//                       obscureText: true,
//                     ),
//                   ],
//                 ),
//                 Container(
//                     padding: const EdgeInsets.only(top: 3, left: 3),
//
//                     child: ElevatedButton(
//                       onPressed: ()  {
//                         _signUp();
//                         //  dynamic result=await _auth.signUpWithEmailAndPassword(_emailController.text, _passwordController.text);
//                         //  if(result==null){
//                         //    setState(() => error='enter valid credentials');
//                         //  }
//                       },
//                       child: const Text(
//                         "Sign up",
//                         style: TextStyle(fontSize: 20),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         shape: const StadiumBorder(),
//                         padding: const EdgeInsets.symmetric(vertical: 16),
//                         backgroundColor: Colors.blue,
//                       ),
//                     )
//                 ),
//
//                 const Center(child: Text("Or")),
//
//                 Container(
//                   height: 45,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(25),
//                     border: Border.all(
//                       color: Colors.blue,
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.white.withOpacity(0.5),
//                         spreadRadius: 1,
//                         blurRadius: 1,
//                         offset: const Offset(0, 1), // changes position of shadow
//                       ),
//                     ],
//                   ),
//                   child: TextButton(
//                     onPressed: () {},
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           height: 30.0,
//                           width: 30.0,
//                           decoration: const BoxDecoration(
//                             image: DecorationImage(
//                                 image:   AssetImage('assets/images/google.png'),
//                                 fit: BoxFit.cover),
//                             shape: BoxShape.circle,
//                           ),
//                         ),
//
//                         const SizedBox(width: 18),
//
//                         const Text("Sign In with Google",
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.blue,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     const Text("Already have an account?"),
//                     TextButton(
//                         onPressed: () {
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
//   void _signUp() async {
//     String username=_usernameController.text;
//     String email=_emailController.text;
//     String password=_passwordController.text;
//
//     User? user=(await _auth.signUpWithEmailAndPassword(email, password)) as User?;
//     if((user != null)&&(password==_passwordconfController.text)){
//       print("User is successfully created");
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => Navigation()),
//       );
//     }
//     else
//       print("$user Some error occured ki");
//
//   }
// }



