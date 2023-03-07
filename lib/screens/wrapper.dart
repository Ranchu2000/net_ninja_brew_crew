import 'package:flutter/material.dart';
import 'package:net_ninja_brew_crew/models/user.dart';
import 'package:net_ninja_brew_crew/screens/authenticate/authenticate.dart';
import 'package:net_ninja_brew_crew/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<NinjaUser?>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
