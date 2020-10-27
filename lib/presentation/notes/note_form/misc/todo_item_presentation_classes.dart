import 'package:flutter/cupertino.dart';
import 'package:flutter_firebase_ddd/domain/core/value_object.dart';
import 'package:flutter_firebase_ddd/domain/notes/todo_item.dart';
import 'package:flutter_firebase_ddd/domain/notes/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';

part 'todo_item_presentation_classes.freezed.dart';

class FormTodos extends ValueNotifier<KtList<TodoItemPrimitive>> {
  FormTodos() : super(emptyList<TodoItemPrimitive>());
}

@freezed
abstract class TodoItemPrimitive implements _$TodoItemPrimitive {
  const TodoItemPrimitive._();

  const factory TodoItemPrimitive({
    @required UniqueId id,
    @required String name,
    @required bool isDone,
  }) = _TodoItemPrimitive;

  factory TodoItemPrimitive.empty() => TodoItemPrimitive(
        id: UniqueId(),
        name: '',
        isDone: false,
      );

  factory TodoItemPrimitive.fromDomain(TodoItem todoItem) {
    return TodoItemPrimitive(
        id: todoItem.id,
        name: todoItem.name.getOrCrash(),
        isDone: todoItem.isDone);
  }

  TodoItem toDomain() {
    return TodoItem(
      id: id,
      name: TodoName(name),
      isDone: isDone,
    );
  }
}
