import 'package:dartz/dartz.dart';
import 'package:fin_app/domain/dummy/model/dummy_model.dart';
import 'package:fin_app/domain/failures/failures.dart';

abstract class DummyRepository {
  Future<Either<List<DummyModel>, AppFailure>> getAllDummyData();
}
