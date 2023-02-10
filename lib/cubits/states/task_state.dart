import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:todo_flutter/models/task.dart';

class TaskState extends Equatable {
  final List<Task>? taskList;

  const TaskState({this.taskList});

  @override
  List<Object?> get props => [taskList];

  TaskState copyWith({
    List<Task>? taskList,
  }) {
    return TaskState(
      taskList: taskList ?? this.taskList,
    );
  }

  Map<String, dynamic> toMap() {
    var json = jsonEncode(taskList?.map((e) => e.toJson()).toList());
    return {
      'taskList': json,
    };
  }

  factory TaskState.fromMap(Map<String, dynamic> map) {
    final List<Task> list = (jsonDecode(map['taskList']) as List)
        .map((task) => Task.fromJson(task))
        .toList();
    return TaskState(
      taskList: list,
    );
  }
}
