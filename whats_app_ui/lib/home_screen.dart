import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 1; // Default tab: Chats

  final List<Widget> _screens = [
    _buildCommunityScreen(),
    _buildChatScreen(),
    _buildStatusScreen(),
    _buildCallsScreen(),
    _buildChannelsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff075E54),
        title: const Text(
          'WhatsApp',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          const Icon(Icons.search, color: Colors.white),
          const SizedBox(width: 10),
          PopupMenuButton<int>(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onSelected: (value) {
              // Menu functionality
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 1, child: Text('New Group')),
              const PopupMenuItem(value: 2, child: Text('Settings')),
              const PopupMenuItem(value: 3, child: Text('Logout')),
            ],
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: const Color(0xff075E54),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.groups),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle_outlined),
            label: 'Status',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.broadcast_on_personal),
            label: 'Channels',
          ),
        ],
      ),
    );
  }

  static Widget _buildCommunityScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.groups, size: 80, color: Colors.grey),
          Text(
            'No communities yet',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  static Widget _buildChatScreen() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return const ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://avatarfiles.alphacoders.com/370/370978.jpeg'),
          ),
          title: Text('John Wick'),
          subtitle: Text('Where is my dog?'),
          trailing: Text('10:12 PM'),
        );
      },
    );
  }

  static Widget _buildStatusScreen() {
    return ListView(
      children: [
        const ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.green,
            child: Icon(Icons.add, color: Colors.white),
          ),
          title: Text('My Status'),
          subtitle: Text('Tap to add status update'),
        ),
        const Divider(),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Recent updates',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ),
        ListTile(
          leading: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.green, width: 3),
            ),
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://avatarfiles.alphacoders.com/370/370978.jpeg'),
            ),
          ),
          title: const Text('John Wick'),
          subtitle: const Text('Today, 12:30 PM'),
        ),
      ],
    );
  }

  static Widget _buildCallsScreen() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://avatarfiles.alphacoders.com/370/370978.jpeg'),
          ),
          title: const Text('John Wick'),
          subtitle: Text(index.isEven ? 'Missed voice call' : 'Video call, 5:30 PM'),
          trailing: Icon(index.isEven ? Icons.phone : Icons.video_call),
        );
      },
    );
  }

  static Widget _buildChannelsScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.broadcast_on_personal, size: 80, color: Colors.grey),
          Text(
            'No channels yet',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
