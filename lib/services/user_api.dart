import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:rest_api/model/user_dob.dart';
import 'package:rest_api/model/user_location.dart';
import '../model/user.dart';
import '../model/userName.dart';

class UserApi{
  static Future<List<User>> fetchData() async {
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
      // final dateTime = users['dob']['date'];

      final Coordinates = LocationCoordinates(
          latitude: users['location']['coordinates']['latitude'],
          longitude: users['location']['coordinates']['longitude'],
      );
      final Timezone = LocationTimeZones(
          description: users['location']['timeZones']['description'],
          offset: users['location']['timeZones']['offset'],
      );
      final Street = LocationStreet(
          num: users['location']['street']['num'],
          name: users['location']['street']['name'],
      );
      final Location = UserLocation(
          coordinates: Coordinates,
          timeZones: Timezone,
          street: Street,
          state: users['location']['state'],
          country: users['location']['country'],
          postcode: users['location']['postcode'],
          city: users['location']['city'],
      );
      return User(
        gender: users['gender'],
        email: users['email'],
        phone: users['phone'],
        cell: users['cell'],
        nat: users['nat'],
        name: Name,

        location: Location,
      );
    }).toList();
    print('fetch user completed');
    return transformed;
  }
}