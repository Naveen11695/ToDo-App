import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:todo_flutter/cubits/states/task_state.dart';
import 'package:todo_flutter/models/task.dart';

/// Created by Naveen Verma on 17-12-2021
/// To The New
/// naveen.verma@tothenew.com
///

class TaskCubit extends HydratedCubit<TaskState> {
  TaskCubit() : super(const TaskState());

  void addTask(String text) {
    final taskList = [...?state.taskList, Task(name: text, isDone: false)];
    emit(TaskState(taskList: taskList));
  }

  void toggleIsDone(bool isChecked, int i) {
    var newList = [...?state.taskList];
    newList[i] = newList[i].copyWith(isDone: isChecked);
    final newState = state.copyWith(taskList: newList);
    emit(newState);
  }

  void deleteTask(Task task) {
    var newList = [...?state.taskList];
    final taskList = state.copyWith(taskList: newList..remove(task));
    emit(taskList);
  }

  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    final initialData = TaskState.fromMap(json);
    emit(initialData);
    return TaskState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TaskState state) {
    return state.toMap();
  }
}
