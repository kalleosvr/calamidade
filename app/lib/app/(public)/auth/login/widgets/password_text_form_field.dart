import 'package:flutter/material.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({
    super.key,
    this.validator,
    this.controller,
    this.hitText,
  });

  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String? hitText;

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  final ValueNotifier<bool> _passwordVisible = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _passwordVisible,
        builder: (context, state, __) {
          return TextFormField(
            controller: widget.controller,
            obscureText: !state,
            decoration: InputDecoration(
              hintText: widget.hitText,
              suffixIcon: IconButton(
                icon: Icon(state ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  _passwordVisible.value = !state;
                },
              ),
            ),
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            validator: widget.validator,
          );
        });
  }
}
