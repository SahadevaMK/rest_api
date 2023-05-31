import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;

class ApiPage extends StatefulWidget {
  const ApiPage({Key? key}) : super(key: key);

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  List<dynamic> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rest Api'),
        backgroundColor: Colors.black12,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchData,
        backgroundColor: Colors.black12,
      ),
      body: ListView.builder(
        itemCount: users.length,
          itemBuilder: (context, index){
            final user = users[index];
            final email = user['email'];
            final name = user['name']['first'];
            final imageUrl = user['picture']['thumbnail'];
           return ListTile(
             leading: CircleAvatar(
               child: ClipRRect(child: Image.network(imageUrl),borderRadius: BorderRadius.circular(100),),
             ),
             subtitle: Text(email),
             title: Text(name),
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
    setState(() {
      users = jsonBody['results'];
    });
    print('fetch user completed');
  }
}
