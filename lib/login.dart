import 'package:flutter/material.dart';
import 'package:hello_flutter/my_home_page.dart';

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
  String name = '';
  TextEditingController controller = TextEditingController();

  void click() {
    name = controller.text;
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MyHomePage(name: name)));
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.person),
              labelText: 'Type your name',
              border:
                  const OutlineInputBorder(borderSide: BorderSide(width: 5)),
              suffixIcon: IconButton(
                onPressed: click,
                tooltip: 'Submit',
                icon: const Icon(Icons.done),
                splashColor: Colors.blue,
              )),
        ),
      ),
    );
  }
}
