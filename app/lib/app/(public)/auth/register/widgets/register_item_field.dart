import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class RegisterItemField extends StatefulWidget {
  const RegisterItemField({
    super.key,
    required this.title,
    required this.controller,
    required this.hint,
    this.validator,
    this.isPassword = false,
  });

  final String title;
  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool isPassword;

  @override
  State<RegisterItemField> createState() => _RegisterItemFieldState();
}

class _RegisterItemFieldState extends State<RegisterItemField> {
  final ValueNotifier<bool> _passwordVisible = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = CoopartilharColors.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: textTheme.bodyMedium?.copyWith(color: colors.textColor),
        ),
        const SizedBox(height: 8),
        ValueListenableBuilder(
            valueListenable: _passwordVisible,
            builder: (context, passwordVisible, _) {
              return TextFormField(
                controller: widget.controller,
                obscureText: !passwordVisible,
                decoration: InputDecoration(
                  hintText: widget.hint,
                  suffixIcon: widget.isPassword
                      ? IconButton(
                          icon: Icon(passwordVisible ? UIcons.regularStraight.crossed_eye : UIcons.regularStraight.eye),
                          onPressed: () {
                            _passwordVisible.value = !passwordVisible;
                          },
                        )
                      : null,
                ),
                keyboardType: widget.isPassword ? TextInputType.visiblePassword : TextInputType.text,
                textInputAction: widget.isPassword ? TextInputAction.done : TextInputAction.next,
                validator: widget.validator,
                style: textTheme.displaySmall?.copyWith(height: 0.9, color: colors.textColor),
              );
            }),
      ],
    );
  }
}
