import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_ddd/application/notes/note_watcher/note_watcher_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UncompletedSwitch extends HookWidget {
  static const SWITCH_KEY_OUTLINE = 'outline';
  static const SWITCH_KEY_INDETERMINATE = 'indeterminate';

  @override
  Widget build(BuildContext context) {
    final toggleState = useState(false);
    final noteWatcherBloc = context.bloc<NoteWatcherBloc>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkResponse(
        onTap: () {
          toggleState.value = !toggleState.value;
          if (toggleState.value) {
            noteWatcherBloc.add(const NoteWatcherEvent.watchAllStarted());
          } else {
            noteWatcherBloc
                .add(const NoteWatcherEvent.watchUncompletedStarted());
          }
        },
        child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) => ScaleTransition(
                  scale: animation,
                  child: child,
                ),
            child: toggleState.value
                ? const Icon(
                    Icons.check_box_outline_blank,
                    key: Key(SWITCH_KEY_OUTLINE),
                  )
                : const Icon(
                    Icons.indeterminate_check_box,
                    key: Key(SWITCH_KEY_INDETERMINATE),
                  )),
      ),
    );
  }
}
