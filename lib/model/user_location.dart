class UserLocation {
   late String city ;
   late String state;
   late String country;
   late String postcode;
   late LocationCoordinates coordinates;
   late LocationTimeZones timeZones;
   late LocationStreet street;

   UserLocation({
     required this.coordinates,
     required this.timeZones,
     required this.street,
     required this.state,
     required this.country,
     required this.postcode,
     required this.city,
});

}
class LocationCoordinates{
  final String latitude ;
  final String longitude ;

  LocationCoordinates({
    required this.latitude,
    required this.longitude,
});
}
class LocationTimeZones{
  final String offset;
  final String description;
  LocationTimeZones({
    required this.description,
    required this.offset,
});
}
class LocationStreet{
  String num;
  String name;

  LocationStreet({
    required this.num,
    required this.name,
});
}