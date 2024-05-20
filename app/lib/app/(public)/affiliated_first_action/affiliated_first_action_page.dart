import 'package:coopartilhar/routes.dart';
import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class AffiliatedFirstActionPage extends StatefulWidget {
  const AffiliatedFirstActionPage({super.key});

  @override
  State<AffiliatedFirstActionPage> createState() =>
      _AffiliatedFirstActionPageState();
}

class _AffiliatedFirstActionPageState extends State<AffiliatedFirstActionPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const Image(image: CooImages.cooBackgroundDetails),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                  child: Image(image: CooImages.cooBrand2, height: 166)),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      'Bem-vindo',
                      style: TextStyle(
                          fontSize: 30,
                          color: CoopartilharColors.of(context).textColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      'Vamos prosseguir. O que você deseja fazer?',
                      textAlign: TextAlign.center,
                      style: textTheme.bodySmall!.copyWith(
                          fontSize: 24,
                          color: CoopartilharColors.of(context).textColor),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CardButton(
                      icon: const Image(image: CooImages.cooNeedHelp),
                      labelPrimary: 'Preciso de ajuda',
                      labelSecondary: 'Estou buscando recursos',
                      onPressed: () {
                        Routefly.navigate(routePaths.home);
                        Routefly.push(routePaths.newAskHelp);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CardButton(
                      icon: const Image(image: CooImages.cooWantToHelp),
                      labelPrimary: 'Quero ajudar!',
                      labelSecondary: 'Quero apadrinhar uma família',
                      onPressed: () {
                        Routefly.navigate(routePaths.home);
                        Routefly.push(routePaths.wantToHelp);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
