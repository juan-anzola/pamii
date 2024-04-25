import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final usurarioController = TextEditingController();
final contrasenaController = TextEditingController();

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(children: [
        BackgroundImage(),
        LoginText(),
        SafeArea(
            child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [LoginBox()]),
        ))
      ]),
    );
  }
}

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/fondo_login.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class LoginText extends StatelessWidget {
  const LoginText({super.key});
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                " Bienvenido",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "¡Es un gusto verte! ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LoginBox extends StatelessWidget {
  const LoginBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const LoginIcon(),
          const SizedBox(height: 5),
          TextField(
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              filled: true,
              fillColor: Colors.black87,
              labelText: "Usuario",
              labelStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            style: const TextStyle(color: Colors.white, fontSize: 20),
            controller: usurarioController,
          ),
          const SizedBox(
            height: 12,
          ),
          TextField(
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              filled: true,
              fillColor: Colors.black,
              labelText: "Contraseña",
              labelStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            style: const TextStyle(color: Colors.white, fontSize: 20),
            controller: contrasenaController,
            obscureText: true,
          ),
          const SizedBox(
            height: 10,
          ),
          const LoginButton()
        ],
      ),
    );
  }
}

class LoginIcon extends StatelessWidget {
  const LoginIcon({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset("assets/pamii_icon.png"));
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {

          _login(usurarioController, contrasenaController);
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(0, 255, 255, 255)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.8),
                    side: const BorderSide(color: Colors.white)))),
        child: const Text(
          'INICIAR SESION',
          style: TextStyle(
            color: Color.fromARGB(255, 237, 133, 58),
            letterSpacing: 2.5,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Nexa',
          ),
        ),
      ),
    );
  }

  void _login(TextEditingController usuarioController, TextEditingController contrasenaController) async {
    String endPoint = "http://20.121.74.131:3000/api/v1/auth/login";

    try {
      var response = await http.post(Uri.parse(endPoint), body: {
        'usuario': usurarioController.text,
        'contraseña': contrasenaController.text,
      });
      if (response.statusCode == 200) {
        print('Inicio de sesión exitoso');
      } else {
        print('Error en el inicio de sesión: ${response.statusCode}');
      }
    } catch (e) {
      print('Error de conexión: $e');
    }
  }
}
