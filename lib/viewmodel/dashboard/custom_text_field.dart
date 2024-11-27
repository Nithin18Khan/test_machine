import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool isPassword;
  final String? Function(String?)? validator;

  const CustomTextInput({
    super.key,
    required this.labelText,
    required this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.normal),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.green, // Green border for the rectangle
              width: 2, // Thickness of the border
            ),
            borderRadius:
                BorderRadius.circular(8), // Rounded corners for the container
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              obscureText: isPassword,
              decoration: InputDecoration(
                hintText: hintText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      10), // Rounded corners for the input border
                  borderSide: BorderSide.none, // Removes the default border
                ),
                labelText: labelText,
                labelStyle: const TextStyle(fontSize: 14),
                hintStyle:
                    const TextStyle(color: Colors.grey), // Gray hint text
              ),
              validator: validator,
            ),
          ),
        ),
      ],
    );
  }
}