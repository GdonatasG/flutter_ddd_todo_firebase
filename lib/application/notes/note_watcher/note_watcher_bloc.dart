import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_ddd/domain/notes/i_note_repository.dart';
import 'package:flutter_firebase_ddd/domain/notes/note.dart';
import 'package:flutter_firebase_ddd/domain/notes/note_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:meta/meta.dart';

part 'note_watcher_event.dart';

part 'note_watcher_state.dart';

part 'note_watcher_bloc.freezed.dart';

@injectable
class NoteWatcherBloc extends Bloc<NoteWatcherEvent, NoteWatcherState> {
  final INoteRepository _noteRepository;

  NoteWatcherBloc(this._noteRepository)
      : super(const NoteWatcherState.initial());

  StreamSubscription<Either<NoteFailure, KtList<Note>>> _noteStreamSub;

  @override
  Stream<NoteWatcherState> mapEventToState(
    NoteWatcherEvent event,
  ) async* {
    yield* event.map(
      watchAllStarted: (e) async* {
        yield const NoteWatcherState.loadInProgress();
        await _noteStreamSub?.cancel();
        _noteStreamSub = _noteRepository.watchAllNotes().listen(
            (failureOrNotes) =>
                add(NoteWatcherEvent.notesReceived(failureOrNotes)));
      },
      watchUncompletedStarted: (e) async* {
        yield const NoteWatcherState.loadInProgress();
        await _noteStreamSub?.cancel();
        _noteStreamSub = _noteRepository.watchUncompleted().listen(
            (failureOrNotes) =>
                add(NoteWatcherEvent.notesReceived(failureOrNotes)));
      },
      notesReceived: (e) async* {
        yield e.failureOrNotes.fold(
          (f) => NoteWatcherState.loadFailure(f),
          (listOfNotes) => NoteWatcherState.loadSuccess(listOfNotes),
        );
      },
    );
  }

  @override
  Future<void> close() async {
    await _noteStreamSub.cancel();
    return super.close();
  }
}
