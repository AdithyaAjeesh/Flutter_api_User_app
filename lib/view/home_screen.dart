import 'package:flutter/material.dart';
import 'package:flutter_users_api_provider_app/controller/provider_functions.dart';
import 'package:flutter_users_api_provider_app/view/female_screen.dart';
import 'package:flutter_users_api_provider_app/view/male_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderFunctions>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                provider.fetchMaleUsers();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MaleScreen(),
                  ),
                );
              },
              child: const Text('Male Users'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                provider.fetchFemaleUsers();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FemaleScreen(),
                  ),
                );
              },
              child: const Text('FeMale Users'),
            ),
          ],
        ),
      ),
    );
  }
}
