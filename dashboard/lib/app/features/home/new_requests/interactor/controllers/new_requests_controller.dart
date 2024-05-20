import 'package:core_module/core_module.dart';
import 'package:dashboard/app/features/home/new_requests/interactor/entities/new_request_entity.dart';
import 'package:dashboard/app/features/home/new_requests/interactor/repositories/i_new_request_repository.dart';
import 'package:dashboard/app/features/home/new_requests/interactor/states/new_request_states.dart';

class NewRequestsController extends BaseController<BaseState> {
  final INewRequestRepository _repository;

  NewRequestsController(this._repository) : super(NewRequestsInitialState()) {
    fetchNewRequests();
  }

  Future<void> fetchNewRequests() async {
    update(NewRequestsLoadingState());

    //TODO: REMOVER O "MOCK" QUANDO TIVERMOS A PARTE DE AUTH/TOKEN RESOLVIDA
    // https://github.com/Flutterando/calamidade/issues/177

    await Future.delayed(const Duration(seconds: 2));

    final data = List.generate(
      23,
      (index) => NewRequestEntity(
        index,
        titleDescription: 'Reconstrução Telhado $index',
        name: 'João Maria da Silva $index',
        city: 'Estância Velha',
        phone: '+55 (51) 9 1234-5648',
        date: '15 de maio às 10h',
        status:
            index.isEven ? RequestStatusEnum.rejected : RequestStatusEnum.notDefined,
        requestedIncome: '3.500,00',
        bank: 'CooperBank',
        agency: 'Estância Velha',
        account: '+55 (51) 9 1234-5648',
        urlImage: 'url',
        description: 'Telhado',
      ),
    );

    NewRequestEntity? lastRequest;

    if (data.length.isOdd) {
      lastRequest = data.removeLast();
    }

    update(
      NewRequestsSuccessState(data: data, lastItem: lastRequest),
    );

    return;

    // ignore: dead_code
    _repository //
        .getNewRequest()
        .fold(
      (l) => update(NewRequestsErrorState(exception: l)),
      (r) {
        NewRequestEntity? lastRequest;

        if (r.length.isOdd) {
          lastRequest = r.removeLast();
        }

        update(NewRequestsSuccessState(data: r, lastItem: lastRequest));
      },
    );
  }

  void selectItem(int? itemId) {
    final newState = (state as NewRequestsSuccessState).copyWith(
      selectedId: itemId,
    );

    update(newState);
  }
}
