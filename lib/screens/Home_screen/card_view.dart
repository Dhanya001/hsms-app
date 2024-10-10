/*import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCard('Maintenance', 'Due: 5th July', Icons.build),
        _buildCard('Security', 'Status: Active', Icons.security),
        _buildCard('Gym', 'Open: 6 AM - 9 PM', Icons.fitness_center),
      ],
    );
  }*/

/*  Widget _buildCard(String title, String description, IconData icon) {
    return Card(
      margin: EdgeInsets.all(8.0),
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: ListTile(
        leading: Icon(icon, size: 40.0),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
      ),
    );
  }
}*/
import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  final List<Map<String, dynamic>> _cardData = [
    {'title': 'Maintenance', 'description': 'Due: 5th July', 'icon': Icons.build},
    {'title': 'Security', 'description': 'Status: Active', 'icon': Icons.security},
    {'title': 'Gym', 'description': 'Open: 6 AM - 9 PM', 'icon': Icons.fitness_center},
    {'title': 'Swimming Pool', 'description': 'Open: 7 AM - 8 PM', 'icon': Icons.pool},
 //   {'title': 'Library', 'description': 'Open: 9 AM - 6 PM', 'icon': Icons.library_books},
 //   {'title': 'Community Hall', 'description': 'Available for booking', 'icon': Icons.event},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 1.0,
      ),
      itemCount: _cardData.length,
      itemBuilder: (context, index) {
        return _buildCard(_cardData[index]);
      },
    );
  }

  Widget _buildCard(Map<String, dynamic> cardData) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(cardData['icon'], size: 40.0),
          SizedBox(height: 10.0),
          Text(cardData['title'], style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 5.0),
          Text(cardData['description']),
        ],
      ),
    );
  }
}
