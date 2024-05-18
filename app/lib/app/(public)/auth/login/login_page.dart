import 'package:coopartilhar/app/(public)/auth/login/widgets/password_text_form_field.dart';
import 'package:coopartilhar/app/features/auth/interactor/controllers/login_controller_impl.dart';
import 'package:coopartilhar/injector.dart';
import 'package:coopartilhar/routes.dart';
import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = injector.get<LoginControllerImpl>();

  @override
  void initState() {
    super.initState();
    controller.addListener(listener);
  }

  void listener() {
    return switch (controller.value) {
      ErrorState(:final exception) => Alerts.showFailure(context, exception.message),
      SuccessState() => Navigator.of(context).pushNamed(routePaths.welcome),
      _ => null,
    };
  }

  @override
  void dispose() {
    controller.removeListener(listener);
    super.dispose();
  }

  void _login() {
    if (controller.formKey.currentState!.validate()) {
      controller.login();
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorsTheme = CoopartilharColors.of(context);

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                const Center(child: Image(image: CooImages.cooBrand1)),
                const SizedBox(height: 60),
                Center(
                  child: Text(
                    'Login',
                    style: textTheme.titleLarge?.copyWith(
                      fontSize: 56,
                      color: colorsTheme.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 70),
                Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Informe o seu email',
                        style: textTheme.titleMedium?.copyWith(
                          color: colorsTheme.textColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        textCapitalization: TextCapitalization.none,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          hintText: 'Insira seu email',
                        ),
                        validator: controller.validatorEmpty('E-mail não pode está vazio'),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Senha',
                        style: textTheme.titleMedium?.copyWith(
                          color: colorsTheme.textColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      PasswordTextFormField(
                        controller: controller.passwordController,
                        hitText: 'Insira sua senha',
                        validator: controller.validatorEmpty('Senha não pode está vazia'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                CooButton.primary(
                  label: 'Entrar',
                  onPressed: _login,
                  size: const Size(double.infinity, 60),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
