import 'package:firebase_auth/firebase_auth.dart';

class SplashRepository {
  Future<User> getAutenticacao() async {
    final _firebaseAuth = FirebaseAuth.instance;
    User user = _firebaseAuth.currentUser;
    if (user != null) {
      return user;
    } else {
      return null;
    }
  }
}
