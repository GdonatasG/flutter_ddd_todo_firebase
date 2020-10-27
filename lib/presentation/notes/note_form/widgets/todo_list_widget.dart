import 'dart:ui';

import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_ddd/application/notes/note_form/note_form_bloc.dart';
import 'package:flutter_firebase_ddd/domain/notes/value_objects.dart';
import 'package:flutter_firebase_ddd/presentation/notes/note_form/misc/todo_item_presentation_classes.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:kt_dart/collection.dart';
import 'package:provider/provider.dart';
import 'package:flutter_firebase_ddd/presentation/notes/note_form/misc/build_context_x.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<NoteFormBloc, NoteFormState>(
      listenWhen: (p, c) =>
          p.note.listOfTodo.isFull != c.note.listOfTodo.isFull,
      listener: (context, state) {
        if (state.note.listOfTodo.isFull) {
          FlushbarHelper.createAction(
            message: 'Want longer list? Activate premium 😍',
            button: FlatButton(
              onPressed: () {},
              child: const Text(
                'BUY NOW!',
                style: TextStyle(color: Colors.yellow),
              ),
            ),
            duration: const Duration(seconds: 5),
          ).show(context);
        }
      },
      child: Consumer<FormTodos>(
        builder: (context, formTodos, child) {
          return ImplicitlyAnimatedReorderableList<TodoItemPrimitive>(
            items: context.formTodos.asList(),
            shrinkWrap: true,
            updateDuration: const Duration(milliseconds: 50),
            removeDuration: const Duration(milliseconds: 250),
            areItemsTheSame: (oldItem, newItem) => oldItem.id == newItem.id,
            onReorderFinished: (item, from, to, newItems) {
              context.formTodos = newItems.toImmutableList();
              context
                  .bloc<NoteFormBloc>()
                  .add(NoteFormEvent.todosChanged(context.formTodos));
            },
            itemBuilder: (context, itemAnimation, item, index) {
              return Reorderable(
                key: ValueKey(item.id),
                builder: (context, dragAnimation, inDrag) {
                  final elevation = lerpDouble(0, 8, dragAnimation.value);
                  return ScaleTransition(
                    scale: Tween<double>(begin: 1, end: 0.95)
                        .animate(dragAnimation),
                    child: TodoTile(
                      // We have to pass in the index and not a complete TodoItemPrimitive to always get the most fresh value held in FormTodos
                      index: index,
                      elevation: elevation,
                    ),
                  );
                },
              );
            },
            updateItemBuilder: (context, itemAnimation, item) {
              return Reorderable(
                key: ValueKey(item.id),
                builder: (context, dragAnimation, inDrag) {
                  return StaticTodoTile(
                    todo: item,
                  );
                },
              );
            },
            removeItemBuilder: (context, itemAnimation, item) {
              return Reorderable(
                key: ValueKey(item.id),
                builder: (context, dragAnimation, inDrag) {
                  return FadeTransition(
                    opacity: itemAnimation,
                    child: StaticTodoTile(
                      todo: item,
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class StaticTodoTile extends StatelessWidget {
  final TodoItemPrimitive todo;
  final double elevation;

  const StaticTodoTile({
    Key key,
    @required this.todo,
    double elevation,
  })  : elevation = elevation ?? 0,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      actionExtentRatio: 0.15,
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          icon: Icons.delete,
          color: Colors.red,
        ),
      ],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Material(
          elevation: elevation,
          animationDuration: const Duration(milliseconds: 100),
          borderRadius: BorderRadius.circular(8),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8)),
            child: ListTile(
              leading: Checkbox(
                value: todo.isDone,
                onChanged: (_) {},
              ),
              trailing: const Handle(
                child: Icon(
                  Icons.list,
                ),
              ),
              title: TextFormField(
                initialValue: todo.name,
                enabled: false,
                decoration: const InputDecoration(
                  hintText: 'Todo',
                  counterText: '',
                  border: InputBorder.none,
                ),
                maxLength: TodoName.maxLength,
                maxLengthEnforced: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TodoTile extends HookWidget {
  final int index;
  final double elevation;

  const TodoTile({@required this.index, double elevation, Key key})
      : elevation = elevation ?? 0,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final todo =
        context.formTodos.getOrElse(index, (_) => TodoItemPrimitive.empty());
    final todoTextController = useTextEditingController(text: todo.name);

    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      actionExtentRatio: 0.15,
      secondaryActions: [
        IconSlideAction(
          caption: 'Delete',
          icon: Icons.delete,
          color: Colors.red,
          onTap: () {
            context.formTodos = context.formTodos.minusElement(todo);
            context
                .bloc<NoteFormBloc>()
                .add(NoteFormEvent.todosChanged(context.formTodos));
          },
        )
      ],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Material(
          elevation: elevation,
          animationDuration: const Duration(milliseconds: 100),
          borderRadius: BorderRadius.circular(8),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ListTile(
              leading: Checkbox(
                value: todo.isDone,
                onChanged: (v) {
                  context.formTodos = context.formTodos.map((listTodo) =>
                      listTodo == todo ? todo.copyWith(isDone: v) : listTodo);
                  context
                      .bloc<NoteFormBloc>()
                      .add(NoteFormEvent.todosChanged(context.formTodos));
                },
              ),
              trailing: const Handle(
                child: Icon(
                  Icons.list,
                ),
              ),
              title: TextFormField(
                controller: todoTextController,
                onChanged: (v) {
                  context.formTodos = context.formTodos.map((listTodo) =>
                      listTodo == todo ? todo.copyWith(name: v) : listTodo);
                  context
                      .bloc<NoteFormBloc>()
                      .add(NoteFormEvent.todosChanged(context.formTodos));
                },
                validator: (_) {
                  return context
                      .bloc<NoteFormBloc>()
                      .state
                      .note
                      .listOfTodo
                      .value
                      .fold((f) => null, (todoList) => todoList[index])
                      .name
                      .value
                      .fold(
                        (f) => f.maybeMap(
                          empty: (_) => 'Cannot be empty',
                          exceedingLength: (_) => 'Too long',
                          multiline: (_) => 'Has to be in a single line',
                          orElse: () => null,
                        ),
                        (_) => null,
                      );
                },
                decoration: InputDecoration(
                  hintText: 'Todo',
                  counterText: '',
                  border: InputBorder.none,
                ),
                maxLength: TodoName.maxLength,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
