class Task {
  final String id;
  final String title;
  final String description;
  bool isDone;

  Task({
    required this.id,
    required this.title,
    required this.description,
    this.isDone = false,
  });
}
