import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class NewAskHelpPage extends StatefulWidget {
  const NewAskHelpPage({super.key, this.title = 'Solicitação'});
  final String title;

  @override
  State<NewAskHelpPage> createState() => _NewAskHelpPageState();
}

class _NewAskHelpPageState extends State<NewAskHelpPage> {
  late final GlobalKey<FormState> _formKey;
  String preApprovedValue = '7.500,00';

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
  }

  @override
  void dispose() {
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

  void _registerRequest() {
    if (_formKey.currentState!.validate()) {}
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
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                      textInputAction: TextInputAction.next,
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
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        hintText: 'Insira o CPF do Assistido',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'CPF não pode esta vazio';
                        }
                        return null;
                      },
                    ),
                    const TextInformationExtends(text: 'Chave pix'),
                    TextFormField(
                      controller: _pixKeyController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        hintText: 'Insira a chave pix do Assistido',
                      ),
                    ),
                    const TextInformationExtends(text: 'Banco'),
                    TextFormField(
                      controller: _bankController,
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.words,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        hintText: 'Insira o banco do Assistido',
                      ),
                    ),
                    const TextInformationExtends(text: 'Agência'),
                    TextFormField(
                      controller: _agencyController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        hintText: 'Insira a agência bancária do Assistido',
                      ),
                    ),
                    const TextInformationExtends(text: 'Conta'),
                    TextFormField(
                      controller: _accountController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        hintText: 'Insira a conta bancária do Assistido',
                      ),
                    ),
                    const TextInformationExtends(text: 'Valor*'),
                    TextFormField(
                      controller: _valueController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        hintText: 'R\$ 14.500,00',
                      ),
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
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                      textInputAction: TextInputAction.done,
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
