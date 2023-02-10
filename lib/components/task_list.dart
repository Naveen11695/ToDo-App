import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/components/task_tile.dart';
import 'package:todo_flutter/cubits/states/task_state.dart';
import 'package:todo_flutter/cubits/task_cubit.dart';

/// Created by Naveen Verma on 17-12-2021
/// To The New
/// naveen.verma@tothenew.com

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TaskCubit>();
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        final taskList = state.taskList ?? [];
        return Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: taskList.length,
              itemBuilder: (context, index) {
                return TaskTile(
                  title: taskList[index].name,
                  isChecked: taskList[index].isDone,
                  onToggleChanged: (isChecked) {
                    cubit.toggleIsDone(isChecked ?? false, index);
                  },
                  onLongPressedCallback: () {
                    cubit.deleteTask(taskList[index]);
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }
}
