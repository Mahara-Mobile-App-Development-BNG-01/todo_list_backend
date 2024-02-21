import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  fetchTodos();
  runApp(MyApp());
}

Future<List<Task>> fetchTodos() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/todos'),
  );

  final responseList = jsonDecode(response.body) as List<dynamic>;

  final listOfTos = responseList
      .map(
        (e) => Task.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList();

  return listOfTos;
}

class Task {
  final String title;
  final bool completed;

  Task({required this.title, required this.completed});

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        title: json['title'],
        completed: json['completed'],
      );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('TODO List'),
        ),
        body: FutureBuilder(
            future: fetchTodos(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      ...snapshot.data!.map(
                        (task) => CheckboxListTile(
                          title: Text(task.title),
                          value: task.completed,
                          onChanged: (newValue) {},
                        ),
                      ),
                    ],
                  ),
                );
              }

              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}
