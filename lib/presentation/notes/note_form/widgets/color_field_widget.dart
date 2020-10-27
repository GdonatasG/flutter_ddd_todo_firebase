import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_ddd/application/notes/note_form/note_form_bloc.dart';
import 'package:flutter_firebase_ddd/domain/notes/value_objects.dart';

class ColorField extends StatelessWidget {
  const ColorField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteFormBloc, NoteFormState>(
        buildWhen: (p, s) => p.note.color != s.note.color,
        builder: (context, state) {
          return SizedBox(
            height: 80,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final itemColor = NoteColor.predefinedColors[index];
                return GestureDetector(
                  onTap: () {
                    context
                        .bloc<NoteFormBloc>()
                        .add(NoteFormEvent.colorChanged(itemColor));
                  },
                  child: Material(
                    color: itemColor,
                    elevation: 4,
                    shape: CircleBorder(
                      side: state.note.color.value.fold(
                        (_) => BorderSide.none,
                        (color) => color == itemColor
                            ? const BorderSide(width: 1.5)
                            : BorderSide.none,
                      ),
                    ),
                    child: const SizedBox(
                      width: 50,
                      height: 50,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 12,
                );
              },
              itemCount: NoteColor.predefinedColors.length,
            ),
          );
        });
  }
}
