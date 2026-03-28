import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> _tasks = [
    Task(
      id: '1',
      title: 'Buy groceries',
      description: 'Milk, eggs, bread, and fresh vegetables from the market.',
      isDone: false,
    ),
    Task(
      id: '2',
      title: 'Complete Flutter project',
      description: 'Finish building the task management app with all features.',
      isDone: true,
    ),
    Task(
      id: '3',
      title: 'Read a book',
      description: 'Read at least 30 pages of "Clean Code" by Robert C. Martin.',
      isDone: false,
    ),
    Task(
      id: '4',
      title: 'Morning workout',
      description: '30 minutes of cardio and 20 minutes of strength training.',
      isDone: true,
    ),
  ];

  bool _showOnlyIncomplete = false;

  List<Task> get tasks {
    if (_showOnlyIncomplete) {
      return _tasks.where((task) => !task.isDone).toList();
    }
    return List.unmodifiable(_tasks);
  }

  bool get showOnlyIncomplete => _showOnlyIncomplete;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void deleteTask(String id) {
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }

  void toggleDone(String id) {
    final index = _tasks.indexWhere((task) => task.id == id);
    if (index != -1) {
      _tasks[index].isDone = !_tasks[index].isDone;
      notifyListeners();
    }
  }

  void toggleFilter() {
    _showOnlyIncomplete = !_showOnlyIncomplete;
    notifyListeners();
  }
}
