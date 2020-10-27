import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_ddd/domain/core/failures.dart';
import 'package:flutter_firebase_ddd/domain/core/value_object.dart';
import 'package:flutter_firebase_ddd/domain/core/value_validators.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    assert(input != null);
    return EmailAddress._(value: validateEmailAddress(input));
  }

  const EmailAddress._({@required this.value});
}

class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Password(String input) {
    assert(input != null);
    return Password._(value: validatePassword(input));
  }

  const Password._({@required this.value});
}
