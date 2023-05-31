import 'package:rest_api/model/userName.dart';
import 'package:rest_api/model/user_dob.dart';
import 'package:rest_api/model/user_location.dart';

class User{
  late  String gender;
  late String email;
  late String phone;
  late String cell;
  late String nat;
  late UserName name;
  // late UserDob dob;
  late UserLocation location;
  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
    // required this.dob,
    required this.location
  });
  String get fullName{
    return '${name.title} ${name.first} ${name.last}';
  }
}
