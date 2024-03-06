import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthify/models/user.dart';
import 'package:healthify/models/doc.dart';
class FirebaseAuthService {
  FirebaseAuth _auth=FirebaseAuth.instance;

  //creating user object

  // User1? _userFromFirebaseUser(User? user){
  //   return user != null? User1(uid: user.uid) : null;
  // }

  // Doc? _doctorFromFirebaseUser(User? doc){
  //   return doc != null? Doc(uid: doc.uid) : null;
  // }

  // Stream<User1?> get user{
  //   return _auth.authStateChanges().map(_userFromFirebaseUser);
  // }

  // Stream<Doc?> get doc{
  //   return _auth.authStateChanges().map(_doctorFromFirebaseUser);
  // }

  Future<User?> signUpWithEmailAndPassword(String email,String password) async{
    try{
      UserCredential credential=await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    }catch(e){
      print("Some error occured");
    }
    return null;
  }
  Future<User?> signInWithEmailAndPassword(String email,String password) async{
    try{
      UserCredential credential=await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    }catch(e){
      print("Some error occured");
    }
    return null;
  }

  Future<void> signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}