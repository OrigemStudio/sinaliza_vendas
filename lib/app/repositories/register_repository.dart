import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hasura_connect/hasura_connect.dart';

class RegisterReposotory {
  HasuraConnect _hasuraConnect =
      HasuraConnect('https://sinaliza-vendas.hasura.app/v1/graphql');
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
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: senha);
    if (authResult.additionalUserInfo.isNewUser) {
      user = authResult.user;
      print('registrado com sucesso');
      await setUser(user.uid, email);
      return user.uid;
    } else {
      print('erro');
      return '';
    }
  }

  Future<dynamic> setUser(String id, String email) async {
    var query = r"""
      mutation setUser($email:String!,$id:String!){
        insert_users(objects: {email: $email, id: $id}) {
          affected_rows
        }
      }
    """;
    var doc = await _hasuraConnect.mutation(query, variables: {
      "email": email,
      "id": id,
    });
    return doc;
  }
}
