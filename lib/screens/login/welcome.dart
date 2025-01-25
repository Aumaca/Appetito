import 'package:flutter/material.dart';
import 'package:appetito/utils/colors.dart';
import 'package:appetito/utils/buttons/circular_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Welcome extends StatelessWidget {
  final void Function() goNextPage;

  const Welcome({super.key, required this.goNextPage});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 25,
            children: [
              Text(
                localizations.welcomeMessage1,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontFamily: "JosefinSans",
                  fontSize: 54,
                ),
              ),
              Text(
                localizations.welcomeMessage2,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontFamily: "JosefinSans",
                  fontSize: 54,
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: circularButton(
                  context,
                  goNextPage,
                  Colors.white,
                  const Icon(
                    Icons.arrow_circle_right_outlined,
                    color: AppColors.primaryColor,
                    size: 56,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
