import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_ddd/application/notes/note_form/note_form_bloc.dart';
import 'package:flutter_firebase_ddd/presentation/notes/note_form/misc/todo_item_presentation_classes.dart';
import 'package:kt_dart/collection.dart';
import 'package:flutter_firebase_ddd/presentation/notes/note_form/misc/build_context_x.dart';

class AddTodoTile extends StatelessWidget {
  const AddTodoTile();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteFormBloc, NoteFormState>(
      listenWhen: (p, s) => p.isEditing != s.isEditing,
      listener: (c, s) {
        context.formTodos = s.note.listOfTodo.value.fold(
          (f) => listOf<TodoItemPrimitive>(),
          (listOfTodo) => listOfTodo
              .map((todoItem) => TodoItemPrimitive.fromDomain(todoItem)),
        );
      },
      buildWhen: (p, s) => p.note.listOfTodo.isFull != s.note.listOfTodo.isFull,
      builder: (c, s) {
        return ListTile(
          title: const Text('Add todo'),
          leading: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(Icons.add),
          ),
          enabled: !s.note.listOfTodo.isFull,
          onTap: () {
            context.formTodos =
                context.formTodos.plusElement(TodoItemPrimitive.empty());
            final noteFormBloc = context.bloc<NoteFormBloc>();
            noteFormBloc.add(NoteFormEvent.todosChanged(context.formTodos));
          },
        );
      },
    );
  }
}
