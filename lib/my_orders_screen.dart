import 'package:flutter/material.dart';

class MyOrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
          bottom: TabBar(
            labelColor: Colors.orange,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.orange,
            tabs: [
              Tab(text: 'Ongoing'),
              Tab(text: 'History'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            OngoingOrders(),
            HistoryOrders(),
          ],
        ),
      ),
    );
  }
}

class OngoingOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          OrderItem(
            restaurantName: 'Pizza Hut',
            category: 'Food',
            itemCount: '03 Items',
            status: 'Ongoing',
            showTimeChange: true,
            showCancelButton: true,
          ),
          OrderItem(
            restaurantName: 'McDonald',
            category: 'Drink',
            itemCount: '02 Items',
            status: 'Ongoing',
            showTimeChange: true,
            showCancelButton: true,
          ),
          OrderItem(
            restaurantName: 'Starbucks',
            category: 'Drink',
            itemCount: '01 Items',
            status: 'Ongoing',
            showTimeChange: true,
            showCancelButton: true,
          ),
        ],
      ),
    );
  }
}

class HistoryOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          OrderItem(
            restaurantName: 'Pizza Hut',
            category: 'Food',
            itemCount: '03 Items',
            status: 'Completed',
            showRateButton: true,
          ),
          OrderItem(
            restaurantName: 'McDonald',
            category: 'Drink',
            itemCount: '02 Items',
            status: 'Completed',
            showRateButton: true,
          ),
          OrderItem(
            restaurantName: 'Starbucks',
            category: 'Drink',
            itemCount: '01 Items',
            status: 'Canceled',
            showRateButton: false,
          ),
        ],
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  final String restaurantName;
  final String category;
  final String itemCount;
  final String status;
  final bool showTimeChange;
  final bool showRateButton;
  final bool showCancelButton;

  const OrderItem({
    required this.restaurantName,
    required this.category,
    required this.itemCount,
    this.status = 'Ongoing',
    this.showTimeChange = false,
    this.showRateButton = false,
    this.showCancelButton = false,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    if (status == 'Completed') {
      statusColor = Colors.green;
    } else if (status == 'Canceled') {
      statusColor = Colors.red;
    } else {
      statusColor = Colors.orange;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
                  Text(
                    '29 JAN, 12:30 • $itemCount',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              Spacer(),
              Text(
                status,
                style: TextStyle(
                  color: statusColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              if (showTimeChange)
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  child: Text('SAAT DEĞİŞTİR'),
                ),
              if (showTimeChange && showCancelButton) SizedBox(width: 8),
              if (showCancelButton)
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.orange),
                  ),
                  child: Text('Cancel'),
                ),
              if (showRateButton) SizedBox(width: 8),
              if (showRateButton)
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.orange),
                  ),
                  child: Text('Rate'),
                ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}