import 'package:flutter/material.dart';

class Bienvenido extends StatelessWidget {
  String username = "usuario";

  Bienvenido(this.username);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Perfil'),
              onTap: () {
                // Aquí puedes agregar la lógica para ir a la página de perfil
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configuración'),
              onTap: () {
                // Aquí puedes agregar la lógica para ir a la página de configuración
              },
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Nuevo Formulario'),
              onTap: () {
                // Regresa a la página de inicio al tocar este ícono
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: GestureDetector(
              onTap: () {
                _showAccessPopup(context);
              },
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    "Bienvenido\nUsuario: " + username,
                    style: TextStyle(fontSize: 20, color: Colors.blue),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ElevatedButton(
              onPressed: () {
                // Navegar de regreso al inicio
                Navigator.pop(context);
              },
              child: Text('Aceptar'),
            ),
          ),
        ],
      ),
    );
  }

  void _showAccessPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Column(
              children: [
                Icon(
                  Icons.check,
                  color: Colors.green, // Color of the check icon
                  size: 50.0, // Size of the icon
                ),
                Text('Acceso autorizado'),
              ],
            ),
          ),
          content: Text('Usuario: $username \nContraseña: $username'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }
}
