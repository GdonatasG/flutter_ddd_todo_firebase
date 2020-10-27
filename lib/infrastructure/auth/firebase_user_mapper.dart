import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_firebase_ddd/domain/auth/user.dart';
import 'package:flutter_firebase_ddd/domain/core/value_object.dart';

extension FirebaseUserDomainX on auth.User {
  User toDomain() {
    return User(id: UniqueId.fromUniqueString(uid));
  }
}
