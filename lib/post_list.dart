import 'package:hello_flutter/post.dart';
import 'package:flutter/material.dart';

class PostList extends StatefulWidget {
  const PostList(this.listItems, {Key? key}) : super(key: key);
  final List<Post> listItems;

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  final GlobalKey<_PostListState> myKey = GlobalKey<_PostListState>();
  void refresh(Function likePost) {
    setState(() {
      likePost();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.listItems.length,
      itemBuilder: (context, index) {
        var post = widget.listItems[index];
        return Card(
          child: Row(
            children: [
              Expanded(
                  child: ListTile(
                title: Text(post.body),
                subtitle: Text(post.author),
              )),
              Row(
                children: [
                  Text(
                    post.likes.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                  IconButton(
                    onPressed: () => refresh(post.likePost),
                    icon: const Icon(Icons.thumb_up),
                    color: post.userLiked ? Colors.green : Colors.black,
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
