import 'package:flutter/material.dart';

class PersonalInfoScreen extends StatelessWidget {
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
          'Personal Info',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
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
            SizedBox(height: 4),
            SizedBox(height: 24),

            // Bilgi Kartı
            InfoDetailCard(
              icon: Icons.person_outline,
              label: 'FULL NAME',
              content: 'Enes Ismet',
            ),
            InfoDetailCard(
              icon: Icons.email_outlined,
              label: 'EMAIL',
              content: 'hello@halallab.co',
            ),
            InfoDetailCard(
              icon: Icons.phone_outlined,
              label: 'PHONE NUMBER',
              content: '408-841-0926',
            ),
          ],
        ),
      ),
    );
  }
}

class InfoDetailCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String content;

  const InfoDetailCard({
    required this.icon,
    required this.label,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.orange),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                content,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}