import 'package:flutter/material.dart';
import 'reviews_screen.dart';

class MarketProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'BAM DONER',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          // Header with business name and rating
          Container(
            color: Colors.orange,
            padding: EdgeInsets.symmetric(vertical: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HAYIRSEVERLIK PUANI',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 8),
                Text(
                  '4.7',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 48,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),

          // Options list
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              children: [
                ProfileOptionItem(
                  icon: Icons.info,
                  label: 'Restaurant Info',
                  onTap: () {
                  },
                ),
                Divider(),
                ProfileOptionItem(
                  icon: Icons.settings,
                  label: 'Settings',
                  onTap: () {

                  },
                ),
                Divider(),
                ProfileOptionItem(
                  icon: Icons.location_on,
                  label: 'Location',
                  onTap: () {
                  },
                ),
                Divider(),
                ProfileOptionItem(
                  icon: Icons.star,
                  label: 'User Reviews',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReviewsScreen()),
                    );
                  },
                ),
                Divider(),

                // Log Out button
                SizedBox(height: 24),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.logout, color: Colors.red),
                    title: Text(
                      'Log Out',
                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      // Log out action
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileOptionItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const ProfileOptionItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
      leading: CircleAvatar(
        backgroundColor: Colors.orange.withOpacity(0.2),
        child: Icon(icon, color: Colors.orange),
      ),
      title: Text(
        label,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
      onTap: onTap,
    );
  }
}