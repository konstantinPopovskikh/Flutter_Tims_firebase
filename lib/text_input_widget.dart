import 'package:flutter/material.dart';

class TextInputWidget extends StatefulWidget {
  final Function(String) callback;
  const TextInputWidget(this.callback, {Key? key}) : super(key: key);

  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final textController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
  }

  void click() {
    widget.callback(textController.text);
    textController.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) {
        click();
      },
      controller: textController,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.message),
          labelText: 'Type a message',
          suffixIcon: IconButton(
            onPressed: click,
            icon: const Icon(Icons.send),
            splashColor: Colors.blue,
          )),
    );
  }
}
