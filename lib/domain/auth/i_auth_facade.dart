import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_firebase_ddd/domain/auth/auth_failure.dart';
import 'package:flutter_firebase_ddd/domain/auth/user.dart';
import 'value_objects.dart';

abstract class IAuthFacade {
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithGoogle();

  Future<Option<User>> getSignedInUser();

  Future<void> signOut();
}
