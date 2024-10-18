import 'package:flutter/material.dart';

class ProfileClass extends StatefulWidget {
  const ProfileClass({super.key});

  @override
  State<ProfileClass> createState() => _ProfileClassState();
}

class _ProfileClassState extends State<ProfileClass> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
              padding: EdgeInsets.all(0.0),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://example.com/profile-pic.jpg'), // Profile pic
                ),
                SizedBox(height: 10),
                Text(
                  'User Name', // Reddit-style user info
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Text(
                  'u/username', // Reddit-style username
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {}),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Subreddits'),
            onTap: () {
              // Navigate to Subreddits
            },
          ),
          ListTile(
            leading: const Icon(Icons.bookmark),
            title: const Text('Saved Posts'),
            onTap: () {
              // Navigate to Saved Posts
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            onTap: () {
              // Navigate to Notifications
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Navigate to Settings
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              // Handle Logout
            },
          ),
        ],
      ),
    );
  }
}
