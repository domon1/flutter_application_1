import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/appbar/appbar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CoffeMakerAppBar(preferredSize: Size.fromHeight(50)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                  onPressed: () {},  // TODO: history page
                  child: Text('Show history',
                      style: Theme.of(context).textTheme.labelMedium)),
              TextButton(
                  onPressed: () {},  // TODO: settings page
                  child: Text('Settings',
                      style: Theme.of(context).textTheme.labelMedium)),
              TextButton(
                  onPressed: () {
                    
                  },
                  child: Text('Выход',
                      style: Theme.of(context).textTheme.labelMedium))
            ],
          ),
        ),
      ),
    );
  }
}
