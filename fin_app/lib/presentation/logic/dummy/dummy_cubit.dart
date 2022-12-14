import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fin_app/domain/connectivity/connectivity_repository.dart';
import 'package:fin_app/domain/dummy/model/dummy_model.dart';
import 'package:fin_app/domain/dummy/repository/dummy_repository.dart';
import 'package:fin_app/domain/failures/failures.dart';
import 'package:fin_app/presentation/screens/main_screen/main_screen.dart';
import 'package:injectable/injectable.dart';
part 'dummy_state.dart';

enum SortTypes {
  name,
  city,
  age,
}

@injectable
class DummyCubit extends Cubit<DummyState> {
  DummyCubit(this.dummyRepository, this.connectivityRepository)
      : super(DummyInitial());

  final DummyRepository dummyRepository;
  final ConnectivityRepository connectivityRepository;

  void getDummyDatas() async {
    emit(DummyLoading());
    final connection = await connectivityRepository.checkConnectivity();

    if (connection) {
      final result = await dummyRepository.getAllDummyData();

      result.fold((dummyData) {
        dummyData.sort((a, b) => a.name.compareTo(b.name));
        emit(DummySuccess(List.from(dummyData), SortTypes.name));
      }, (err) {
        emit(DummyError(err));
      });
    } else {
      emit(const DummyError(AppFailure(
          "It seems like thare is no internet connectiom found, please check your connection")));
    }
  }

  void sort(SortTypes type) {
    final currentState = state;

    if (currentState is DummySuccess) {
      if (type == SortTypes.name) {
        final dummyDatas = currentState.dummyDatas;

        dummyDatas.sort((a, b) => a.name.compareTo(b.name));
        emit(DummySuccess(List.from(currentState.dummyDatas), SortTypes.name));
      }
      if (type == SortTypes.city) {
        final dummyDatas = currentState.dummyDatas;

        dummyDatas.sort((a, b) => a.city.compareTo(b.city));
        emit(DummySuccess(List.from(currentState.dummyDatas), SortTypes.city));
        emit(DummySuccess(currentState.dummyDatas, type));
      }
      if (type == SortTypes.age) {
        final dummyDatas = currentState.dummyDatas;

        dummyDatas.sort((a, b) => a.age.compareTo(b.age));
        emit(DummySuccess(List.from(currentState.dummyDatas), SortTypes.age));
        emit(DummySuccess(currentState.dummyDatas, type));
      }
    }
  }
}
