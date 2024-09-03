import 'package:flutter/material.dart';
import 'package:responsive_dash_board/utils/app_styles.dart';

class TitleTextField extends StatelessWidget {
  const TitleTextField({super.key, required this.title, required this.hint});

  final String title, hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.styleSemiBold16,
        ),
        const SizedBox(
          height: 6,
        ),
        TextField(
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: AppStyles.styleRegular16
                  .copyWith(color: const Color(0xffAAAAAA)),
              fillColor: const Color(0xffFAFAFA),
              filled: true,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xffFAFAFA))),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xffFAFAFA))),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xffFAFAFA)))),
        ),
      ],
    );
  }
}
