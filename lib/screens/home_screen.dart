import 'package:api_client/providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SizedBox(
            height: 100,
            width: width,
            child: ElevatedButton(
              onPressed: () {
                ref.read(homeScreenController.notifier).fetch();
              },
              child: const Text(
                'Button',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
