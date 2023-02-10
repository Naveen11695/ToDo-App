import 'package:flutter/material.dart';

/// Created by Naveen Verma on 17-12-2021
/// To The New
/// naveen.verma@tothenew.com
///
class TaskTile extends StatelessWidget {
  final String title;
  final bool isChecked;
  final Function onLongPressedCallback;
  final ValueChanged<bool?> onToggleChanged;

  const TaskTile(
      {Key? key,
      required this.title,
      required this.isChecked,
      required this.onLongPressedCallback,
      required this.onToggleChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () => onLongPressedCallback(),
      title: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            color: isChecked ? Colors.black26 : Colors.black,
            fontSize: 18.0,
            decoration:
                isChecked ? TextDecoration.lineThrough : TextDecoration.none),
      ),
      trailing: TaskCheckedBox(
          checkboxState: isChecked, onToggleChanged: onToggleChanged),
    );
  }
}

class TaskCheckedBox extends StatelessWidget {
  final bool checkboxState;
  final ValueChanged<bool?> onToggleChanged;

  const TaskCheckedBox(
      {required this.checkboxState, required this.onToggleChanged, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checkboxState,
      shape: const StadiumBorder(),
      fillColor: MaterialStateProperty.all(Colors.redAccent),
      onChanged: (isChecked) => onToggleChanged(isChecked),
    );
  }
}
