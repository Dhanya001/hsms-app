import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Housing Society Management'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // About Us Section
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Image.asset('assets/about_us_image.jpg'),
                  SizedBox(height: 16.0),
                  Text(
                    'About Us',
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Welcome to our housing society management app. We are committed to providing the best services for our residents.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            // Map Section
        /*    Container(
              height: 300.0,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(37.7749, -122.4194),
                  zoom: 12.0,
                ),
                markers: {
                  Marker(
                    markerId: MarkerId('society'),
                    position: LatLng(37.7749, -122.4194),
                    infoWindow: InfoWindow(title: 'Our Society'),
                  ),
                },
              ),
            ),*/
            // Contact Us Section
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Contact Us',
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'For any inquiries, please reach out to us at:',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Email: contact@housingsociety.com\nPhone: +1 234 567 890',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
