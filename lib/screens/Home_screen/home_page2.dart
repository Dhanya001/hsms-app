import 'package:flutter/material.dart';
import 'package:hsms/screens/Home_screen/About_us.dart';
import 'package:hsms/screens/Home_screen/carousel_slider.dart';
import 'package:hsms/screens/Home_screen/card_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Map<String, dynamic>> _cardData = [
    {'title': 'Maintenance', 'description': 'Due: 5th July', 'icon': Icons.build},
    {'title': 'Security', 'description': 'Status: Active', 'icon': Icons.security},
    {'title': 'Gym', 'description': 'Open: 6 AM - 9 PM', 'icon': Icons.fitness_center},
    {'title': 'Swimming Pool', 'description': 'Open: 7 AM - 8 PM', 'icon': Icons.pool},
    //   {'title': 'Library', 'description': 'Open: 9 AM - 6 PM', 'icon': Icons.library_books},
    //   {'title': 'Community Hall', 'description': 'Available for booking', 'icon': Icons.event},
  ];
  final List<Widget> _children = [
    HomeScreen(),
    NoticesScreen(),
    ResidentsScreen(),
    SettingsScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Housing Society Management'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Navigation Drawer'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
                onTabTapped(0);
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notices'),
              onTap: () {
                Navigator.pop(context);
                onTabTapped(1);
              },
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Residents'),
              onTap: () {
                Navigator.pop(context);
                onTabTapped(2);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                onTabTapped(3);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        //clusor slider
        Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              CarouselSlider(),
              ],
          ),
        ),

        //card view
        Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              GridView.builder(
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
              ),
            ],
          ),
        ),

        // About Us Section
        Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset('assets/about_img.jpg'),
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
      //_children[_currentIndex],


      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notices',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Residents',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
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

class DataSearch extends SearchDelegate<String> {
  final recentSearches = ["Bill", "Maintenance", "Security"];
  final searchResults = ["Bill", "Maintenance", "Security", "Pool", "Gym"];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, query);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentSearches
        : searchResults.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.search),
        title: Text(suggestionList[index]),
        onTap: () {
          query = suggestionList[index];
          showResults(context);
        },
      ),
      itemCount: suggestionList.length,
    );
  }
}



class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home Screen'),
    );
  }
}

class NoticesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Notices Screen'),
    );
  }
}

class ResidentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Residents Screen'),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Settings Screen'),
    );
  }
}
