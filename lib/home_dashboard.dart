import 'package:flutter/material.dart';
import 'dart:async';

class HomeDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'LOCATION',
              style: TextStyle(color: Colors.orange, fontSize: 12),
            ),
            Text(
              'BAM DONER',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_drop_down, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Durum Kartları
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => _showRunningOrders(context),
                  child: StatusCard(number: '20', label: 'RUNNING ORDERS'),
                ),
                StatusCard(number: '05', label: 'ORDER REQUEST'),
              ],
            ),
            SizedBox(height: 16),

            // Sipariş Listesi
            Expanded(
              child: ListView(
                children: [
                  OrderCard(orderName: 'KEBAB ISTEGI 2 ADET', customerName: 'BURAK', initialTime: Duration(minutes: 43, seconds: 19)),
                  OrderCard(orderName: 'KEBAB ISTEGI 2 ADET', customerName: 'BURAK', initialTime: Duration(minutes: 30)),
                  OrderCard(orderName: 'KEBAB ISTEGI 2 ADET', customerName: 'BURAK', initialTime: Duration(minutes: 15)),
                ],
              ),
            ),
            SizedBox(height: 16),

            // İnceleme Alanı
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange),
                      SizedBox(width: 8),
                      Text(
                        '4.9',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 4),
                      Text('Total 20 Reviews'),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('See All Reviews'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showRunningOrders(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (context, scrollController) {
            return Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "20 Running Orders",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return OrderListItem();
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

// Durum Kartı Widget'ı
class StatusCard extends StatelessWidget {
  final String number;
  final String label;

  const StatusCard({required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(
              number,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}

// Sipariş Kartı Widget'ı (Timer Özelliği ile)
class OrderCard extends StatefulWidget {
  final String orderName;
  final String customerName;
  final Duration initialTime;

  const OrderCard({
    required this.orderName,
    required this.customerName,
    required this.initialTime,
  });

  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  late Duration remainingTime;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    remainingTime = widget.initialTime;
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (remainingTime.inSeconds > 0) {
        setState(() {
          remainingTime -= Duration(seconds: 1);
        });
      } else {
        timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  String formatTime(Duration duration) {
    String minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    String seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.orderName, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(widget.customerName, style: TextStyle(color: Colors.grey)),
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  formatTime(remainingTime),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(width: 16),
              Icon(Icons.close, color: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }
}

// Sipariş Listesi İçin Öğeler
class OrderListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                color: Colors.grey[300],
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("2 KEBAB", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("BURAK", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: Text("Done"),
              ),
              SizedBox(width: 8),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(backgroundColor: Colors.white),
                child: Text("Cancel"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}