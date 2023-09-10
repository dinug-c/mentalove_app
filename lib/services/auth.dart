import 'package:flutter/material.dart';
import 'package:mentalove_app/ui/widgets/toast.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../main.dart';

void authLogin(BuildContext context, email, String password) async {
  try {
    AuthResponse res = await supabase.auth
        .signInWithPassword(email: email, password: password);
    if (res.user != null) {
      Navigator.pushReplacementNamed(context, '/main-page');
    }
  } catch (e) {
    showToast(context, e.toString());
  }
}

void authRegister(BuildContext context, String email, String password,
    String confirmPassword) async {
  if (password == confirmPassword) {
    try {
      List<String> parts = email.split('@');
      String username = parts[0];
      AuthResponse res = await supabase.auth.signUp(
          email: email, password: password, data: {'username': username});
      if (res.user != null) {
        Navigator.pushReplacementNamed(context, '/login');
        showToast(context, "Registrasi Berhasil, Email Konfirmai Terkirim");
      }
    } catch (e) {
      showToast(context, e.toString());
    }
  } else {
    showToast(context, "Password dan Konfirmasi Password Tidak Sama");
  }
}
