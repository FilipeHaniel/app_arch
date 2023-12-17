import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class AppArchInput extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool isObscure;
  final FormFieldValidator<String>? validator;

  const AppArchInput({
    required this.label,
    required this.controller,
    required this.isObscure,
    this.validator,
    Key? key,
  }) : super(key: key);

  @override
  State<AppArchInput> createState() => _AppArchInputState();
}

class _AppArchInputState extends State<AppArchInput> {
  late bool secretText;

  @override
  void initState() {
    secretText = widget.isObscure;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: secretText,
      validator: widget.validator,
      decoration: InputDecoration(
        suffixIcon: widget.isObscure
            ? IconButton(
                icon: Icon(
                  secretText ? FeatherIcons.eyeOff : FeatherIcons.eye,
                  color: Colors.grey[700],
                ),
                onPressed: toggleVisibility,
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        // errorBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(5),
        //   borderSide: const BorderSide(color: Colors.red),
        // ),
        labelText: widget.label,
      ),
    );
  }

  void toggleVisibility() {
    setState(() => secretText = !secretText);
  }
}
