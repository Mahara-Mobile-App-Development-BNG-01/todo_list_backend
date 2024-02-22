import 'package:todo_list_backend1/task.dart';

sealed class AsyncTasksState {}

 class AsyncTaskStateError extends AsyncTasksState {
  final Object? error;

  AsyncTaskStateError({
     this.error,
  });
}

 class AsyncTaskStateLoading extends AsyncTasksState {}

 class AsyncTaskStateLoaded extends AsyncTasksState {
  final List<Task> tasks;
  final List<Task> filteredTasks;
  final TaskFilter taskFilter;

  AsyncTaskStateLoaded({
    required this.tasks,
    this.filteredTasks = const [],
    this.taskFilter = TaskFilter.all,
  });

  AsyncTaskStateLoaded copyWith({
    List<Task>? tasks,
    List<Task>? filteredTasks,
    TaskFilter? taskFilter,
  }) {
    return AsyncTaskStateLoaded(
      tasks: tasks ?? this.tasks,
      filteredTasks: filteredTasks ?? this.filteredTasks,
      taskFilter: taskFilter ?? this.taskFilter,
    );
  }
}

enum TaskFilter {
  all,
  done,
  notDone,
}
