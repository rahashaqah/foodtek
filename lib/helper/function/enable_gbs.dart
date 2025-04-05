import 'package:geolocator/geolocator.dart';

// Function to request GPS permission and enable it
Future<void> enableGPS() async {
  LocationPermission permission = await Geolocator.requestPermission();
  if (permission == LocationPermission.denied) {
    // Handle case where user denies permission
    // You might want to show a dialog or message to explain why GPS is needed
    return;
  }

  if (permission == LocationPermission.deniedForever) {
    // Handle case where user denies permission permanently
    // You might want to direct the user to app settings
    return;
  }

  // Permission granted, enable GPS
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // GPS service is not enabled, prompt user to enable it
    bool serviceRequest = await Geolocator.openLocationSettings();
    if (!serviceRequest) {
      // Handle case where user cancels opening GPS settings
      return;
    }
  }

}
