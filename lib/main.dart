import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'widgets/firebase_options.dart';
import 'package:flutter/services.dart';
import 'package:provinha_god/screens/welcome.dart';
import 'package:signalr_netcore/signalr_client.dart';

final serverUrl = "wssflutter.azurewebsites.net/chatHub";

final hubConnection = HubConnectionBuilder().withUrl(serverUrl).build();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: firebaseOptions,
  );
  hubConnection.on("ReceiveMessage", (message) {
    print(message);
  });
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffedf2f6),
      ),
      home: Welcome(),
    );
  }
}
