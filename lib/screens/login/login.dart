import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:appetito/utils/colors.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      print('Form is valid');
    } else {
      setState(() => _autoValidate = AutovalidateMode.always);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Login Title
            Text(
              localizations.loginTitle,
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
                        labelText: localizations.loginEmail,
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
                  // Password
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: localizations.loginPassword,
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
              onPressed: _submit,
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(
                  AppColors.primaryColor,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Send",
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
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    localizations.loginOrSignUp,
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
