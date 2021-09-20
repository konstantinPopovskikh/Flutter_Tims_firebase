import 'package:flutter/material.dart';
import 'package:hello_flutter/firebse_test.dart';
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

  void click() async {
    await FirebaseService().signInwithGoogle().then((value) => null);
  }

  Widget googleLoginButton() {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(45))),
        onPressed: click,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(image: AssetImage('assets/google_logo.png'), height: 35),
              Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('Sign in with Google',
                      style: TextStyle(color: Colors.grey, fontSize: 25)))
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            googleLoginButton(),
            ElevatedButton(
              onPressed: () {
                FirebaseService().signOutFromGoogle();
              },
              child: const Text('Sign Out'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GroceryStore()));
              },
              child: const Text('Firebase test'),
            )
          ],
        ));
  }
}
