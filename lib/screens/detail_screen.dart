import 'package:flutter/material.dart';
import '../models/task.dart';

class DetailScreen extends StatelessWidget {
  final Task task;

  const DetailScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.title,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Icon(
                  task.isDone ? Icons.check_circle : Icons.radio_button_unchecked,
                  color: task.isDone ? Colors.green : Colors.grey,
                  size: 28,
                ),
                const SizedBox(width: 8),
                Text(
                  task.isDone ? 'Completed' : 'Incomplete',
                  style: TextStyle(
                    fontSize: 16,
                    color: task.isDone ? Colors.green : Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Description',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              task.description.isNotEmpty ? task.description : 'No description provided.',
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
