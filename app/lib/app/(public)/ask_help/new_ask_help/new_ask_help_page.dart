import 'package:coopartilhar/app/(public)/auth/check_affiliated/check_affiliated_page.dart';
import 'package:coopartilhar/app/features/ask_help/entities/solicitation_entity.dart';
import 'package:coopartilhar/app/features/ask_help/interactor/controllers/ask_help_controller.dart';
import 'package:coopartilhar/injector.dart';
import 'package:coopartilhar/routes.dart';
import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewAskHelpPage extends StatefulWidget {
  const NewAskHelpPage({super.key, this.title = 'Solicitação'});

  final String title;

  @override
  State<NewAskHelpPage> createState() => _NewAskHelpPageState();
}

class _NewAskHelpPageState extends State<NewAskHelpPage> {
  late final GlobalKey<FormState> _formKey;
  String preApprovedValue = '7.500,00';

  final _controller = injector.get<AskHelpController>();

  bool asImage = false;
  String urlImage = '';

  late final TextEditingController _titleController;
  late final TextEditingController _cpfController;
  late final TextEditingController _pixKeyController;
  late final TextEditingController _bankController;
  late final TextEditingController _agencyController;
  late final TextEditingController _accountController;
  late final TextEditingController _valueController;
  late final TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _titleController = TextEditingController();
    _cpfController = TextEditingController();
    _pixKeyController = TextEditingController();
    _bankController = TextEditingController();
    _agencyController = TextEditingController();
    _accountController = TextEditingController();
    _valueController = TextEditingController();
    _descriptionController = TextEditingController();
    _controller.addListener(listener);
  }

  @override
  void dispose() {
    _controller.removeListener(listener);
    _titleController.dispose();
    _cpfController.dispose();
    _pixKeyController.dispose();
    _bankController.dispose();
    _agencyController.dispose();
    _accountController.dispose();
    _valueController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void listener() {
    if (_controller.value is SuccessState) {
      Routefly.replace(routePaths.requestDetails, arguments: {
        'id': (_controller.value as SuccessState<SolicitationEntity>).data.id
      });
    } else if (_controller.value is ErrorState<BaseException>) {
      Alerts.showFailure(
        context,
        (_controller.value as ErrorState<BaseException>).exception.message,
      );
    }
  }

  void _registerRequest() async {
    if (_formKey.currentState!.validate()) {
      // TODO - ajustar como serão implementados o id e as imagens.
      final newSolicitation = SolicitationEntity(
        id: 0,
        title: _titleController.text,
        cpf: _cpfController.text,
        pix: _pixKeyController.text,
        bank: _bankController.text,
        agency: _agencyController.text,
        account: _accountController.text,
        value: CurrencyAdapter.brlToDouble(_valueController.text),
        file: [],
        description: _descriptionController.text,
      );
      await _controller.saveSolicitation(solicitation: newSolicitation);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorsTheme = CoopartilharColors.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(UIcons.regularStraight.angle_small_left),
          onPressed: () {},
        ),
        title: Text(
          widget.title,
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const Image(image: CooImages.cooBackgroundDetails),
          Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Valor pré-aprovado',
                          style: textTheme.titleMedium,
                        ),
                        const SizedBox(height: 30),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 2,
                            horizontal: 8,
                          ),
                          decoration: BoxDecoration(
                            color: colorsTheme.lightGrey,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Text(
                            'R\$ $preApprovedValue',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: colorsTheme.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const TextInformationExtends(
                        text: 'Titulo da solicitação*'),
                    TextFormField(
                      controller: _titleController,
                      decoration: const InputDecoration(
                        hintText: 'Insira o titulo para solicitação',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Titulo não pode esta vazio';
                        }
                        return null;
                      },
                    ),
                    const TextInformationExtends(text: 'CPF do Assistido*'),
                    TextFormField(
                      controller: _cpfController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Insira o CPF do Assistido',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'CPF não pode esta vazio';
                        }
                        return null;
                      },
                      inputFormatters: [CpfCnpjFormatter()],
                    ),
                    const TextInformationExtends(text: 'Chave pix'),
                    TextFormField(
                      controller: _pixKeyController,
                      decoration: const InputDecoration(
                        hintText: 'Insira a chave pix do Assistido',
                      ),
                    ),
                    const TextInformationExtends(text: 'Banco'),
                    TextFormField(
                      controller: _bankController,
                      decoration: const InputDecoration(
                        hintText: 'Insira o banco do Assistido',
                      ),
                    ),
                    const TextInformationExtends(text: 'Agência'),
                    TextFormField(
                      controller: _agencyController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Insira a agência bancária do Assistido',
                      ),
                    ),
                    const TextInformationExtends(text: 'Conta'),
                    TextFormField(
                      controller: _accountController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Insira a conta bancária do Assistido',
                      ),
                    ),
                    const TextInformationExtends(text: 'Valor*'),
                    TextFormField(
                      controller: _valueController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'R\$ 14.500,00',
                      ),
                      inputFormatters: [CurrencyFormatter()],
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Valor não pode esta vazio';
                        }
                        return null;
                      },
                    ),
                    const TextInformationExtends(text: 'Enviar arquivo*'),
                    !asImage
                        ? InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                                color: colorsTheme.primary,
                              ),
                              child: Icon(
                                UIcons.regularStraight.clip,
                                color: colorsTheme.white,
                              ),
                            ),
                          )
                        : Image.network(
                            urlImage,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          ),
                    const TextInformationExtends(text: 'Breve descrição'),
                    TextFormField(
                      controller: _descriptionController,
                      maxLines: 8,
                      decoration: const InputDecoration(
                        hintText:
                            'Insira uma breve descrição sobre sua solicitação',
                      ),
                    ),
                    const SizedBox(height: 50),
                    CooButton(label: 'Próximo', onPressed: _registerRequest)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextInformationExtends extends StatelessWidget {
  const TextInformationExtends({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Text(text),
      ],
    );
  }
}

class CurrencyFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;
    final removedCharacters = text.replaceAll(RegExp('[^0-9]'), '');

    final maskedText = _applyMask(removedCharacters);
    return TextEditingValue(
      text: maskedText,
      selection: TextSelection.collapsed(offset: maskedText.length),
    );
  }

  String _applyMask(String text) {
    if (text.length <= 2) {
      return 'R\$ ,$text';
    } else if (text.length <= 3) {
      return 'R\$ ${text.substring(0, 1)},${text.substring(1, text.length)}';
    } else if (text.length <= 4) {
      return 'R\$ ${text.substring(0, 2)},${text.substring(2, text.length)}';
    } else if (text.length <= 5) {
      return 'R\$ ${text.substring(0, 3)},${text.substring(3, text.length)}';
    } else if (text.length <= 6) {
      return 'R\$ ${text.substring(0, 1)}.${text.substring(1, 4)},${text.substring(4, text.length)}';
    } else {
      return 'R\$ ${text.substring(0, 2)}.${text.substring(2, 5)},${text.substring(5, 7)}';
    }
  }
}
