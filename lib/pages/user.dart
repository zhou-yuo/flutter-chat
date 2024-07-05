import 'package:flutter/material.dart';
import '../components/bottom_nav_bar.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        title: const Text(
          'User',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: const Center(
        child: Text('User Page'),
      ),
      bottomNavigationBar: const BottomNavBar(index: 1),
    );
  }
}
