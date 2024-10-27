import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_control_app/presentation/screen/home/home_page.dart';
import 'package:school_control_app/presentation/screen/login/login_page.dart';
import 'package:school_control_app/providers/auth_provider.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  _AuthWrapperState createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  void initState() {
    super.initState();
    // Verificar el estado de autenticación al iniciar el widget
    Provider.of<AuthProvider>(context, listen: false).checkLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    // Determinar qué pantalla mostrar en función del estado de autenticación
    if (authProvider.isAuthenticated) {
      return const HomePage();
    } else {
      return const LoginPage();
    }
  }
}
