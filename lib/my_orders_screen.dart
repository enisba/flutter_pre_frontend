import 'package:flutter/material.dart';

class MyOrdersScreen extends StatelessWidget {
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
          'My Orders',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sekme Başlıkları
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ongoing',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.orange,
                  ),
                ),
                Text(
                  'History',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Divider(color: Colors.orange, thickness: 2),
            SizedBox(height: 16),

            // Sipariş Listesi
            Expanded(
              child: ListView(
                children: [
                  OrderItem(
                    restaurantName: 'Pizza Hut',
                    category: 'Food',
                    itemCount: '02 Items',
                  ),
                  OrderItem(
                    restaurantName: 'McDonald',
                    category: 'Drink',
                    itemCount: '02 Items',
                  ),
                  OrderItem(
                    restaurantName: 'Starbucks',
                    category: 'Drink',
                    itemCount: '01 Items',
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

// Sipariş Öğesi (OrderItem) Widget'ı
class OrderItem extends StatelessWidget {
  final String restaurantName;
  final String category;
  final String itemCount;

  const OrderItem({
    required this.restaurantName,
    required this.category,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            color: Colors.grey[300],
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                restaurantName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(itemCount, style: TextStyle(color: Colors.grey)),
            ],
          ),
          Spacer(),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                child: Text('SAAT DEĞİŞTİR'),
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                child: Text('Cancel'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}