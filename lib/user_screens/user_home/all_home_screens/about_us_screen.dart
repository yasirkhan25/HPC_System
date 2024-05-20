import 'package:flutter/material.dart';

class AboutUS extends StatelessWidget {
  const AboutUS({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          "About Us",
                     style: Theme.of(context).textTheme.titleLarge,

        ),
        backgroundColor: const Color.fromRGBO(31, 79, 143, 1.0),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: Colors.white)),
      ),
      body: const Center(
        child: Text('Hi there I am Muhammad Saleem'),
      ),
    );
  }
}
