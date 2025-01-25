import 'package:flutter/material.dart';
import 'package:appetito/screens/login/login.dart';
import 'package:appetito/screens/login/welcome.dart';
import 'package:appetito/utils/colors.dart';

class LoginController extends StatefulWidget {
  const LoginController({super.key});

  @override
  State<LoginController> createState() => _LoginController();
}

class _LoginController extends State<LoginController> {
  final controller = PageController(initialPage: 0);
  int _currentPage = 0;

  void goNextPage() {
    controller.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: SizedBox(
          height: 54,
          child: AnimatedAlign(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            alignment: _currentPage == 0
                ? Alignment.centerLeft
                : Alignment.center, // Align left or center
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
      ),
      body: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        children: [
          Welcome(goNextPage: goNextPage),
          const Login(),
        ],
      ),
    );
  }
}
