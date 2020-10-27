part of 'note_form_bloc.dart';

@freezed
abstract class NoteFormEvent with _$NoteFormEvent {
  const factory NoteFormEvent.initialized(Option<Note> initialNoteOption) =
      _Initialized;

  const factory NoteFormEvent.bodyChanged(String body) = _BodyChanged;

  const factory NoteFormEvent.colorChanged(Color color) = _ColorChanged;

  const factory NoteFormEvent.todosChanged(
      KtList<TodoItemPrimitive> uncofirmedTodos) = _TodosChanged;

  const factory NoteFormEvent.saved() = _Saved;
}
