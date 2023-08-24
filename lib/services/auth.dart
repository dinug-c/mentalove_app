import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';

import '../ui/shared/theme.dart';
import '../ui/widgets/toast.dart';
import 'appwrite_client.dart';

register(TextEditingController emailController,
    TextEditingController passwordController, BuildContext context) async {
  try {
    final user = await account.create(
      userId: ID.unique(),
      email: emailController.text,
      password: passwordController.text,
    );
    user.status
        ? Navigator.pushReplacementNamed(context, '/main-page')
        : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text('Terjadi kesalahan, silahkan coba lagi'),
            backgroundColor: kPrimaryColor,
          ));
  } catch (e) {
    showToast(context, e.toString());
  }
}

login(TextEditingController emailController,
    TextEditingController passwordController, BuildContext context) async {
  try {
    final user = await account.createEmailSession(
      email: emailController.text,
      password: passwordController.text,
    );
    user.current
        ? Navigator.pushReplacementNamed(context, '/main-page')
        : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text('Terjadi kesalahan, silahkan coba lagi'),
            backgroundColor: kPrimaryColor,
          ));
  } catch (e) {
    showToast(context, e.toString());
  }
}
