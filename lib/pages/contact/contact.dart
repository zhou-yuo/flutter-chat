import 'package:flutter/material.dart';
import '../../components/bottom_nav_bar.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
      ),
      body: const Center(
        child: Text('Contact Page'),
      ),
      bottomNavigationBar: const BottomNavBar(index: 1),
    );
  }
}
