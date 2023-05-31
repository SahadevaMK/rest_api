import 'dart:convert';
import 'package:rest_api/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;

class ApiPage extends StatefulWidget {
  const ApiPage({Key? key}) : super(key: key);

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  List<User> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rest Api'),
        backgroundColor: Colors.black12,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchData,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: users.length,
          itemBuilder: (context, index){
            final user = users[index];
            final email = user.name.first;
            // final color = user.gender == 'male'? Colors.blue:Colors.red;
            final pass = user.phone;
           return ListTile(
             title: Text(email),
             subtitle: Text(pass),
           );
          }
      ),
    );
  }

  void fetchData() async {
    print('fetch data');
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await https.get(uri);
    final body = response.body;
    final jsonBody = jsonDecode(body);
    final results = jsonBody['results'] as List<dynamic>;

    final transformed = results.map((users){
      final Name = UserName(
          title: users['name']['title'],
          first: users['name']['first'],
          last: users['name']['last'],
      );
      return User(
          gender: users['gender'],
          email: users['email'],
          phone: users['phone'],
          cell: users['cell'],
          nat: users['nat'],
          name: Name,
      );
    }).toList();
    setState(() {
      users = transformed;
    });
    print('fetch user completed');
  }
}
