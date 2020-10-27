import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_ddd/application/notes/note_form/note_form_bloc.dart';
import 'package:flutter_firebase_ddd/domain/notes/note.dart';
import 'package:flutter_firebase_ddd/injection.dart';
import 'package:flutter_firebase_ddd/presentation/notes/note_form/misc/todo_item_presentation_classes.dart';
import 'package:flutter_firebase_ddd/presentation/notes/note_form/widgets/add_todo_tile_widget.dart';
import 'package:flutter_firebase_ddd/presentation/notes/note_form/widgets/body_field_widget.dart';
import 'package:flutter_firebase_ddd/presentation/notes/note_form/widgets/color_field_widget.dart';
import 'package:flutter_firebase_ddd/presentation/notes/note_form/widgets/todo_list_widget.dart';
import 'package:flutter_firebase_ddd/presentation/routes/router.gr.dart';
import 'package:provider/provider.dart';

class NoteFormPage extends StatelessWidget {
  final Note note;

  const NoteFormPage({Key key, @required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (c) =>
          getIt<NoteFormBloc>()..add(NoteFormEvent.initialized(optionOf(note))),
      child: BlocConsumer<NoteFormBloc, NoteFormState>(
        listenWhen: (p, s) =>
            p.saveFailureOrSuccessOption != s.saveFailureOrSuccessOption,
        listener: (c, s) {
          s.saveFailureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                FlushbarHelper.createError(
                  message: failure.map(
                    insufficientPermission: (_) => 'Insufficient permissions ❌',
                    unableToUpdate: (_) =>
                        "Couldn't update the note. Was it deleted from another device?",
                    unexpected: (_) =>
                        'Unexpected error occured, please contact support.',
                  ),
                ).show(context);
              },
              (_) {
                ExtendedNavigator.of(context).popUntil(
                    (route) => route.settings.name == Routes.notesOverviewPage);
              },
            ),
          );
        },
        buildWhen: (p, s) => p.isSaving != s.isSaving,
        builder: (c, s) => Stack(
          children: [
            NoteFormPageScaffold(),
            SavingInProgressOverlay(
              isSaving: s.isSaving,
            ),
          ],
        ),
      ),
    );
  }
}

class SavingInProgressOverlay extends StatelessWidget {
  final bool isSaving;

  const SavingInProgressOverlay({Key key, @required this.isSaving})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !isSaving,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        color: isSaving ? Colors.black.withOpacity(0.8) : Colors.transparent,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Visibility(
          visible: isSaving,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Saving',
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NoteFormPageScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<NoteFormBloc, NoteFormState>(
          buildWhen: (p, s) => p.isEditing != s.isEditing,
          // p - previous state, s - current state
          builder: (c, s) {
            return Text(s.isEditing ? 'Edit a note' : 'Create a note');
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              context.bloc<NoteFormBloc>().add(const NoteFormEvent.saved());
            },
          )
        ],
      ),
      body: BlocBuilder<NoteFormBloc, NoteFormState>(
          buildWhen: (p, s) => p.showErrorMessages != s.showErrorMessages,
          builder: (c, s) {
            return ChangeNotifierProvider(
              create: (_) => FormTodos(),
              child: Form(
                autovalidate: s.showErrorMessages,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const BodyField(),
                      const ColorField(),
                      const TodoList(),
                      const AddTodoTile(),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
