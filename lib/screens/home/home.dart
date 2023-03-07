import 'package:flutter/material.dart';
import 'package:net_ninja_brew_crew/screens/home/brew_list.dart';
import 'package:net_ninja_brew_crew/screens/home/settings_form.dart';
import 'package:net_ninja_brew_crew/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:net_ninja_brew_crew/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/brew.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<Brew>>.value(
      initialData: [],
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Brew Crew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: [
            TextButton.icon(
              icon: Icon(Icons.person),
              onPressed: () async {
                await _auth.signOut();
              },
              label: Text('Logout'),
            ),
            TextButton.icon(
              onPressed: () => _showSettingsPanel(),
              icon: Icon(Icons.settings),
              label: Text('settings'),
            )
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
