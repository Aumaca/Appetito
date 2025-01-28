import 'package:flutter/material.dart';
import 'package:appetito/utils/routes.dart';
import 'package:appetito/utils/colors.dart';
import 'package:appetito/utils/auth/google_auth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
    } else {
      setState(() => _autoValidate = AutovalidateMode.always);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: SizedBox(
          height: 54,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: const Icon(
              Icons.local_pizza,
              color: Colors.white,
              size: 54,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Login Title
            Text(
              localizations.signupTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 50),
            Form(
              key: _formKey,
              autovalidateMode: _autoValidate,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Email
                  TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: localizations.signupEmail,
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                                .hasMatch(value)) {
                          return "Invalid email"; // Validation message
                        }
                        return null;
                      }),
                  // Name
                  TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: localizations.signupName,
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !RegExp(r'/^[A-Za-z\s]+$/').hasMatch(value)) {
                          return "Invalid Name"; // Validation message
                        }
                        return null;
                      }),
                  // Password
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: localizations.signupPassword,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 8) {
                        return "Password must be at least 8 characters"; // Validation message
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            // Submit button
            TextButton(
              onPressed: () => registerWithEmailAndPassword(
                _emailController.text,
                _passwordController.text,
              ),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(
                  AppColors.primaryColor,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    localizations.signupEnter,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.login,
                    color: Colors.white,
                    size: 16,
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, Routes.login),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    localizations.signupOrLogin,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.person,
                    size: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
