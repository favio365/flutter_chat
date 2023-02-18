import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class ChatFirebaseUser {
  ChatFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

ChatFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<ChatFirebaseUser> chatFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<ChatFirebaseUser>(
      (user) {
        currentUser = ChatFirebaseUser(user);
        return currentUser!;
      },
    );
