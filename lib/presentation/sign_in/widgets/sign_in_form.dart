import 'package:auto_route/auto_route.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_ddd/application/auth/auth_bloc/auth_bloc.dart';
import 'package:flutter_firebase_ddd/application/auth/sign_in_form/bloc/sign_in_form_bloc.dart';
import 'package:flutter_firebase_ddd/presentation/routes/router.gr.dart';

class SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      builder: (context, state) {
        return Form(
          autovalidate: state.showErrorMessages,
          child: ListView(
            children: [
              const Text(
                '📝',
                style: TextStyle(fontSize: 130),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Email',
                ),
                autocorrect: false,
                onChanged: (value) => context
                    .bloc<SignInFormBloc>()
                    .add(SignInFormEvent.emailChanged(value)),
                validator: (_) => context
                    .bloc<SignInFormBloc>()
                    .state
                    .emailAddress
                    .value
                    .fold(
                      (l) => l.maybeMap(
                          invalidEmail: (_) => 'Invalid Email',
                          orElse: () => null),
                      (_) => null,
                    ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Password',
                ),
                onChanged: (value) => context
                    .bloc<SignInFormBloc>()
                    .add(SignInFormEvent.passwordChanged(value)),
                validator: (_) =>
                    context.bloc<SignInFormBloc>().state.password.value.fold(
                          (l) => l.maybeMap(
                              shortPassword: (_) => 'Short Password',
                              orElse: () => null),
                          (_) => null,
                        ),
                autocorrect: false,
                obscureText: true,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        context.bloc<SignInFormBloc>().add(const SignInFormEvent
                            .signInWithEmailAndPasswordPressed());
                      },
                      child: const Text('SIGN IN'),
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        context.bloc<SignInFormBloc>().add(const SignInFormEvent
                            .registerWithEmailAndPasswordPressed());
                      },
                      child: const Text('REGISTER'),
                    ),
                  ),
                ],
              ),
              RaisedButton(
                onPressed: () {
                  context
                      .bloc<SignInFormBloc>()
                      .add(const SignInFormEvent.signInWithGooglePressed());
                },
                color: Colors.lightBlue,
                child: const Text(
                  'SIGN IN WITH GOOGLE',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (state.isSubmitting) ...[
                const SizedBox(
                  height: 8,
                ),
                const LinearProgressIndicator(),
              ],
            ],
          ),
        );
      },
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold((failure) {
            FlushbarHelper.createError(
                message: failure.map(
              cancelledByUser: (_) => 'Cancelled',
              serverError: (_) => 'Server error',
              emailAlreadyInUse: (_) => 'Email already in use',
              invalidEmailAndPasswordComb: (_) =>
                  'Invalid email and password combination',
            )).show(context);
          }, (_) {
            ExtendedNavigator.of(context).replace(Routes.notesOverviewPage);
            context.bloc<AuthBloc>().add(const AuthEvent.authCheckRequested());
          }),
        );
      },
    );
  }
}
