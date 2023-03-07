import 'package:flutter/material.dart';
import 'package:net_ninja_brew_crew/models/user.dart';
import 'package:net_ninja_brew_crew/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:net_ninja_brew_crew/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:net_ninja_brew_crew/models/user.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<NinjaUser?>.value(
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
