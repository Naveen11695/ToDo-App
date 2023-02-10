import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

/// Created by Naveen Verma on 17-12-2021
/// To The New
/// naveen.verma@tothenew.com

@JsonSerializable()
class Task extends Equatable {
  final String name;
  final bool isDone;

  const Task({required this.name, this.isDone = false});

  @override
  List<Object> get props => [name, isDone];

  Task copyWith({
    String? name,
    bool? isDone,
  }) {
    return Task(
      name: name ?? this.name,
      isDone: isDone ?? this.isDone,
    );
  }

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
