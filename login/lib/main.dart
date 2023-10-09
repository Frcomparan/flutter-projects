import 'package:flutter/material.dart';
import 'Bienvenido.dart';

void main() {
  runApp(MiClase());
}

class MiClase extends StatelessWidget {
  const MiClase({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Multiformularios",
      theme: ThemeData.dark(),
      home: Pantalla(),
    );
  }
}

class Pantalla extends StatefulWidget {
  const Pantalla({super.key});

  @override
  State<Pantalla> createState() => _PantallaState();
}

class _PantallaState extends State<Pantalla> {
  final txtLogin = TextEditingController();
  final txtPassword = TextEditingController();

  String user = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login and Password")),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            alignment: Alignment.center,
            child: Image.asset(
              "images/logo.jpg",
              height: 150,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                TextFormField(
                  controller: txtLogin,
                  decoration: InputDecoration(labelText: 'Usuario'),
                ),
                TextFormField(
                  controller: txtPassword,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Contraseña'),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            alignment: Alignment.center,
            child: ElevatedButton.icon(
              onPressed: () {
                user = txtLogin.text;
                password = txtPassword.text;

                if (user == "123" && password == "123") {
                  Navigator.of(context).push(
                    MaterialPageRoute<Null>(
                      builder: (BuildContext context) {
                        return Bienvenido(user);
                      },
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Row(
                          children: [
                            Icon(
                              Icons.error,
                              color: Colors.red, // Color of the error icon
                            ),
                            SizedBox(width: 10),
                            Text("Resultado"),
                          ],
                        ),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: [Text("Verifica tus datos")],
                          ),
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Aceptar"),
                          )
                        ],
                      );
                    },
                  );
                }
              },
              icon: Icon(Icons.login),
              label: Text("Iniciar Sesión"),
            ),
          ),
        ],
      ),
    );
  }
}
