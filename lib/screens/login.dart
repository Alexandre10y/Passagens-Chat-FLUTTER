import 'package:flutter/material.dart';
import 'package:provinha_god/screens/home.dart';
import 'package:provinha_god/screens/registro.dart';

import '../widgets/login_bar.dart';

class Login extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: AppBar(
          title: Text('VIAJA-E'), // Adiciona o texto no canto superior esquerdo
          actions: [
            // Removemos a seta da direita
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/city2.jpg"),
            fit: BoxFit.cover,
            opacity: 0.7,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 115, 191, 250)),
                padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 40, vertical: 20)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                )),
                overlayColor: MaterialStateProperty.all(Color.fromARGB(255, 249, 250, 252).withOpacity(0.7)),
              ),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Ainda não possui uma conta? Crie agora!',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Registro()),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 164, 218, 191)),
                padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 40, vertical: 20)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                )),
                overlayColor: MaterialStateProperty.all(Color.fromARGB(255, 249, 250, 249).withOpacity(0.7)),
              ),
              child: Text(
                'Registrar',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
