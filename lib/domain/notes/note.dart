import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_ddd/domain/core/failures.dart';
import 'package:flutter_firebase_ddd/domain/core/value_object.dart';
import 'package:flutter_firebase_ddd/domain/notes/todo_item.dart';
import 'package:flutter_firebase_ddd/domain/notes/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';

part 'note.freezed.dart';

@freezed
abstract class Note implements _$Note {
  const Note._();

  const factory Note({
    @required UniqueId id,
    @required NoteBody body,
    @required NoteColor color,
    @required List3<TodoItem> listOfTodo,
  }) = _Note;

  factory Note.empty() => Note(
        id: UniqueId(),
        body: NoteBody(''),
        color: NoteColor(NoteColor.predefinedColors[0]),
        listOfTodo: List3(emptyList()),
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return body.failureOrUnit
        .andThen(listOfTodo.failureOrUnit)
        .andThen(
          listOfTodo
              .getOrCrash()
              .map((todoItem) => todoItem.failureOption)
              .filter((o) => o.isSome())
              .getOrElse(0, (_) => none())
              .fold(() => right(unit), (f) => left(f)),
        )
        .fold((f) => some(f), (_) => none());
  }
}
