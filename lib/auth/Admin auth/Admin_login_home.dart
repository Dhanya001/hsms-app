import 'package:flutter/material.dart';
import 'package:hsms/auth/Admin%20auth/Admin_login.dart';

class AdminLoginPageHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Calculate padding as 5% of screen width
    double padding = screenWidth * 0.05;

    // Calculate image height as 30% of screen height
    double imageHeight = screenHeight * 0.4;
    return Scaffold(

    /*  appBar: AppBar(
        title: Text('Admin Login'),
      ),*/
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 2),
            Padding(
              padding: EdgeInsets.all(padding),
              child: Image.asset(
                'assets/16.jpg',
                height: imageHeight,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Admin Login',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            // Options for New Admin and Existing Admin
            _buildAdminOption(context, 'New Admin', Icons.person_add, _navigateToNewAdmin),
            SizedBox(height: 10),
            _buildAdminOption(context, 'Existing Admin', Icons.person, _navigateToExistingAdmin),
          ],
        ),
      ),
    );
  }

  Widget _buildAdminOption(BuildContext context, String title, IconData icon, Function navigate) {
    return ElevatedButton.icon(
      onPressed: () => navigate(context),
      icon: Icon(icon),
      label: Text(title),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15),
        textStyle: TextStyle(fontSize: 18),
      ),
    );
  }

  void _navigateToNewAdmin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewAdminPage()),
    );
  }

  void _navigateToExistingAdmin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AdminLoginPage()),
    );
  }
}

class NewAdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Admin Registration'),
      ),
      body: Center(
        child: Text('New Admin Registration Form'),
      ),
    );
  }
}

class ExistingAdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Existing Admin Login'),
      ),
      body: Center(
        child: Text('Existing Admin Login Form'),
      ),
    );
  }
}
