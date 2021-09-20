import 'package:flutter/material.dart';
import 'package:hello_flutter/my_home_page.dart';
import 'google_auth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: const Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController controller = TextEditingController();

  void click() {
    FirebaseService().signInwithGoogle().then((value) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyHomePage(name: value.email.toString())));
    });
  }

  // Widget googleLoginButton() {
  //   return OutlinedButton(
  //     onPressed: click,
  //     child: const Text('Sign in with google'),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            child: const Text(
              'Sign in with Google',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              click();
            },
          ),
          ElevatedButton(
            child: const Text(
              'Sign out',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              FirebaseService().signOutFromGoogle();
            },
          ),
        ],
      ),
    );
  }
}
