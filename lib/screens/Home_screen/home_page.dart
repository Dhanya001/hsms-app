import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hsms/auth/Admin%20auth/Admin_login_home.dart';
import 'package:hsms/screens/Home_screen/bottom_navigation.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<String> imgList = [
    'assets/home_page.jpg',
    'assets/home_page2.jpg',
    'assets/home_page3.jpg',
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AdminLoginPageHome()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 3:
        HomePage();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          'HSMS',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[400],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/home_page.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Housing Society Management System',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            _buildDrawerItem(
              icon: Icons.home,
              text: 'Home',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            _buildDivider(),
            _buildDrawerItem(
              icon: Icons.favorite,
              text: 'Favorite Bhajan',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            _buildDrawerItem(
              icon: Icons.favorite,
              text: 'Favorite Abhang',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            _buildDrawerItem(
              icon: Icons.favorite,
              text: 'Favorite Gajar',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            _buildDrawerItem(
              icon: Icons.favorite,
              text: 'Favorite Gauvalan',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            _buildDivider(),
            _buildDrawerItem(
              icon: Icons.info,
              text: 'About Us',
              onTap: () {},
            ),
            _buildDrawerItem(
              icon: Icons.share,
              text: 'Share',
              onTap: () {},
            ),
            _buildDrawerItem(
              icon: Icons.star,
              text: 'Rate Us',
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildImageSlider(),
            _buildGridSection(),
            _buildAboutUsSection(),
            _buildContactUsSection(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }

  Widget _buildDrawerItem({required IconData icon, required String text, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.pinkAccent),
      title: Text(text),
      onTap: onTap,
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: Colors.grey,
      thickness: 1.5,
    );
  }

  Widget _buildImageSlider() {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 5),
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
      items: imgList.map((item) {
        return GestureDetector(
          onTap: () {
            // Handle image tap
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 2.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              image: DecorationImage(
                image: AssetImage(item),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildGridSection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 1.2,
        children: [
          HomePageItem(
            icon: Icons.build,
            title: 'Maintenance',
            description: 'Due: 5th July',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          HomePageItem(
            icon: Icons.event,
            title: 'Hall',
            description: 'Open: 9 AM - 6 PM',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          HomePageItem(
            icon: Icons.fitness_center,
            title: 'Gym',
            description: 'Open: 6 AM - 9 PM',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          HomePageItem(
            icon: Icons.pool,
            title: 'Swimming',
            description: 'Open: 7 AM - 8 PM',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          HomePageItem(
            icon: Icons.security,
            title: 'Security',
            description: 'Status: Active',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          HomePageItem(
            icon: Icons.event,
            title: 'Community Hall',
            description: 'Available for booking',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAboutUsSection() {
    return Padding(
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
    );
  }

  Widget _buildContactUsSection() {
    return Padding(
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
    );
  }
}

class HomePageItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;

  HomePageItem({required this.icon, required this.title, required this.onTap, required this.description});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: Colors.blue[400]),
            SizedBox(height: 8.0),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4.0),
            Text(description),
          ],
        ),
      ),
    );
  }
}





/*import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../auth/Admin_login_home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<String> _carouselImages = [
    'assets/home_page.jpg',
    'assets/home_page2.jpg',
    'assets/home_page3.jpg',
  ];

  final List<Map<String, dynamic>> _cardData = [
    {'title': 'Maintenance', 'description': 'Due: 5th July', 'icon': Icons.build},
    {'title': 'Hall', 'description': 'Open: 9 AM - 6 PM', 'icon': Icons.event},
    {'title': 'Gym', 'description': 'Open: 6 AM - 9 PM', 'icon': Icons.fitness_center},
    {'title': 'Swimming Pool', 'description': 'Open: 7 AM - 8 PM', 'icon': Icons.pool},
    {'title': 'Security', 'description': 'Status: Active', 'icon': Icons.security},
    {'title': 'Community Hall', 'description': 'Available for booking', 'icon': Icons.event},
  ];

  final List<Widget> _pages = [
    HomePageContent(),
    AdminLoginPageHome(),
    Center(child: Text('Notifications')),
    Center(child: Text('Profile')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xff333333),
      //backgroundColor: Color(0xff1E3A5F),
      backgroundColor: Color(0xffFFB74D),
      //backgroundColor: Color(0xffFFF8DC),
      appBar: AppBar(
        title: Text('HSMS'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Add search functionality here
            },
          ),
        ],
        backgroundColor: Color(0xffEADDCA),
      ),
      drawer: Drawer(

        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Housing Society Management',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.admin_panel_settings_sharp),
              title: Text('Admin Login'),
              onTap: () {
                Navigator.pop(context);
                _currentIndex = 1;
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _currentIndex = 2;
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _currentIndex = 3;
                });
              },
            ),
          ],
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.cyan,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.admin_panel_settings_sharp),
            label: 'Admin Login',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  final List<String> _carouselImages = [
    'assets/home_page.jpg',
    'assets/home_page2.jpg',
    'assets/home_page3.jpg',
  ];

  final List<Map<String, dynamic>> _cardData = [
    {'title': 'Maintenance', 'description': 'Due: 5th July', 'icon': Icons.build},
    {'title': 'Hall', 'description': 'Open: 9 AM - 6 PM', 'icon': Icons.event},
    {'title': 'Gym', 'description': 'Open: 6 AM - 9 PM', 'icon': Icons.fitness_center},
    {'title': 'Swimming Pool', 'description': 'Open: 7 AM - 8 PM', 'icon': Icons.pool},
    {'title': 'Security', 'description': 'Status: Active', 'icon': Icons.security},
    {'title': 'Community Hall', 'description': 'Available for booking', 'icon': Icons.event},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          // Carousel Slider Section
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
            items: _carouselImages.map((imagePath) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 2.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),

          // Grid Card View Section
          Padding(
            padding: EdgeInsets.all(8.0),
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
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
          ),

          // About Us Section
          Padding(
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

          /*// Map Section
          Container(
            height: 300.0,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(37.7749, -122.4194), // San Francisco
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
          Padding(
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
*/