import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/ui/pages/profile/components/profile_page_body.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProfilePageBody(),
    );
  }
}
