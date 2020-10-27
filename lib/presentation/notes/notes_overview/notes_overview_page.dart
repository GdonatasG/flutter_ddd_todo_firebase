import 'package:auto_route/auto_route.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_ddd/application/auth/auth_bloc/auth_bloc.dart';
import 'package:flutter_firebase_ddd/application/notes/note_actor/note_actor_bloc.dart';
import 'package:flutter_firebase_ddd/application/notes/note_watcher/note_watcher_bloc.dart';
import 'package:flutter_firebase_ddd/injection.dart';
import 'package:flutter_firebase_ddd/presentation/notes/notes_overview/widgets/notes_overview_body.dart';
import 'package:flutter_firebase_ddd/presentation/notes/notes_overview/widgets/uncompleted_switch.dart';
import 'package:flutter_firebase_ddd/presentation/routes/router.gr.dart';

class NotesOverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NoteWatcherBloc>(
            create: (c) => getIt<NoteWatcherBloc>()
              ..add(const NoteWatcherEvent.watchAllStarted())),
        BlocProvider<NoteActorBloc>(create: (c) => getIt<NoteActorBloc>()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(listener: (c, s) {
            s.maybeMap(
              unauthenticated: (_) =>
                  ExtendedNavigator.of(context).replace(Routes.signInPage),
              orElse: () {},
            );
          }),
          BlocListener<NoteActorBloc, NoteActorState>(
            listener: (c, s) {
              s.maybeWhen(
                deleteFailure: (state) {
                  FlushbarHelper.createError(
                    duration: const Duration(seconds: 5),
                    message: state.map(
                      unexpected: (_) =>
                          'Unexpected error occured while deleting, please contact support.',
                      insufficientPermission: (_) =>
                          'Insufficient permissions ❌',
                      unableToUpdate: (_) => 'Impossible error',
                    ),
                  ).show(context);
                },
                orElse: () {},
              );
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Notes'),
            leading: IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                context.bloc<AuthBloc>().add(const AuthEvent.signedOut());
              },
            ),
            actions: [
              UncompletedSwitch(),
            ],
          ),
          body: NotesOverviewBody(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              ExtendedNavigator.of(context).pushNoteFormPage(note: null);
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
