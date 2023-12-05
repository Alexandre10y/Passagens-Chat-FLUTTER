import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provinha_god/screens/registro.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Registro(),
    );
  }
}

class Registro extends StatefulWidget {
  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/city2.jpg"), // Substitua pelo caminho da sua imagem
            fit: BoxFit.cover,
            opacity: 0.7,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'E-mail'),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              TextField(
                controller: senhaController,
                decoration: InputDecoration(labelText: 'Senha'),
                obscureText: true,
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () async {
                  await _registerUser();
                },
                child: Text('Registrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _registerUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: senhaController.text,
      );

      print('Usuário registrado com sucesso: ${userCredential.user?.uid}');
      
      // Você pode navegar para a próxima tela ou executar outras ações aqui após o registro bem-sucedido.
    } catch (e) {
      print('Erro durante o registro: $e');
      // Trate o erro aqui, por exemplo, exibindo uma mensagem ao usuário.
    }
  }
}
