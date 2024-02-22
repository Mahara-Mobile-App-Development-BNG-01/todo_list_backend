
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_list_backend1/task.dart';

Future<List<Task>> fetchTodosFromAPI() async {

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
