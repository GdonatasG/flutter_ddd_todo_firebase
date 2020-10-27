import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_ddd/domain/notes/note.dart';
import 'package:flutter_firebase_ddd/domain/notes/note_failure.dart';
import 'package:kt_dart/collection.dart';

abstract class INoteRepository {
  Stream<Either<NoteFailure, KtList<Note>>> watchAllNotes();
  Stream<Either<NoteFailure, KtList<Note>>> watchUncompleted();
  Future<Either<NoteFailure, Unit>> createNote(Note note);
  Future<Either<NoteFailure, Unit>> updateNote(Note note);
  Future<Either<NoteFailure, Unit>> deleteNote(Note note);
}
