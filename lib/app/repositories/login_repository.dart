import 'package:firebase_auth/firebase_auth.dart';

class LoginRepository {
  Future<String> testeFields(email, senha) async {
    if (email == null || !email.contains('@')) {
      return 'Email inválido';
    } else if (senha == null || senha.length < 6) {
      return 'Senha inválida';
    } else if ((email == null || !email.contains('@')) &&
        (senha == null || senha.length < 6)) {
      return 'Email e senha inválidos';
    } else {
      return 'ok';
    }
  }

  Future<String> register(String email, String senha) async {
    User user;
    final _firebaseAuth = FirebaseAuth.instance;
    final authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: senha);
    user = authResult.user;
    return user.uid;
  }
}
