import 'package:flutter/material.dart';

class FoodListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
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
            'Food List',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
            isScrollable: true,
            labelColor: Colors.orange,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.orange,
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Kuru'),
              Tab(text: 'Taze'),
              Tab(text: 'Yemek'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FoodListTab(category: 'All'),
            FoodListTab(category: 'Kuru'),
            FoodListTab(category: 'Taze'),
            FoodListTab(category: 'Yemek'),
          ],
        ),
      ),
    );
  }
}

class FoodListTab extends StatelessWidget {
  final String category;

  const FoodListTab({required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          FoodItemCard(foodName: 'Chicken Thai Biriyani', category: 'Kuru', quantity: 3),
          FoodItemCard(foodName: 'Chicken Bhuna', category: 'Taze', quantity: 3),
          FoodItemCard(foodName: 'Mazalichiken Halim', category: 'Yemek', quantity: 3),
        ],
      ),
    );
  }
}

class FoodItemCard extends StatelessWidget {
  final String foodName;
  final String category;
  final int quantity;

  const FoodItemCard({
    required this.foodName,
    required this.category,
    required this.quantity,
  });

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
                  Text(foodName, style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      CategoryTag(category: category),
                      SizedBox(width: 8),
                      Text("QUANTITY: $quantity", style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Icon(Icons.more_vert, color: Colors.grey),
        ],
      ),
    );
  }
}

class CategoryTag extends StatelessWidget {
  final String category;

  const CategoryTag({required this.category});

  @override
  Widget build(BuildContext context) {
    Color tagColor;
    switch (category) {
      case 'Kuru':
        tagColor = Colors.orange;
        break;
      case 'Taze':
        tagColor = Colors.green;
        break;
      case 'Yemek':
        tagColor = Colors.red;
        break;
      default:
        tagColor = Colors.grey;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: tagColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        category.toUpperCase(),
        style: TextStyle(color: tagColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}