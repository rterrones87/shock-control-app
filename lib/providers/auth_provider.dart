import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  // Verificar si el usuario está autenticado al iniciar la app
  Future<void> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    _isAuthenticated = prefs.getBool('isAuthenticated') ?? false;
    notifyListeners();
  }

  // Iniciar sesión y guardar el estado en SharedPreferences
  Future<void> login(String username, String password) async {
    // Aquí iría la lógica de autenticación real
    if (username == "user" && password == "password") {
      _isAuthenticated = true;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isAuthenticated', true);
      notifyListeners();
    }
  }

  // Cerrar sesión y limpiar el estado en SharedPreferences
  Future<void> logout() async {
    _isAuthenticated = false;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('isAuthenticated');
    notifyListeners();
  }
}
