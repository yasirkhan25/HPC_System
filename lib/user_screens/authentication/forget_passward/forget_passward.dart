import 'package:flutter/material.dart';

class ForgetPasward extends StatefulWidget {
  const ForgetPasward({super.key});

  @override
  State<ForgetPasward> createState() => _ForgetPaswardState();
}

class _ForgetPaswardState extends State<ForgetPasward> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forget Passward",
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
      body: const Center(child: Text('forget passward screen')),
    );
  }
}
