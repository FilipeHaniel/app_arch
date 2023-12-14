import 'package:flutter/material.dart';

class AppArchButton extends StatelessWidget {
  final String text;
  final Function()? action;
  final bool? isLoading;

  const AppArchButton({
    required this.text,
    this.action,
    this.isLoading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: action,
        child: Text(text),
      ),
    );
  }
}
