import 'package:rest_api/model/user_dob.dart';
import 'package:flutter/material.dart';
import 'package:rest_api/services/user_api.dart';
import 'model/user.dart';

class ApiPage extends StatefulWidget {
  const ApiPage({Key? key}) : super(key: key);



  @override
  State<ApiPage> createState() => _ApiPageState();
}


class _ApiPageState extends State<ApiPage> {

  List<User> users = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUsers();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rest Api'),
        backgroundColor: Colors.black12,
      ),
      body: ListView.builder(
        itemCount: users.length,
          itemBuilder: (context, index){
            final user = users[index];
            final email = user.fullName;
            // final color = user.gender == 'male'? Colors.blue:Colors.red;
            final pass = user.location.postcode;
           return ListTile(
             title: Text(email),
             subtitle: Text(pass),
           );
          }
      ),
    );
  }
  Future<void>fetchUsers()async{
    final response = await UserApi.fetchData();
    setState(() {
      users = response;
    });
  }
}
