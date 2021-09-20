import 'package:flutter/material.dart';
import 'package:hello_flutter/post.dart';
import 'package:hello_flutter/post_list.dart';
import 'package:hello_flutter/text_input_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = [];

  void newPost(String text) {
    setState(() {
      if (text != '') {
        posts.add(Post(text, 'Kostya'));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Test App')),
        body: Column(
          children: [
            Expanded(child: PostList(posts)),
            TextInputWidget(newPost), // Expanded
            // makes sure that widged fills all the area available
          ],
        ));
  }
}
