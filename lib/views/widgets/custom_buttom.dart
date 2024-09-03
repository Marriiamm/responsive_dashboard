import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, required this.backColor});

  final Text title;
  final Color backColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: WidgetStateProperty.all<double>(0),
          backgroundColor:
              WidgetStateProperty.all<Color>(backColor),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(12.0), // Set the border radius here
            ),
          ),
        ),
        onPressed: () {},
        child: title
      ),
    );
  }
}/**
elevation: 0,
          backgroundColor: const Color(0xff4EB7F2), */
