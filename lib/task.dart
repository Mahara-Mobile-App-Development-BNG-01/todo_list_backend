
class Task {
  final String title;
  final bool completed;

  Task({required this.title, required this.completed});

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    title: json['title'],
    completed: json['completed'],
  );
}