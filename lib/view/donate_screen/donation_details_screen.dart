import 'package:flutter/material.dart';

class DonationDetailsScreen extends StatefulWidget {
  const DonationDetailsScreen({super.key});

  @override
  State<DonationDetailsScreen> createState() => _DonationDetailsScreenState();
}

class _DonationDetailsScreenState extends State<DonationDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [TextField()],
      ),
    );
  }
}
