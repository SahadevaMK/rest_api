class User{
  late  String gender;
  late String email;
  late String phone;
  late String cell;
  late String nat;
  late UserName name;
  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
});
}
class UserName{
   String title;
   String first;
   String last;

  UserName({
   required this.title,
    required this.first,
    required this.last,
});
}