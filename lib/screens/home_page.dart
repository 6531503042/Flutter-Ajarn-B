import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:dentist_appointment/screens/AppointmentTab.dart';
import 'package:dentist_appointment/screens/DoctorTab.dart';
import 'package:dentist_appointment/screens/ProfileTab.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  bool _showHeader = true;

  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = [
      HomeTab(showHeader: _showHeader),
      AppointmentTab(),
      DoctorTab(),
      ProfileTab(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _showHeader = index == 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _showHeader
          ? AppBar(
              title: Text(
                'Welcome, Username', // Must be user model not set name to display
                style: TextStyle(fontSize: 18),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {
                    // Add functionality for notifications
                  },
                ),
                IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () {
                    // Add functionality for calendar
                  },
                ),
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    // Add functionality for settings
                  },
                ),
              ],
            )
          : null,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Appointment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: 'Doctor',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 110, 197, 238),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  final bool showHeader;

  const HomeTab({Key? key, required this.showHeader}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        if (showHeader) Image.asset('assets/Banner Animate.png'),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 320, // Set the width here
              height: 84,
              padding: EdgeInsets.all(13),
              decoration: BoxDecoration(
                color: Color.fromRGBO(100, 100, 100,
                    0.05), // Adjust the opacity here (0.5 for 50% opacity)
                border: Border.all(
                    color: Color.fromRGBO(100, 100, 100,
                        0.05)), // Adjust the border color opacity
                borderRadius: BorderRadius.circular(16),
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'STI Problems?',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Find suitable specialists here',
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromRGBO(165, 157, 157, 1)),
                      ),
                    ],
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_forward, color: Colors.black),
                      onPressed: () {
                        // Add functionality for the arrow button
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 53.0),
              child: Text(
                'Popular dentist',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
        SizedBox(height: 18),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: <Widget>[
            _buildDoctorCard(
                'Dr. Praa', 4.5, 'assets/doctor1.png', 'assets/star.png'),
            _buildDoctorCard(
                'Dr. Bellamy R', 4.5, 'assets/doctor8.png', 'assets/star.png'),
            _buildDoctorCard(
                'Dr. Klimisch J', 4.5, 'assets/doctor3.png', 'assets/star.png'),
          ],
        ),
      ],
    ));
  }
}

Widget _buildDoctorCard(
    String name, double rating, String imagePath, String imagePath2) {
  return Card(
    elevation: 2, // Add elevation for a shadow effect
    child: InkWell(
      splashColor: Colors.green.shade200.withAlpha(30),
      onTap: () {
        // Add functionality for viewing doctor's profile
      },
      child: Container(
        width: 150,
        height: 150,
        padding: EdgeInsets.all(13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Image
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Image.asset(
                imagePath, // Use the provided imagePath
                width: 50,
                height: 50,
              ),
            ),

            // Doctor's name
            Text(
              name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
            // Star rating sentence
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Image.asset(
                      imagePath2, // Use the provided imagePath2 for the star image
                      width: 16,
                      height: 16,
                    ),
                  ),
                  TextSpan(
                    text: '${rating.toStringAsFixed(1)} (135 reviews)',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 143, 139, 139)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
