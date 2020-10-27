import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_ddd/application/auth/auth_bloc/auth_bloc.dart';
import 'package:flutter_firebase_ddd/presentation/routes/router.gr.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(
          initial: (_) {},
          unauthenticated: (_) =>
              ExtendedNavigator.of(context).replace(Routes.signInPage),
          authenticated: (_) {
            ExtendedNavigator.of(context).replace(Routes.notesOverviewPage);
          },
        );
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
