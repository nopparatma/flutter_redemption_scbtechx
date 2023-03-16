import 'package:flutter/material.dart';
import 'package:flutter_redemption_scbtechx/ui/shared/theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.text, required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            elevation: 4,
            padding: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text ?? '',
                style: Theme.of(context).textTheme.large.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
