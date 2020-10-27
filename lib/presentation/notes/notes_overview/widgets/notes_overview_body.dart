import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_ddd/application/notes/note_watcher/note_watcher_bloc.dart';
import 'package:flutter_firebase_ddd/domain/notes/note.dart';
import 'package:flutter_firebase_ddd/presentation/notes/notes_overview/widgets/critical_failure_display_widget.dart';
import 'package:flutter_firebase_ddd/presentation/notes/notes_overview/widgets/error_note_card_widget.dart';
import 'package:flutter_firebase_ddd/presentation/notes/notes_overview/widgets/note_card_widget.dart';
import 'package:kt_dart/collection.dart';

class NotesOverviewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteWatcherBloc, NoteWatcherState>(
        builder: (context, state) {
      return state.map(
        initial: (_) => Container(),
        loadInProgress: (_) => const Center(
          child: CircularProgressIndicator(),
        ),
        loadSuccess: (state) => state.listOfNotes.size > 0
            ? _showNotes(state.listOfNotes)
            : _showEmptyListMessage(),
        loadFailure: (state) => CriticalFailureDisplay(
          failure: state.noteFailure,
        ),
      );
    });
  }

  ListView _showNotes(KtList<Note> listOfNotes) => ListView.builder(
        itemCount: listOfNotes.size,
        itemBuilder: (context, index) {
          final note = listOfNotes[index];
          if (note.failureOption.isSome()) {
            return ErrorNoteCard(
              note: note,
            );
          } else {
            return NoteCard(note: note);
          }
        },
      );

  Center _showEmptyListMessage() => const Center(
        child: Text('Nothing to show 🙄'),
      );
}
