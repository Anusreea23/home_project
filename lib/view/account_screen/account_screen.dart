import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe8e6df),
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Center(
          child: Text(
            "My Account",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        leading: Icon(
          Icons.home,
          size: 28,
          color: Colors.white,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert_outlined,
                color: Colors.white,
              ))
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('Name'),
            subtitle: Text('John Doe'),
            leading: Icon(Icons.person),
          ),
          ListTile(
            title: Text('Email'),
            subtitle: Text('johndoe@example.com'),
            leading: Icon(Icons.email),
          ),
          ListTile(
            title: Text('Phone Number'),
            subtitle: Text('+123 456 7890'),
            leading: Icon(Icons.phone),
          ),
          // Add more ListTiles as needed
          ListTile(
            title: Text('Address'),
            subtitle: Text('123 Main St, Anytown, USA'),
            leading: Icon(Icons.location_on),
          ),
          ListTile(
            title: Text('Date of Birth'),
            subtitle: Text('January 1, 1990'),
            leading: Icon(Icons.cake),
          ),
        ],
      ),
    );
  }
}
