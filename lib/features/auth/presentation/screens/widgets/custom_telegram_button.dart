import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTelegramButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomTelegramButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 3,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Войти через Telegram',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            const SizedBox(width: 8),
            SvgPicture.asset(
              'assets/icons/logos_telegram.svg',
              width: 20,
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
