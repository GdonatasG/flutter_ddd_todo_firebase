import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_ddd/domain/core/value_object.dart';
import 'package:flutter_firebase_ddd/domain/notes/note.dart';
import 'package:flutter_firebase_ddd/domain/notes/todo_item.dart';
import 'package:flutter_firebase_ddd/domain/notes/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';

part 'note_dtos.freezed.dart';

part 'note_dtos.g.dart';

@freezed
abstract class NoteDTO implements _$NoteDTO {
  const NoteDTO._();

  const factory NoteDTO({
    @JsonKey(ignore: true) String id,
    @required String body,
    @required int color,
    @required List<TodoItemDTO> listOfTodo,
    @required @ServerTimestampConverter() FieldValue serverTimeStamp,
  }) = _NoteDTO;

  factory NoteDTO.fromDomain(Note note) {
    return NoteDTO(
      id: note.id.getOrCrash(),
      body: note.body.getOrCrash(),
      color: note.color.getOrCrash().value,
      listOfTodo: note.listOfTodo
          .getOrCrash()
          .map(
            (todoItem) => TodoItemDTO.fromDomain(todoItem),
          )
          .asList(),
      serverTimeStamp: FieldValue.serverTimestamp(),
    );
  }

  Note toDomain() {
    return Note(
      id: UniqueId.fromUniqueString(id),
      body: NoteBody(body),
      color: NoteColor(Color(color)),
      listOfTodo:
          List3(listOfTodo.map((dto) => dto.toDomain()).toImmutableList()),
    );
  }

  factory NoteDTO.fromJson(Map<String, dynamic> json) =>
      _$NoteDTOFromJson(json);

  factory NoteDTO.fromFirestore(DocumentSnapshot doc) =>
      NoteDTO.fromJson(doc.data()).copyWith(id: doc.id);
}

class ServerTimestampConverter implements JsonConverter<FieldValue, Object> {
  const ServerTimestampConverter();

  @override
  FieldValue fromJson(Object json) {
    return FieldValue.serverTimestamp();
  }

  @override
  Object toJson(FieldValue value) => value;
}

@freezed
abstract class TodoItemDTO implements _$TodoItemDTO {
  const TodoItemDTO._();

  const factory TodoItemDTO({
    @required String id,
    @required String name,
    @required bool isDone,
  }) = _TodoItemDTO;

  factory TodoItemDTO.fromDomain(TodoItem todoItem) {
    return TodoItemDTO(
      id: todoItem.id.getOrCrash(),
      name: todoItem.name.getOrCrash(),
      isDone: todoItem.isDone,
    );
  }

  TodoItem toDomain() {
    return TodoItem(
      id: UniqueId.fromUniqueString(id),
      name: TodoName(name),
      isDone: isDone,
    );
  }

  factory TodoItemDTO.fromJson(Map<String, dynamic> json) =>
      _$TodoItemDTOFromJson(json);
}
