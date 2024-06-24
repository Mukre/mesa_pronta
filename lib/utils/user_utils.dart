import 'package:firebase_auth/firebase_auth.dart';

Future<void> signInUserEmail(String email, String password) async {
  try{
    final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  } catch (e){
    print(e);
  }
}