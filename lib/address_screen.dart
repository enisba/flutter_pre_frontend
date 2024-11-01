import 'package:flutter/material.dart';

class AddressScreen extends StatelessWidget {
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
          'My Address',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            AddressCard(
              addressType: 'HOME',
              address: '2464 Royal Ln. Mesa, New Jersey 45463',
              icon: Icons.home,
            ),
            AddressCard(
              addressType: 'WORK',
              address: '3891 Ranchview Dr. Richardson, California 62639',
              icon: Icons.business_center,
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Yeni adres ekleme işlemi burada yapılabilir
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                'ADD NEW ADDRESS',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddressCard extends StatelessWidget {
  final String addressType;
  final String address;
  final IconData icon;

  const AddressCard({
    required this.addressType,
    required this.address,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: addressType == 'HOME' ? Colors.blue : Colors.purple),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  addressType,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  address,
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.edit, color: Colors.orange),
            onPressed: () {
              // Adresi düzenleme işlemi burada yapılabilir
            },
          ),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              // Adresi silme işlemi burada yapılabilir
            },
          ),
        ],
      ),
    );
  }
}