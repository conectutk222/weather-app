import 'package:geolocator/geolocator.dart';
Future<Position> getlocation()async{
  bool ispermission;
  Position currentlocation;
  LocationPermission getpermision ;
  getpermision = await Geolocator.requestPermission();
  ispermission = await Geolocator.isLocationServiceEnabled();
  currentlocation = await Geolocator.getCurrentPosition();
  if (ispermission==LocationPermission.denied){
    getpermision = await Geolocator.requestPermission();
    currentlocation = await Geolocator.getCurrentPosition();
  }
  return currentlocation;
}