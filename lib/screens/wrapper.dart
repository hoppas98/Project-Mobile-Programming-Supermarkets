import 'package:otlobly/models/user.dart';
import 'package:otlobly/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:otlobly/screens/home/homepage.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      return HomePage();
    } else {
      return SignIn();
    }
  }
}
