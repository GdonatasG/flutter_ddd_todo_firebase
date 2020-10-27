import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';

import 'failures.dart';

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidEmail(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  if (input.length >= 6) {
    return right(input);
  } else {
    return left(ValueFailure.shortPassword(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateMaxStringLength(
  String input,
  int maxLength,
) =>
    input.length <= maxLength
        ? right(input)
        : left(
            ValueFailure.exceedingLength(
              failedValue: input,
              maxLength: maxLength,
            ),
          );

Either<ValueFailure<String>, String> validateStringNotEmpty(String input) =>
    input.isNotEmpty
        ? right(input)
        : left(
            ValueFailure.empty(failedValue: input),
          );

Either<ValueFailure<String>, String> validateSingleLine(String input) =>
    !input.contains('\n')
        ? right(input)
        : left(
            ValueFailure.multiline(failedValue: input),
          );

Either<ValueFailure<KtList<T>>, KtList<T>> validateMaxListLength<T>(
  KtList<T> input,
  int maxLength,
) =>
    input.size <= maxLength
        ? right(input)
        : ValueFailure.listTooLong(
            failedValue: input,
            max: maxLength,
          );
