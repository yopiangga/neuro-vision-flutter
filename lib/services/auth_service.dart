import '../models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<bool> signUp(String fullname, String email, String password) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (result.user != null) {
        await firestore.collection('user').doc(result.user!.uid).set(Patient(
              email: email,
              fullname: fullname,
              uid: result.user!.uid,
            ).toJson());

        await auth.signOut();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("ERROR: $e");
      return false;
    }
  }

  Future signIn(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);

      //ambil user login
      User? user = auth.currentUser;

      //ambil data user
      DocumentSnapshot snapshot =
          await firestore.collection('user').doc(user!.uid).get();

      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

      if (auth.currentUser != null) {
        return data;
      } else {
        return null;
      }
    } catch (e) {
      print("ERROR: $e");
      return null;
    }
  }

  void signOut() async {
    await auth.signOut();
  }

  Future<Map<String, dynamic>> getUser() async {
    try {
      User? user = auth.currentUser;
      DocumentSnapshot snapshot =
          await firestore.collection('user').doc(user!.uid).get();

      return snapshot.data() as Map<String, dynamic>;
    } catch (e) {
      print("ERROR: $e");
      rethrow;
    }
  }

  Future getUserRole() async {
    //ambil user login
    User? user = auth.currentUser;

    //ambil data user
    DocumentSnapshot snapshot =
        await firestore.collection('user').doc(user!.uid).get();

    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    return data['role'];
  }
}
