import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_ddd/application/auth/sign_in_form/bloc/sign_in_form_bloc.dart';
import 'package:flutter_firebase_ddd/injection.dart';
import 'package:flutter_firebase_ddd/presentation/sign_in/widgets/sign_in_form.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: BlocProvider(
        create: (c) => getIt<SignInFormBloc>(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SignInForm(),
        ),
      ),
    );
  }
}
