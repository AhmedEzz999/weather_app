import 'package:flutter/material.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.cloud_off, size: 150, color: Colors.grey),
          Text(
            'No weather data available',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text(
            'Start searching for a city to see the weather information.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25, color: Colors.black54),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
