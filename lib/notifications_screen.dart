import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.grey),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Notifications',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
            labelColor: Colors.orange,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.orange,
            tabs: [
              Tab(text: 'Notification'),
              Tab(text: 'Messages (3)'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            NotificationList(),
            MessageList(),
          ],
        ),
      ),
    );
  }
}

class NotificationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        NotificationItem(
          title: 'Tanbir Ahmed Placed a new order',
          timeAgo: '20 min ago',
        ),
        NotificationItem(
          title: 'Salim Smith left a 5-star review',
          timeAgo: '20 min ago',
        ),
        NotificationItem(
          title: 'Royal Bengal agreed to cancel',
          timeAgo: '20 min ago',
        ),
        NotificationItem(
          title: 'Pabel Vuya Placed a new order',
          timeAgo: '20 min ago',
        ),
      ],
    );
  }
}

class MessageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        MessageItem(
          sender: 'Royal Parvej',
          message: 'Sounds awesome!',
          time: '19:37',
          unreadCount: 1,
        ),
        MessageItem(
          sender: 'Cameron Williamson',
          message: 'Ok, just hurry up a little bit...',
          time: '19:37',
          unreadCount: 2,
        ),
        MessageItem(
          sender: 'Ralph Edwards',
          message: 'Thanks dude.',
          time: '19:37',
        ),
        MessageItem(
          sender: 'Cody Fisher',
          message: 'How is going...?',
          time: '19:37',
        ),
        MessageItem(
          sender: 'Eleanor Pena',
          message: 'Thanks for the awesome food man...!',
          time: '19:37',
        ),
      ],
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String title;
  final String timeAgo;

  const NotificationItem({
    required this.title,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 8.0),
      leading: CircleAvatar(
        backgroundColor: Colors.grey[300],
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(timeAgo),
      trailing: Icon(Icons.more_vert, color: Colors.grey),
    );
  }
}

class MessageItem extends StatelessWidget {
  final String sender;
  final String message;
  final String time;
  final int? unreadCount;

  const MessageItem({
    required this.sender,
    required this.message,
    required this.time,
    this.unreadCount,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 8.0),
      leading: CircleAvatar(
        backgroundColor: Colors.grey[300],
      ),
      title: Text(
        sender,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(message),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            time,
            style: TextStyle(color: Colors.grey),
          ),
          if (unreadCount != null)
            Container(
              margin: EdgeInsets.only(top: 4.0),
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '$unreadCount',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }
}