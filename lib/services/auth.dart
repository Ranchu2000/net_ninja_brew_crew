import 'package:firebase_auth/firebase_auth.dart';
import 'package:net_ninja_brew_crew/models/user.dart';
import 'package:net_ninja_brew_crew/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //creat user object
  NinjaUser? _userFromFireBaseUser(User? user) {
    return user != null ? NinjaUser(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<NinjaUser?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFireBaseUser(user));
  }

  //anon sign in
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user!;
      return _userFromFireBaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;
      //create a new document for the user with the uid
      await DatabaseService(uid: user.uid)
          .updateUserData('0', 'new member', 100);
      return _userFromFireBaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email & password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;
      return _userFromFireBaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
