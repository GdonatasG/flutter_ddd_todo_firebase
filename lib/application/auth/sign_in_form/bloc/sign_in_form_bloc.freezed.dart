// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'sign_in_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SignInFormEventTearOff {
  const _$SignInFormEventTearOff();

// ignore: unused_element
  EmailChanged emailChanged(String emailString) {
    return EmailChanged(
      emailString,
    );
  }

// ignore: unused_element
  PasswordChanged passwordChanged(String passwordString) {
    return PasswordChanged(
      passwordString,
    );
  }

// ignore: unused_element
  RegisterWithEmailAndPasswordPresed registerWithEmailAndPasswordPressed() {
    return const RegisterWithEmailAndPasswordPresed();
  }

// ignore: unused_element
  SignInWithEmailAndPasswordPresed signInWithEmailAndPasswordPressed() {
    return const SignInWithEmailAndPasswordPresed();
  }

// ignore: unused_element
  SignInWithGooglePressed signInWithGooglePressed() {
    return const SignInWithGooglePressed();
  }
}

/// @nodoc
// ignore: unused_element
const $SignInFormEvent = _$SignInFormEventTearOff();

/// @nodoc
mixin _$SignInFormEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String emailString),
    @required Result passwordChanged(String passwordString),
    @required Result registerWithEmailAndPasswordPressed(),
    @required Result signInWithEmailAndPasswordPressed(),
    @required Result signInWithGooglePressed(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String emailString),
    Result passwordChanged(String passwordString),
    Result registerWithEmailAndPasswordPressed(),
    Result signInWithEmailAndPasswordPressed(),
    Result signInWithGooglePressed(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result passwordChanged(PasswordChanged value),
    @required
        Result registerWithEmailAndPasswordPressed(
            RegisterWithEmailAndPasswordPresed value),
    @required
        Result signInWithEmailAndPasswordPressed(
            SignInWithEmailAndPasswordPresed value),
    @required Result signInWithGooglePressed(SignInWithGooglePressed value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result passwordChanged(PasswordChanged value),
    Result registerWithEmailAndPasswordPressed(
        RegisterWithEmailAndPasswordPresed value),
    Result signInWithEmailAndPasswordPressed(
        SignInWithEmailAndPasswordPresed value),
    Result signInWithGooglePressed(SignInWithGooglePressed value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $SignInFormEventCopyWith<$Res> {
  factory $SignInFormEventCopyWith(
          SignInFormEvent value, $Res Function(SignInFormEvent) then) =
      _$SignInFormEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInFormEventCopyWithImpl<$Res>
    implements $SignInFormEventCopyWith<$Res> {
  _$SignInFormEventCopyWithImpl(this._value, this._then);

  final SignInFormEvent _value;
  // ignore: unused_field
  final $Res Function(SignInFormEvent) _then;
}

/// @nodoc
abstract class $EmailChangedCopyWith<$Res> {
  factory $EmailChangedCopyWith(
          EmailChanged value, $Res Function(EmailChanged) then) =
      _$EmailChangedCopyWithImpl<$Res>;
  $Res call({String emailString});
}

/// @nodoc
class _$EmailChangedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res>
    implements $EmailChangedCopyWith<$Res> {
  _$EmailChangedCopyWithImpl(
      EmailChanged _value, $Res Function(EmailChanged) _then)
      : super(_value, (v) => _then(v as EmailChanged));

  @override
  EmailChanged get _value => super._value as EmailChanged;

  @override
  $Res call({
    Object emailString = freezed,
  }) {
    return _then(EmailChanged(
      emailString == freezed ? _value.emailString : emailString as String,
    ));
  }
}

/// @nodoc
class _$EmailChanged implements EmailChanged {
  const _$EmailChanged(this.emailString) : assert(emailString != null);

  @override
  final String emailString;

  @override
  String toString() {
    return 'SignInFormEvent.emailChanged(emailString: $emailString)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EmailChanged &&
            (identical(other.emailString, emailString) ||
                const DeepCollectionEquality()
                    .equals(other.emailString, emailString)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(emailString);

  @override
  $EmailChangedCopyWith<EmailChanged> get copyWith =>
      _$EmailChangedCopyWithImpl<EmailChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String emailString),
    @required Result passwordChanged(String passwordString),
    @required Result registerWithEmailAndPasswordPressed(),
    @required Result signInWithEmailAndPasswordPressed(),
    @required Result signInWithGooglePressed(),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(registerWithEmailAndPasswordPressed != null);
    assert(signInWithEmailAndPasswordPressed != null);
    assert(signInWithGooglePressed != null);
    return emailChanged(emailString);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String emailString),
    Result passwordChanged(String passwordString),
    Result registerWithEmailAndPasswordPressed(),
    Result signInWithEmailAndPasswordPressed(),
    Result signInWithGooglePressed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emailChanged != null) {
      return emailChanged(emailString);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result passwordChanged(PasswordChanged value),
    @required
        Result registerWithEmailAndPasswordPressed(
            RegisterWithEmailAndPasswordPresed value),
    @required
        Result signInWithEmailAndPasswordPressed(
            SignInWithEmailAndPasswordPresed value),
    @required Result signInWithGooglePressed(SignInWithGooglePressed value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(registerWithEmailAndPasswordPressed != null);
    assert(signInWithEmailAndPasswordPressed != null);
    assert(signInWithGooglePressed != null);
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result passwordChanged(PasswordChanged value),
    Result registerWithEmailAndPasswordPressed(
        RegisterWithEmailAndPasswordPresed value),
    Result signInWithEmailAndPasswordPressed(
        SignInWithEmailAndPasswordPresed value),
    Result signInWithGooglePressed(SignInWithGooglePressed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class EmailChanged implements SignInFormEvent {
  const factory EmailChanged(String emailString) = _$EmailChanged;

  String get emailString;
  $EmailChangedCopyWith<EmailChanged> get copyWith;
}

/// @nodoc
abstract class $PasswordChangedCopyWith<$Res> {
  factory $PasswordChangedCopyWith(
          PasswordChanged value, $Res Function(PasswordChanged) then) =
      _$PasswordChangedCopyWithImpl<$Res>;
  $Res call({String passwordString});
}

/// @nodoc
class _$PasswordChangedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res>
    implements $PasswordChangedCopyWith<$Res> {
  _$PasswordChangedCopyWithImpl(
      PasswordChanged _value, $Res Function(PasswordChanged) _then)
      : super(_value, (v) => _then(v as PasswordChanged));

  @override
  PasswordChanged get _value => super._value as PasswordChanged;

  @override
  $Res call({
    Object passwordString = freezed,
  }) {
    return _then(PasswordChanged(
      passwordString == freezed
          ? _value.passwordString
          : passwordString as String,
    ));
  }
}

/// @nodoc
class _$PasswordChanged implements PasswordChanged {
  const _$PasswordChanged(this.passwordString) : assert(passwordString != null);

  @override
  final String passwordString;

  @override
  String toString() {
    return 'SignInFormEvent.passwordChanged(passwordString: $passwordString)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PasswordChanged &&
            (identical(other.passwordString, passwordString) ||
                const DeepCollectionEquality()
                    .equals(other.passwordString, passwordString)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(passwordString);

  @override
  $PasswordChangedCopyWith<PasswordChanged> get copyWith =>
      _$PasswordChangedCopyWithImpl<PasswordChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String emailString),
    @required Result passwordChanged(String passwordString),
    @required Result registerWithEmailAndPasswordPressed(),
    @required Result signInWithEmailAndPasswordPressed(),
    @required Result signInWithGooglePressed(),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(registerWithEmailAndPasswordPressed != null);
    assert(signInWithEmailAndPasswordPressed != null);
    assert(signInWithGooglePressed != null);
    return passwordChanged(passwordString);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String emailString),
    Result passwordChanged(String passwordString),
    Result registerWithEmailAndPasswordPressed(),
    Result signInWithEmailAndPasswordPressed(),
    Result signInWithGooglePressed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (passwordChanged != null) {
      return passwordChanged(passwordString);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result passwordChanged(PasswordChanged value),
    @required
        Result registerWithEmailAndPasswordPressed(
            RegisterWithEmailAndPasswordPresed value),
    @required
        Result signInWithEmailAndPasswordPressed(
            SignInWithEmailAndPasswordPresed value),
    @required Result signInWithGooglePressed(SignInWithGooglePressed value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(registerWithEmailAndPasswordPressed != null);
    assert(signInWithEmailAndPasswordPressed != null);
    assert(signInWithGooglePressed != null);
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result passwordChanged(PasswordChanged value),
    Result registerWithEmailAndPasswordPressed(
        RegisterWithEmailAndPasswordPresed value),
    Result signInWithEmailAndPasswordPressed(
        SignInWithEmailAndPasswordPresed value),
    Result signInWithGooglePressed(SignInWithGooglePressed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class PasswordChanged implements SignInFormEvent {
  const factory PasswordChanged(String passwordString) = _$PasswordChanged;

  String get passwordString;
  $PasswordChangedCopyWith<PasswordChanged> get copyWith;
}

/// @nodoc
abstract class $RegisterWithEmailAndPasswordPresedCopyWith<$Res> {
  factory $RegisterWithEmailAndPasswordPresedCopyWith(
          RegisterWithEmailAndPasswordPresed value,
          $Res Function(RegisterWithEmailAndPasswordPresed) then) =
      _$RegisterWithEmailAndPasswordPresedCopyWithImpl<$Res>;
}

/// @nodoc
class _$RegisterWithEmailAndPasswordPresedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res>
    implements $RegisterWithEmailAndPasswordPresedCopyWith<$Res> {
  _$RegisterWithEmailAndPasswordPresedCopyWithImpl(
      RegisterWithEmailAndPasswordPresed _value,
      $Res Function(RegisterWithEmailAndPasswordPresed) _then)
      : super(_value, (v) => _then(v as RegisterWithEmailAndPasswordPresed));

  @override
  RegisterWithEmailAndPasswordPresed get _value =>
      super._value as RegisterWithEmailAndPasswordPresed;
}

/// @nodoc
class _$RegisterWithEmailAndPasswordPresed
    implements RegisterWithEmailAndPasswordPresed {
  const _$RegisterWithEmailAndPasswordPresed();

  @override
  String toString() {
    return 'SignInFormEvent.registerWithEmailAndPasswordPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RegisterWithEmailAndPasswordPresed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String emailString),
    @required Result passwordChanged(String passwordString),
    @required Result registerWithEmailAndPasswordPressed(),
    @required Result signInWithEmailAndPasswordPressed(),
    @required Result signInWithGooglePressed(),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(registerWithEmailAndPasswordPressed != null);
    assert(signInWithEmailAndPasswordPressed != null);
    assert(signInWithGooglePressed != null);
    return registerWithEmailAndPasswordPressed();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String emailString),
    Result passwordChanged(String passwordString),
    Result registerWithEmailAndPasswordPressed(),
    Result signInWithEmailAndPasswordPressed(),
    Result signInWithGooglePressed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (registerWithEmailAndPasswordPressed != null) {
      return registerWithEmailAndPasswordPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result passwordChanged(PasswordChanged value),
    @required
        Result registerWithEmailAndPasswordPressed(
            RegisterWithEmailAndPasswordPresed value),
    @required
        Result signInWithEmailAndPasswordPressed(
            SignInWithEmailAndPasswordPresed value),
    @required Result signInWithGooglePressed(SignInWithGooglePressed value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(registerWithEmailAndPasswordPressed != null);
    assert(signInWithEmailAndPasswordPressed != null);
    assert(signInWithGooglePressed != null);
    return registerWithEmailAndPasswordPressed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result passwordChanged(PasswordChanged value),
    Result registerWithEmailAndPasswordPressed(
        RegisterWithEmailAndPasswordPresed value),
    Result signInWithEmailAndPasswordPressed(
        SignInWithEmailAndPasswordPresed value),
    Result signInWithGooglePressed(SignInWithGooglePressed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (registerWithEmailAndPasswordPressed != null) {
      return registerWithEmailAndPasswordPressed(this);
    }
    return orElse();
  }
}

abstract class RegisterWithEmailAndPasswordPresed implements SignInFormEvent {
  const factory RegisterWithEmailAndPasswordPresed() =
      _$RegisterWithEmailAndPasswordPresed;
}

/// @nodoc
abstract class $SignInWithEmailAndPasswordPresedCopyWith<$Res> {
  factory $SignInWithEmailAndPasswordPresedCopyWith(
          SignInWithEmailAndPasswordPresed value,
          $Res Function(SignInWithEmailAndPasswordPresed) then) =
      _$SignInWithEmailAndPasswordPresedCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInWithEmailAndPasswordPresedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res>
    implements $SignInWithEmailAndPasswordPresedCopyWith<$Res> {
  _$SignInWithEmailAndPasswordPresedCopyWithImpl(
      SignInWithEmailAndPasswordPresed _value,
      $Res Function(SignInWithEmailAndPasswordPresed) _then)
      : super(_value, (v) => _then(v as SignInWithEmailAndPasswordPresed));

  @override
  SignInWithEmailAndPasswordPresed get _value =>
      super._value as SignInWithEmailAndPasswordPresed;
}

/// @nodoc
class _$SignInWithEmailAndPasswordPresed
    implements SignInWithEmailAndPasswordPresed {
  const _$SignInWithEmailAndPasswordPresed();

  @override
  String toString() {
    return 'SignInFormEvent.signInWithEmailAndPasswordPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SignInWithEmailAndPasswordPresed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String emailString),
    @required Result passwordChanged(String passwordString),
    @required Result registerWithEmailAndPasswordPressed(),
    @required Result signInWithEmailAndPasswordPressed(),
    @required Result signInWithGooglePressed(),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(registerWithEmailAndPasswordPressed != null);
    assert(signInWithEmailAndPasswordPressed != null);
    assert(signInWithGooglePressed != null);
    return signInWithEmailAndPasswordPressed();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String emailString),
    Result passwordChanged(String passwordString),
    Result registerWithEmailAndPasswordPressed(),
    Result signInWithEmailAndPasswordPressed(),
    Result signInWithGooglePressed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (signInWithEmailAndPasswordPressed != null) {
      return signInWithEmailAndPasswordPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result passwordChanged(PasswordChanged value),
    @required
        Result registerWithEmailAndPasswordPressed(
            RegisterWithEmailAndPasswordPresed value),
    @required
        Result signInWithEmailAndPasswordPressed(
            SignInWithEmailAndPasswordPresed value),
    @required Result signInWithGooglePressed(SignInWithGooglePressed value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(registerWithEmailAndPasswordPressed != null);
    assert(signInWithEmailAndPasswordPressed != null);
    assert(signInWithGooglePressed != null);
    return signInWithEmailAndPasswordPressed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result passwordChanged(PasswordChanged value),
    Result registerWithEmailAndPasswordPressed(
        RegisterWithEmailAndPasswordPresed value),
    Result signInWithEmailAndPasswordPressed(
        SignInWithEmailAndPasswordPresed value),
    Result signInWithGooglePressed(SignInWithGooglePressed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (signInWithEmailAndPasswordPressed != null) {
      return signInWithEmailAndPasswordPressed(this);
    }
    return orElse();
  }
}

abstract class SignInWithEmailAndPasswordPresed implements SignInFormEvent {
  const factory SignInWithEmailAndPasswordPresed() =
      _$SignInWithEmailAndPasswordPresed;
}

/// @nodoc
abstract class $SignInWithGooglePressedCopyWith<$Res> {
  factory $SignInWithGooglePressedCopyWith(SignInWithGooglePressed value,
          $Res Function(SignInWithGooglePressed) then) =
      _$SignInWithGooglePressedCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInWithGooglePressedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res>
    implements $SignInWithGooglePressedCopyWith<$Res> {
  _$SignInWithGooglePressedCopyWithImpl(SignInWithGooglePressed _value,
      $Res Function(SignInWithGooglePressed) _then)
      : super(_value, (v) => _then(v as SignInWithGooglePressed));

  @override
  SignInWithGooglePressed get _value => super._value as SignInWithGooglePressed;
}

/// @nodoc
class _$SignInWithGooglePressed implements SignInWithGooglePressed {
  const _$SignInWithGooglePressed();

  @override
  String toString() {
    return 'SignInFormEvent.signInWithGooglePressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SignInWithGooglePressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String emailString),
    @required Result passwordChanged(String passwordString),
    @required Result registerWithEmailAndPasswordPressed(),
    @required Result signInWithEmailAndPasswordPressed(),
    @required Result signInWithGooglePressed(),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(registerWithEmailAndPasswordPressed != null);
    assert(signInWithEmailAndPasswordPressed != null);
    assert(signInWithGooglePressed != null);
    return signInWithGooglePressed();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String emailString),
    Result passwordChanged(String passwordString),
    Result registerWithEmailAndPasswordPressed(),
    Result signInWithEmailAndPasswordPressed(),
    Result signInWithGooglePressed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (signInWithGooglePressed != null) {
      return signInWithGooglePressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result passwordChanged(PasswordChanged value),
    @required
        Result registerWithEmailAndPasswordPressed(
            RegisterWithEmailAndPasswordPresed value),
    @required
        Result signInWithEmailAndPasswordPressed(
            SignInWithEmailAndPasswordPresed value),
    @required Result signInWithGooglePressed(SignInWithGooglePressed value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(registerWithEmailAndPasswordPressed != null);
    assert(signInWithEmailAndPasswordPressed != null);
    assert(signInWithGooglePressed != null);
    return signInWithGooglePressed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result passwordChanged(PasswordChanged value),
    Result registerWithEmailAndPasswordPressed(
        RegisterWithEmailAndPasswordPresed value),
    Result signInWithEmailAndPasswordPressed(
        SignInWithEmailAndPasswordPresed value),
    Result signInWithGooglePressed(SignInWithGooglePressed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (signInWithGooglePressed != null) {
      return signInWithGooglePressed(this);
    }
    return orElse();
  }
}

abstract class SignInWithGooglePressed implements SignInFormEvent {
  const factory SignInWithGooglePressed() = _$SignInWithGooglePressed;
}

/// @nodoc
class _$SignInFormStateTearOff {
  const _$SignInFormStateTearOff();

// ignore: unused_element
  _SignInFormState call(
      {@required EmailAddress emailAddress,
      @required Password password,
      @required bool showErrorMessages,
      @required bool isSubmitting,
      @required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption}) {
    return _SignInFormState(
      emailAddress: emailAddress,
      password: password,
      showErrorMessages: showErrorMessages,
      isSubmitting: isSubmitting,
      authFailureOrSuccessOption: authFailureOrSuccessOption,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SignInFormState = _$SignInFormStateTearOff();

/// @nodoc
mixin _$SignInFormState {
  EmailAddress get emailAddress;
  Password get password;
  bool get showErrorMessages;
  bool get isSubmitting;
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption;

  $SignInFormStateCopyWith<SignInFormState> get copyWith;
}

/// @nodoc
abstract class $SignInFormStateCopyWith<$Res> {
  factory $SignInFormStateCopyWith(
          SignInFormState value, $Res Function(SignInFormState) then) =
      _$SignInFormStateCopyWithImpl<$Res>;
  $Res call(
      {EmailAddress emailAddress,
      Password password,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class _$SignInFormStateCopyWithImpl<$Res>
    implements $SignInFormStateCopyWith<$Res> {
  _$SignInFormStateCopyWithImpl(this._value, this._then);

  final SignInFormState _value;
  // ignore: unused_field
  final $Res Function(SignInFormState) _then;

  @override
  $Res call({
    Object emailAddress = freezed,
    Object password = freezed,
    Object showErrorMessages = freezed,
    Object isSubmitting = freezed,
    Object authFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress as EmailAddress,
      password: password == freezed ? _value.password : password as Password,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages as bool,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption as Option<Either<AuthFailure, Unit>>,
    ));
  }
}

/// @nodoc
abstract class _$SignInFormStateCopyWith<$Res>
    implements $SignInFormStateCopyWith<$Res> {
  factory _$SignInFormStateCopyWith(
          _SignInFormState value, $Res Function(_SignInFormState) then) =
      __$SignInFormStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {EmailAddress emailAddress,
      Password password,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class __$SignInFormStateCopyWithImpl<$Res>
    extends _$SignInFormStateCopyWithImpl<$Res>
    implements _$SignInFormStateCopyWith<$Res> {
  __$SignInFormStateCopyWithImpl(
      _SignInFormState _value, $Res Function(_SignInFormState) _then)
      : super(_value, (v) => _then(v as _SignInFormState));

  @override
  _SignInFormState get _value => super._value as _SignInFormState;

  @override
  $Res call({
    Object emailAddress = freezed,
    Object password = freezed,
    Object showErrorMessages = freezed,
    Object isSubmitting = freezed,
    Object authFailureOrSuccessOption = freezed,
  }) {
    return _then(_SignInFormState(
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress as EmailAddress,
      password: password == freezed ? _value.password : password as Password,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages as bool,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption as Option<Either<AuthFailure, Unit>>,
    ));
  }
}

/// @nodoc
class _$_SignInFormState implements _SignInFormState {
  const _$_SignInFormState(
      {@required this.emailAddress,
      @required this.password,
      @required this.showErrorMessages,
      @required this.isSubmitting,
      @required this.authFailureOrSuccessOption})
      : assert(emailAddress != null),
        assert(password != null),
        assert(showErrorMessages != null),
        assert(isSubmitting != null),
        assert(authFailureOrSuccessOption != null);

  @override
  final EmailAddress emailAddress;
  @override
  final Password password;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption;

  @override
  String toString() {
    return 'SignInFormState(emailAddress: $emailAddress, password: $password, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SignInFormState &&
            (identical(other.emailAddress, emailAddress) ||
                const DeepCollectionEquality()
                    .equals(other.emailAddress, emailAddress)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                const DeepCollectionEquality()
                    .equals(other.showErrorMessages, showErrorMessages)) &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.authFailureOrSuccessOption,
                    authFailureOrSuccessOption) ||
                const DeepCollectionEquality().equals(
                    other.authFailureOrSuccessOption,
                    authFailureOrSuccessOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(emailAddress) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(showErrorMessages) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(authFailureOrSuccessOption);

  @override
  _$SignInFormStateCopyWith<_SignInFormState> get copyWith =>
      __$SignInFormStateCopyWithImpl<_SignInFormState>(this, _$identity);
}

abstract class _SignInFormState implements SignInFormState {
  const factory _SignInFormState(
          {@required
              EmailAddress emailAddress,
          @required
              Password password,
          @required
              bool showErrorMessages,
          @required
              bool isSubmitting,
          @required
              Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption}) =
      _$_SignInFormState;

  @override
  EmailAddress get emailAddress;
  @override
  Password get password;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption;
  @override
  _$SignInFormStateCopyWith<_SignInFormState> get copyWith;
}
