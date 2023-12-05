import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

final serverUrl = 'wss://wssflutter.azurewebsites.net/chatHub';

class Chat extends StatefulWidget {
  const Chat({
    super.key,
    required this.title, required Icon children,
  });

  final String title;

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final TextEditingController _controller = TextEditingController();
  final _channel = WebSocketChannel.connect(
    Uri.parse(serverUrl),
  );

  List<String> messages = [];

  @override
  void initState() {
    super.initState();
    _channel.sink.add('{"protocol":"json","version":1}');
    _channel.stream.listen(_handleReceivedMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color(0xb8b5b5),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              child: TextFormField(
                controller: _controller,
                decoration: const InputDecoration(labelText: 'Send a message'),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(messages[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: 'Send message',
        child: const Icon(Icons.send),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      String pessoa = 'Você';
      String texto = _controller.text;
      setState(() {
        messages.add('$pessoa: $texto');
      });
      _channel.sink.add(
          '{"target":"SendMessage","arguments":["Ademar","$texto"],"type":1}');
    }
  }

  void _handleReceivedMessage(dynamic data) {
    if (data == null) return;
    final user = data
        .split(':')[3]
        .split(',')[0]
        .replaceAll("\"", "")
        .replaceAll('[', "");
    if (user == null) return;
    final message = data
        .split(':')[3]
        .split(',')[1]
        .split(',')[0]
        .replaceAll("\"", "")
        .replaceAll(']', "")
        .replaceAll('}', "")
        .replaceAll('', "");
    if (message == null) return;
    setState(() {
      messages.add('$user: $message');
    });
  }

  @override
  void dispose() {
    _channel.sink.close();
    _controller.dispose();
    super.dispose();
  }
}
