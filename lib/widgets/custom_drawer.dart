import 'package:design_your_house/const/app_images.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.splashIcon, // Replace with the image asset path for the drawer header image
                  height: 90,
                  width: 80,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Design Your House',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.star),
            title: const Text('Rate Us'),
            onTap: () {
              // Add functionality for Rate Us.
            },
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Share App'),
            onTap: () {
              // Add functionality for Share App.
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Privacy Policy'),
            onTap: () {
              // Add functionality for Privacy Policy.
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Version: 1.0.5'),
            onTap: () {
              // Add functionality for Version.
            },
          ),
        ],
      ),
    );
  }
}
