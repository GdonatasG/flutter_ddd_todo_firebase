import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_ddd/application/auth/auth_bloc/auth_bloc.dart';
import 'package:flutter_firebase_ddd/injection.dart';
import 'package:flutter_firebase_ddd/presentation/routes/router.gr.dart'
    as router;
import 'package:flutter_firebase_ddd/presentation/sign_in/sign_in_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (c) => getIt<AuthBloc>()
            ..add(
              const AuthEvent.authCheckRequested(),
            ),
        ),
      ],
      child: MaterialApp(
        title: 'Firebase Notes DDD',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          primaryColor: Colors.green[800],
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.blue[900],
          ),
          accentColor: Colors.blueAccent,
          inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          )),
        ),
        builder: ExtendedNavigator<router.Router>(router: router.Router()),
      ),
    );
  }
}
