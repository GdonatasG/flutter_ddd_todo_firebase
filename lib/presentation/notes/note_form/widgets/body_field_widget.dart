import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_ddd/application/notes/note_form/note_form_bloc.dart';
import 'package:flutter_firebase_ddd/domain/notes/value_objects.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BodyField extends HookWidget {
  const BodyField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textEditingController = useTextEditingController();

    return BlocListener<NoteFormBloc, NoteFormState>(
      listenWhen: (p, s) => p.isEditing != s.isEditing,
      listener: (c, state) {
        textEditingController.text = state.note.body.getOrCrash();
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextFormField(
            controller: textEditingController,
            maxLength: NoteBody.maxLength,
            minLines: 5,
            maxLines: null,
            decoration: const InputDecoration(
              labelText: 'Note',
              counterText: '',
            ),
            onChanged: (value) => context
                .bloc<NoteFormBloc>()
                .add(NoteFormEvent.bodyChanged(value)),
            validator: (_) =>
                context.bloc<NoteFormBloc>().state.note.body.value.fold(
                      (f) => f.maybeMap(
                        orElse: () => null,
                        empty: (f) => 'Cannot be empty',
                        exceedingLength: (f) =>
                            'Exceeding length, max: ${f.maxLength}',
                      ),
                      (r) => null,
                    )),
      ),
    );
  }
}
