import 'package:flutter/material.dart';
import 'package:weather_app/widgets/user_text_field.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF52C4FF),
        title: const Text(
          'Search City',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        heightFactor: 4,
        child: Container(
          margin: const EdgeInsets.all(15),
          child: const UserTextField(),
        ),
      ),
    );
  }
}
