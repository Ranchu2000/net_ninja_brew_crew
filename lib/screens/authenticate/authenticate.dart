import 'package:flutter/material.dart';
import 'package:net_ninja_brew_crew/screens/authenticate/register.dart';
import 'package:net_ninja_brew_crew/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  @override
  Widget build(BuildContext context) {
    void toggleView() {
      setState(() => showSignIn = !showSignIn);
    }

    if (showSignIn) {
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
