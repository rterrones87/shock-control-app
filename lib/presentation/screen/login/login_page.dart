import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_control_app/providers/auth_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible =
      false; // Estado para controlar la visibilidad de la contraseña
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Función para manejar el evento de "Iniciar Sesión"
  void _handleLogin() {
    print("Usuario: ${_usernameController.text}");
    print("Contraseña: ${_passwordController.text}");
  }

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<AuthProvider>(context, listen: false);
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: LayoutBuilder(builder: (context, constraints) {
          return Column(
            children: [
              SizedBox(
                height: constraints.maxHeight * 0.4,
                child: const Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Inicia Sesión",
                        style: TextStyle(
                            fontSize: 40,
                            color: Color(0xFF8F47E2),
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "Bienvenido de nuevamente",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF6A2DBF)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.6,
                width: double.infinity,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                    ),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xFF6A2DBF),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(2, 5),
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.only(left: 40),
                  height: double.infinity,
                  child: Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 50),
                        TextField(
                          controller: _usernameController,
                          decoration: const InputDecoration(
                            labelText: 'Usuario',
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _passwordController,
                          obscureText:
                              !_isPasswordVisible, // Cambia la visibilidad de la contraseña
                          decoration: InputDecoration(
                            labelText: 'Contraseña',
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 70),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              myProvider.login(_usernameController.text,
                                  _passwordController.text);
                            },
                            child: const Text("Iniciar Sesión"),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {},
                            child: const Text("Solicitar acceso"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
