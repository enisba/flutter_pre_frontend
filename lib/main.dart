import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'home_dashboard.dart';
import 'my_orders_screen.dart';
import 'profile_screen.dart';
import 'track_order_screen.dart';
import 'food_list_screen.dart';
import 'add_new_item_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: UserSelectionScreen(),
    );
  }
}

class UserSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainScreen(userType: 'user')),
                );
              },
              child: Text('Continue as User'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainScreen(userType: 'marketOwner')),
                );
              },
              child: Text('Continue as Market Owner'),
            ),
          ],
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  final String userType;

  const MainScreen({required this.userType});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // Kullanıcı türüne göre ekran listesi
  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();

    if (widget.userType == 'user') {
      _screens = [
        HomeScreen(),
        TrackOrderScreen(),
        MyOrdersScreen(),
        ProfileScreen(),
      ];
    } else {
      _screens = [
        HomeDashboardScreen(),
        FoodListScreen(), // İkinci sekme market sahibi için food_list_screen
        MyOrdersScreen(),
        ProfileScreen(),
      ];
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: _buildCustomBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (widget.userType == 'marketOwner') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddNewItemScreen()),
            );
          }
        },
        backgroundColor: Colors.orange,
        child: Icon(Icons.add, size: 28),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  Widget _buildCustomBottomNavigationBar() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 6,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildBottomNavigationBarItem(Icons.grid_view, 0),
            _buildBottomNavigationBarItem(Icons.menu, 1), // İkinci sekme food_list_screen için
            SizedBox(width: 50), // Ortadaki floating button için boşluk
            _buildBottomNavigationBarItem(Icons.notifications, 2),
            _buildBottomNavigationBarItem(Icons.person, 3),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBarItem(IconData icon, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.orange : Colors.grey,
            size: 28,
          ),
          if (isSelected)
            Container(
              width: 5,
              height: 5,
              margin: EdgeInsets.only(top: 4),
              decoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}

// Market sahibinin ekleme ekranı (Örnek)
class MarketAddItemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item'),
      ),
      body: Center(
        child: Text('Market sahibi burada yeni ürünler ekleyebilir'),
      ),
    );
  }
}