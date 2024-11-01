import 'package:flutter/material.dart';
import 'personal_info_screen.dart';
import 'address_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_horiz, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profil Fotoğrafı ve Kullanıcı Adı
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.orange[100],
            ),
            SizedBox(height: 16),
            Text(
              'ENES ISMET',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 24),

            // Bilgi Kartları
            InfoCard(
              icon: Icons.person_outline,
              label: 'Personal Info',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PersonalInfoScreen(), // Geçiş yapılıyor
                  ),
                );
              },
            ),
            InfoCard(
              icon: Icons.location_on_outlined,
              label: 'Addresses',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddressScreen(), // AddressScreen'e geçiş yapılıyor
                  ),
                );
              },
            ),

            InfoCard(
              icon: Icons.rate_review_outlined,
              label: 'User Reviews',
              onTap: () {},
            ),
            InfoCard(
              icon: Icons.logout,
              label: 'Log Out',
              onTap: () {},
              isLast: true,
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isLast;

  const InfoCard({
    required this.icon,
    required this.label,
    required this.onTap,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 16),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.orange),
              SizedBox(width: 16),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}